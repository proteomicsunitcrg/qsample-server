# Agendo mock server (#161)

A tiny, zero-dependency (Python stdlib only) stand-in for the real Agendo
API, so you can exercise QSample's Agendo integration locally — including
error scenarios that are hard or impossible to trigger against the real
service — without needing real Agendo credentials or network access.

It implements the same 4 endpoints `RestService` (in `qsample-server`)
calls against the real Agendo:

- `GET /` — login
- `GET /requests/facility/{facility}/{dateFrom}/{dateTo}` — internal request list
- `GET /requests/user/{userId}/{dateFrom}/{dateTo}` — external request list
- `GET /requests/{id}` — single request

## Scenarios

Controlled by the `AGENDO_MOCK_SCENARIO` env var:

| Scenario | Behaviour |
|---|---|
| `ok` (default) | Well-formed response with one fake request (`2026NK999`) |
| `broken` | `{"success": false}` — Agendo's real "something went wrong" shape, no data. This is the exact case that used to crash QSample with a NullPointerException (#169) |
| `null-request` | `success: true` but the request field is explicitly `null` — a variant of the same bug |
| `http-error` | Every call returns HTTP 500 — simulates Agendo being fully down, not just returning a bad body |

## Running it standalone

```bash
AGENDO_MOCK_SCENARIO=broken python3 tools/agendo-mock/server.py
```

Listens on `0.0.0.0:8091` by default (override with `AGENDO_MOCK_PORT`).

## Running it alongside your local dev QSample (recommended)

Run it as a container on the same docker network as `docker-compose.dev.yml`,
so `qsample-server`'s `app` container can reach it by name:

```bash
# find your network name (usually <repo-folder-name>_qsample)
docker network ls | grep qsample

docker run -d --name agendo-mock \
  --network qsample-server_qsample --network-alias agendo-mock \
  -e AGENDO_MOCK_SCENARIO=broken \
  -v "$(pwd)/tools/agendo-mock/server.py:/server.py:ro" \
  -p 8091:8091 \
  python:3.12-slim python3 /server.py
```

Then point your **local** `docker-compose.dev.yml` at it (temporarily — do
not commit this change):

```yaml
AGENDO_URL: http://agendo-mock:8091
```

Rebuild the app so it picks up the new env var, then use QSample as normal
(the "Requests" list, a request detail page, etc.) — it'll all be talking
to the mock instead of the real Agendo:

```bash
docker compose -f docker-compose.dev.yml up -d --build app
```

To switch scenario, just recreate the mock container with a different
`AGENDO_MOCK_SCENARIO` (no need to touch qsample-server at all):

```bash
docker rm -f agendo-mock
docker run -d --name agendo-mock --network qsample-server_qsample --network-alias agendo-mock \
  -e AGENDO_MOCK_SCENARIO=ok \
  -v "$(pwd)/tools/agendo-mock/server.py:/server.py:ro" \
  -p 8091:8091 \
  python:3.12-slim python3 /server.py
```

**When you're done**, revert `AGENDO_URL` back to the real Agendo
(`https://apieurope.agendoscience.com`), rebuild `app` again, and remove
the mock container (`docker rm -f agendo-mock`).

## Automated tests

For CI/automated coverage (no container needed), see
`src/test/java/eu/crg/qsample/request/AgendoMalformedResponseUnitTest.java`
— it uses Spring's `MockRestServiceServer` to intercept the same HTTP call
in-process, which is faster and doesn't need Docker, but can't be used for
manual/exploratory testing through the actual running app and UI the way
this standalone mock can.
