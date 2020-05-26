resource "aws_appsync_datasource" "none" {
  api_id           = aws_appsync_graphql_api.example.id
  name             = "none"
  type             = "NONE"
  description      = "none example"
}
