output "nginx_container" {
  value = {
    hostname = docker_container.nginx.hostname
    id       = docker_container.nginx.id
    name     = docker_container.nginx.name
    ports    = docker_container.nginx.ports
  }
}