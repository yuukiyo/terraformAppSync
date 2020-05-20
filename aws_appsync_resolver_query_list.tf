resource "aws_appsync_resolver" "query-listExamples" {
  api_id            = aws_appsync_graphql_api.example.id
  type              = "Query"
  field             = "listExamples"
  data_source       = aws_appsync_datasource.ddb.name
  kind              = "UNIT"
  request_template  = <<EOT
{
  "version": "2017-02-28",
  "operation": "Scan",
  "filter": #if($context.args.filter) $util.transform.toDynamoDBFilterExpression($ctx.args.filter) #else null #end,
  "limit": $util.defaultIfNull($ctx.args.limit, 20),
  "nextToken": $util.toJson($util.defaultIfNullOrEmpty($ctx.args.nextToken, null)),
}
EOT
  response_template = "$util.toJson($context.result)"
}
