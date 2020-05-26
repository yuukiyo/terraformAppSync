resource "aws_appsync_graphql_api" "example" {
  authentication_type = "API_KEY"
  name                = "example"
  xray_enabled        = true

  additional_authentication_provider {
    authentication_type = "AWS_IAM"
  }

  log_config {
    cloudwatch_logs_role_arn = aws_iam_role.example.arn
    field_log_level          = "ERROR"
  }
  schema = <<EOF
input CreateExampleInput {
	Title: String!
}

type Example {
	Title: String!
	Message: String!
}

type ExampleConnection {
	items: [Example]
	nextToken: String
}

type Mutation {
	createExample(input: CreateExampleInput!): Example
}

type Query {
	getExample(Title: String!): Example
	listExamples(filter: TableExampleFilterInput, limit: Int, nextToken: String): ExampleConnection
}

type Subscription {
	onCreateExample(Title: String): Example
		@aws_subscribe(mutations: ["createExample"])
}

input TableExampleFilterInput {
	Title: TableStringFilterInput
}

input TableStringFilterInput {
	ne: String
	eq: String
	le: String
	lt: String
	ge: String
	gt: String
	contains: String
	notContains: String
	between: [String]
	beginsWith: String
}
EOF
}
