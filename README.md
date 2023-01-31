## ca-trk-proxy project

ca-trk-proxy is a TCP proxy in a container based on HaProxy to communicate with Commanders Act Products from your infrastructure.
This proxy doesn't manage SSL/TLS certificates, you need to manage it before the container.

## Quickstart

Starting ca-trk-proxy

`docker-compose up -d`

See [docker-compose.yml](docker-compose.yml)

### Endpoints

#### HTTP requests (port 80)

Clients HTTP requests -> Load Balancer or HTTP Proxy (not mandatory) -> ca-trk-proxy on port 80 -> Commanders Act Products

#### HTTPS requests (port 443)

Clients HTTPS requests -> Load Balancer or HTTP Proxy with your SSL/TLS certificates -> ca-trk-proxy on port 443 -> Commanders Act Products

#### Health check for HTTP requests (port 8080)

Example:
```sh
curl http://127.0.0.1:8080
```

HTTP status code 200 if port 80 is healthy:
```html
<html><body><h1>200 OK</h1>
Service ready.
</body></html>
```

HTTP status code 503 if port 80 is unhealthy:
```html
<html><body><h1>503 Service Unavailable</h1>
No server is available to handle this request.
</body></html>
```

#### Health check for HTTPS requests (port 8443)

Example:
```html
curl http://127.0.0.1:8443
```

HTTP status code 200 if port 443 is healthy:
```html
<html><body><h1>200 OK</h1>
Service ready.
</body></html>
```

HTTP status code 503 if port 443 is unhealthy:
```html
<html><body><h1>503 Service Unavailable</h1>
No server is available to handle this request.
</body></html>
```

#### Health check for HTTP and HTTPS requests (port 8666)

Example:
```sh
curl http://127.0.0.1:8666
```

HTTP status code 200 if ports 80 and 443 are healthy:
```html
<html><body><h1>200 OK</h1>
Service ready.
</body></html>
```

HTTP status code 503 if ports 80 or 443 are unhealthy:
```html
<html><body><h1>503 Service Unavailable</h1>
No server is available to handle this request.
</body></html>
```
