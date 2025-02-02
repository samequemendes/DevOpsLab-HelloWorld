variable "app_name" {
  description = "Nome do aplicativo"
  type        = string
}

variable "app_language" {
  description = "Linguagem da aplicação"
  type        = string
  default     = "Python"
}

variable "app_language_version" {
  description = "Versão da linguagem"
  type        = string
  default     = "3.8"
}

variable "aws_region" {
  description = "Região AWS onde o ambiente será criado"
  type        = string
}
