#!/usr/bin/env python3
"""
Dummy Agendo-like endpoint (#161), for manually exercising QSample's Agendo
integration in dev without needing real Agendo credentials or network access.

Zero third-party dependencies (stdlib http.server only).

Usage:
    AGENDO_MOCK_SCENARIO=ok python3 server.py       # realistic, well-formed response
    AGENDO_MOCK_SCENARIO=broken python3 server.py   # success:false, no "request" key (#169's bug)
    AGENDO_MOCK_SCENARIO=null-request python3 server.py  # "request": null explicitly
    AGENDO_MOCK_SCENARIO=http-error python3 server.py    # HTTP 500 on every call

Point qsample-server's AGENDO_URL at this server's address (e.g.
http://agendo-mock:8091 if run as a sibling container on the same docker
network, or http://localhost:8091 if run directly on the host and
qsample-server is also run outside docker) and restart the app.
"""

import json
import os
from http.server import BaseHTTPRequestHandler, HTTPServer

PORT = int(os.environ.get("AGENDO_MOCK_PORT", "8091"))
SCENARIO = os.environ.get("AGENDO_MOCK_SCENARIO", "ok")

SAMPLE_REQUEST = {
    "id": 99999,
    "ref": "2026NK999",
    "group": "Mock Lab",
    "class": "Proteome label-free quantification (DIA)",
    "date_created": "2026-01-01 10:00:00",
    "status": "Waiting for group approval",
    "account": "mock-account",
    "total": "0.0000",
    "delivery_date": None,
    "delivery_location": None,
    "comment": "",
    "last_action": {
        "user": {"id": 1, "name": "Mock User", "email": "mock@crg.eu"},
        "date": "2026-01-01 10:00:00",
        "action": "Group approved",
    },
    "created_by": {"id": 1, "name": "Mock User", "email": "mock@crg.eu"},
    "products": [],
    "fields": [],
    "samples": [],
}

LOGIN_RESPONSE = {"success": True, "token": "mock-token", "user": {"id": 1, "email": "mock@crg.eu"}}


def listing_body():
    if SCENARIO == "broken":
        return {"success": False, "count": 0}
    if SCENARIO == "null-request":
        return {"success": True, "count": 0, "request": None}
    return {"success": True, "count": 1, "request": [SAMPLE_REQUEST]}


class Handler(BaseHTTPRequestHandler):
    def _send_json(self, status, body):
        payload = json.dumps(body).encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(payload)))
        self.end_headers()
        self.wfile.write(payload)

    def do_GET(self):
        if SCENARIO == "http-error":
            self._send_json(500, {"error": "mock Agendo failure"})
            return

        if self.path == "/":
            self._send_json(200, LOGIN_RESPONSE)
        elif self.path.startswith("/requests/facility/") or self.path.startswith("/requests/user/"):
            self._send_json(200, listing_body())
        elif self.path.startswith("/requests/"):
            if SCENARIO == "broken":
                self._send_json(200, {"success": False})
            elif SCENARIO == "null-request":
                self._send_json(200, {"success": True, "request": None})
            else:
                self._send_json(200, {"success": True, "request": SAMPLE_REQUEST})
        else:
            self._send_json(404, {"error": "not found"})

    def log_message(self, format, *args):
        print(f"[agendo-mock:{SCENARIO}] {self.address_string()} - {format % args}")


if __name__ == "__main__":
    print(f"[agendo-mock] listening on 0.0.0.0:{PORT}, scenario='{SCENARIO}'")
    HTTPServer(("0.0.0.0", PORT), Handler).serve_forever()
