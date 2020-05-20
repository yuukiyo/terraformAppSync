resource "aws_appsync_api_key" "example" {
  api_id  = aws_appsync_graphql_api.example.id
  expires = "2020-12-31T23:00:00Z"
}
