resource "aws_appsync_datasource" "lambda" {
  api_id           = aws_appsync_graphql_api.example.id
  name             = "lambda"
  type             = "AWS_LAMBDA"
  description      = "lambda example"
  service_role_arn = aws_iam_role.example.arn
  lambda_config {
    function_arn = aws_lambda_function.example.arn
  }
}
