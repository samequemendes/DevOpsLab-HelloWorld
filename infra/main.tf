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
  name                = "${var.app_name}-${var.env}"
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = "Python 3.8 running on 64bit Amazon Linux 2"  # Plataforma exata conforme imagem

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

  setting {
    namespace = "aws:elasticbeanstalk:container:python"
    name      = "NumProcesses"
    value     = "3"
  }

  setting {
    namespace = "aws:elasticbeanstalk:container:python"
    name      = "NumThreads"
    value     = "20"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application"
    name      = "Application Healthcheck URL"
    value     = "/"
  }
}