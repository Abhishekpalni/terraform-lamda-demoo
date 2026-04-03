provider "aws" {
    region = "ap-south-1"
  
}
resource "aws_iam_role" "welcomeee" {
  name = "welcomeee"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_role_policy_attachment" "welcomeee" {
  role       = aws_iam_role.welcomeee.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Archive a single file.

data "archive_file" "init" {
  type        = "zip"
  source_file = "${path.module}/../new/new.py"
  output_path = "${path.module}/../new/new.zip"
}

resource "aws_lambda_function" "examplee" {
  filename      = data.archive_file.init.output_path
  function_name = "abhi-2026-demooo"
  role          = aws_iam_role.welcomeee.arn
  handler       = "new.lambda_handler"
  source_code_hash=data.archive_file.init.output_base64sha256
  
  runtime = "python3.11"
}