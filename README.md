The idea is to create a rails api for url shortening.

I want to have decoupled [frontend](https://github.com/itsmaia/urlshortener-frontend) and backend, with the frontend in VueJs. This is the backend repository.

---
#### Usage

### Create an API key

```
curl -v -X POST http://localhost:4000/api-keys \
    -u example@example.com:secret
```

Responses

201 created
```json
{"id":1,"bearer_id":1,"bearer_type":"User","token":"d5bca41ba702551396d792598b599672","created_at":"2023-01-26T22:46:16.522Z","updated_at":"2023-01-26T22:46:16.522Z"}
```

401 unauthorized
```json
{}
```

### List your API keys

```
curl -v -X GET http://localhost:4000/api-keys \
    -H 'Authorization: Bearer d5bca41ba702551396d792598b599672'
```

Responses

200 ok
```json
{"id":1,"bearer_id":1,"bearer_type":"User","token":"d5bca41ba702551396d792598b599672","created_at":"2023-01-26T22:46:16.522Z","updated_at":"2023-01-26T22:46:16.522Z"}
```

401 unauthorized
```json
{}
```
### Destroy a API key

```
curl -v -X DELETE http://localhost:4000/api-keys \
    -H 'Authorization: Bearer d5bca41ba702551396d792598b599672'
```

Responses

```
HTTP/1.1 204 No Content
```


### List all shortened urls [GET]

```/api/urls```

Responses

200 success
```json
{
  "id": 01,
  "address": "http://example.com",
  "key": "QF3jZQ"
},
{
  "id": 02,
  "address": "http://lorem.com",
  "key": "MTKMPw"
}
```

### Create shortened url [POST]

```/api/urls```

Request

```json
{
  "address": "http://example.com"
}
```

Responses

201 created
```json
{
  "id": 01,
  "address": "http://example.com",
  "key": "6L0bNg",
  "clicks_count": null,
  "created_at": "2023-01-25T22:52:51.839Z",
  "updated_at": "2023-01-25T22:52:51.839Z"
}
```

422 unprocessable entity
```json
{
  [
    "Address is not a valid URL"
  ]
}
```
### Retrieve shortened url by key [GET]

```/api/urls/:key```

Responses

302 found
```json
{
  "id": 01,
  "address": "http://example.com",
  "key": "QF3jZQ",
  "clicks_count": null,
  "created_at": "2023-01-25T20:31:44.513Z",
  "updated_at": "2023-01-25T20:31:44.513Z"
}
```
404 not found
```json
{}
```
