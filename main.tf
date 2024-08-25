data "archive_file" "lambda_zip_node_app" {
  type = "zip"
  source_dir = "${path.module}/lambda-node-func"
  output_path = "${path.module}/lambda-node.zip"
}

module "iam-role" {
  source = "./module/iam-role"
  lambda-iam_role_name = var.lambda-iam_role_name
}

module "lamda-functions" {
source = "./module/lambda"
runtime = var.lambda-function_1_runtime
iam_role_arn = module.iam-role.lambda_iam_role_arn

function_name_1 = var.lambda-function_name_1
handler_1 = var.lambda-function_1_handler
file_name = data.archive_file.lambda_zip_node_app.output_path

function_name_2 = var.lambda-function_name_2
handler_2 = var.lambda-function_2_handler
}