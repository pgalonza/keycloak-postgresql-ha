services {
  name = "keycloak"
  id   = "keycloak1"
  port = 8081
  address = "keycloak1"
  checks = {
    name = "http"
    id = "http"
    http = "http://keycloak1:9000/health/ready"
    interval = "3s"
  }
}
services {
  name = "keycloak"
  id   = "keycloak2"
  port = 8081
  address = "keycloak2"
  checks = {
    name = "http"
    id = "http"
    http = "http://keycloak2:9000/health/ready"
    interval = "3s"
  }
}