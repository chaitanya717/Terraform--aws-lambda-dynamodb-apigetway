variable "lambda-iam_role_name" {}

resource "aws_iam_role" "iam-role" {
  name = var.lambda-iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Sid       = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  role = aws_iam_role.iam-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

output "lambda_iam_role_arn" {
    value = aws_iam_role.iam-role.arn 
}
