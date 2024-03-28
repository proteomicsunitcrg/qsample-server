# User manager

```
curl -X POST -H "Content-Type: application/json" -d @./username.json http://localhost:8099/api/auth/addUser
```

`username.json`
```json
{
  "firstname": "John",
  "lastname": "Doe",
  "username": "john@doe.com",
  "password": "123456",
  "agendo_id": 666
}
```



