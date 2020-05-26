resource "aws_appsync_resolver" "Example-Message" {
  api_id            = aws_appsync_graphql_api.example.id
  type              = "Example"
  field             = "Message"
  data_source       = aws_appsync_datasource.none.name
  kind              = "UNIT"
  request_template  = <<EOT
{
    "version": "2017-02-28",
    "payload": "none-yoo"
}
EOT
  response_template = "$util.toJson($context.result)"
}
