resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  hostname = "localhost"
  image    = docker_image.nginx.image_id
  name     = "nginx-container"
  healthcheck {
    test     = ["CMD", "curl", "-f", "http://localhost"]
    interval = "30s"
    timeout  = "10s"
    retries  = 3
  }
  ports {
    internal = var.port_internal
    external = var.port_external
  }
}

