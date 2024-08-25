variable "function_name_1" {}
variable "function_name_2" {}
variable "runtime" {}
variable "iam_role_arn" {}
variable "handler_1" {}
variable "handler_2" {}
variable "file_name" {}
resource "aws_lambda_function" "lambda-function-1" {
  function_name = var.function_name_1
  
  role = var.iam_role_arn

  handler = var.handler_1

  runtime = var.runtime

  filename = var.file_name

  source_code_hash = filebase64sha256(var.file_name)

  environment {
    variables = {
        LOG_LEVEL = "INFO1"
    }
  }
  
}
resource "aws_lambda_function" "lambda-function-2" {
  function_name = var.function_name_2

  role = var.iam_role_arn

  handler = var.handler_2

  runtime = var.runtime

  filename = var.file_name

  source_code_hash = filebase64sha256(var.file_name)

  environment {
    variables = {
        LOG_LEVEL = "INFO2"
    }
  }
  
}