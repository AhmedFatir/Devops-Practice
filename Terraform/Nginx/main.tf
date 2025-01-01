terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "unix:///Users/afatir/.docker/run/docker.sock"
}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image    = docker_image.nginx.image_id
  name     = "nginx-container"
  hostname = "localhost"
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

