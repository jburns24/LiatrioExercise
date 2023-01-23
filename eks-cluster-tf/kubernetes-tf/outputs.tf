# had to explore `terraform show` after running `terrafrom apply`
# to see what the structure of the kubernetes_service resource was.
output "service_endpoint" {
  description = "Service endpoint"
  value       = kubernetes_service.rest-api.status.0.load_balancer.0.ingress.0.hostname
}
