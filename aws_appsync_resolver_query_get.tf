resource "aws_appsync_resolver" "query-getExample" {
  api_id            = aws_appsync_graphql_api.example.id
  type              = "Query"
  field             = "getExample"
  data_source       = aws_appsync_datasource.ddb.name
  kind              = "UNIT"
  request_template  = <<EOT
{
  "version": "2017-02-28",
  "operation": "GetItem",
  "key": {
    "Title": $util.dynamodb.toDynamoDBJson($ctx.args.Title),
  },
}
EOT
  response_template = "$util.toJson($context.result)"
}
