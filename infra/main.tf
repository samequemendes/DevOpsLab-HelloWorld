# Aplicação Elastic Beanstalk
resource "aws_elastic_beanstalk_application" "app" {
  name        = var.app_name
  description = "Aplicação ${var.app_name} rodando em ${var.app_language} ${var.app_version}"
}

# Ambiente Elastic Beanstalk
resource "aws_elastic_beanstalk_environment" "env" {
  name                = "${var.app_name}-env"
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.5.4 running ${var.app_language} ${var.app_version}"

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "LoadBalanced"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t3.micro"
  }
}
