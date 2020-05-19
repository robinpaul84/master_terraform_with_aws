resource "aws_api_gateway_rest_api" "api" {
  name = "myapi"
}

#create a resource with name 'resource' in the gateway api , many resources can be created like this
resource "aws_api_gateway_resource" "resource" {
  path_part   = "resource"
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.api.id
  depends_on = [aws_api_gateway_rest_api.api]
}

resource "aws_api_gateway_method" "method" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = "GET"
  authorization = "NONE"
  depends_on = [aws_api_gateway_rest_api.api,aws_api_gateway_resource.resource]
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.resource.id
  http_method             = aws_api_gateway_method.method.http_method
  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = aws_lambda_function.lambda_tf.invoke_arn
  depends_on = [aws_api_gateway_rest_api.api,aws_api_gateway_resource.resource,
                aws_api_gateway_method.method]
  }

resource "aws_api_gateway_method_response" "response_200" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.resource.id
  http_method = aws_api_gateway_method.method.http_method
  status_code = "200"
  
  response_models = {
         "application/json" = "Empty"
    }
  depends_on = [aws_api_gateway_resource.resource,aws_api_gateway_rest_api.api,
                aws_api_gateway_method.method]
}


resource "aws_api_gateway_integration_response" "MyDemoIntegrationResponse" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.resource.id
  http_method = aws_api_gateway_method.method.http_method
  status_code = aws_api_gateway_method_response.response_200.status_code
   
  depends_on = [aws_api_gateway_resource.resource,aws_api_gateway_rest_api.api,
                 aws_api_gateway_method_response.response_200,aws_api_gateway_method.method,
                 aws_api_gateway_integration.integration]
}

resource "aws_api_gateway_deployment" "example" {
  
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = "test"

  depends_on = [aws_api_gateway_integration.integration]
}

output "deployment-url" {
  value = aws_api_gateway_deployment.example.invoke_url
}