resource "aws_appsync_resolver" "mutation-createExample" {
  api_id            = aws_appsync_graphql_api.example.id
  type              = "Mutation"
  field             = "createExample"
  data_source       = aws_appsync_datasource.ddb.name
  kind              = "UNIT"
  request_template  = <<EOT
{
  "version": "2017-02-28",
  "operation": "PutItem",
  "key": {
    "Title": $util.dynamodb.toDynamoDBJson($ctx.args.input.Title),
  },
  "attributeValues": $util.dynamodb.toMapValuesJson($ctx.args.input),
  "condition": {
    "expression": "attribute_not_exists(#Title)",
    "expressionNames": {
      "#Title": "Title",
    },
  },
}
EOT
  response_template = "$util.toJson($context.result)"
}
