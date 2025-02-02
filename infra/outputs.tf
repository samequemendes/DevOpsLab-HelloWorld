output "alb_dns_name" {
  description = "Endereço DNS do Application Load Balancer (ALB) da aplicação"
  value       = aws_elastic_beanstalk_environment.env.endpoint_url
}
