data "archive_file" "lambda_startec2_archive" {
  type        = "zip"
  source_file = "lambda_startec2.py"
  output_path = "lambda_startec2_payload.zip"
}

resource "aws_lambda_function" "lambda_startec2" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "lambda_startec2_payload.zip"
  function_name = "lambda_startec2"
  role          = aws_iam_role.iam_for_lambdaz.arn
  handler       = "lambda_startec2.lambda_handler"
  timeout       = 10 

  source_code_hash = data.archive_file.lambda_startec2_archive.output_base64sha256

  runtime = "python3.12"
}

data "archive_file" "lambda_stopec2_archive" {
  type        = "zip"
  source_file = "lambda_stopec2.py"
  output_path = "lambda_stopec2_payload.zip"
}

resource "aws_lambda_function" "lambda_stopec2" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "lambda_stopec2_payload.zip"
  function_name = "lambda_stopec2"
  role          = aws_iam_role.iam_for_lambdaz.arn
  handler       = "lambda_stopec2.lambda_handler"
  timeout       = 10

  source_code_hash = data.archive_file.lambda_stopec2_archive.output_base64sha256

  runtime = "python3.12"
}