The idea is to create a rails api for url shortening.

I want to have decoupled [frontend](https://github.com/itsmaia/urlshortener-frontend) and backend, with the frontend in VueJs. This is the backend repository.

---
#### Usage

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
