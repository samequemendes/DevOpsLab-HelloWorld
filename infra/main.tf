# Criando um Bucket S3 para armazenar os pacotes da aplicação
resource "aws_s3_bucket" "beanstalk_bucket" {
  bucket = "${var.app_name}-bucket-deploy"
}

# Criando a aplicação no Elastic Beanstalk
resource "aws_elastic_beanstalk_application" "app" {
  name        = var.app_name
  description = "Aplicação ${var.app_name} no Elastic Beanstalk"
}

# Criando o ambiente do Elastic Beanstalk
resource "aws_elastic_beanstalk_environment" "env" {
  name                = "${var.app_name}-env"
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.0.3 running Python 3.8"

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
