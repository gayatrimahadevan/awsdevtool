output "nlb-dns" {
  description = "The DNS of the load balancer we created."
  value       = aws_lb.nlb.dns_name
}
