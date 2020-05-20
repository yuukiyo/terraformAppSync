resource "aws_dynamodb_table" "example" {
  name           = "example"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "Title"

  attribute {
    name = "Title"
    type = "S"
  }
}

resource "aws_appsync_datasource" "ddb" {
  api_id           = aws_appsync_graphql_api.example.id
  name             = "tf_appsync_example"
  type             = "AMAZON_DYNAMODB"
  description      = "DynamoDB exampleテーブル"
  service_role_arn = aws_iam_role.example.arn
  dynamodb_config {
    region                 = "ap-northeast-1"
    table_name             = aws_dynamodb_table.example.name
    use_caller_credentials = false
  }
}
