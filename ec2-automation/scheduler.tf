resource "aws_scheduler_schedule" "start-ec2-schedule" {
  name = "start-ec2-schedule"
  description = "Start EC2 instances at 9 AM"
  # "At 0 minutes past the 9th hour UTC time, every day."
  schedule_expression = "cron(0 9 ? * MON-FRI *)"

  flexible_time_window {
    mode = "OFF"
  }
  target {
    role_arn = aws_iam_role.scheduler.arn
    arn = aws_lambda_function.lambda_startec2.arn
  }
}

resource "aws_scheduler_schedule" "stop-ec2-schedule" {
  name = "stop-ec2-schedule"
  description = "Stop EC2 instances at 5 PM"
  
  # "At 0 minutes past the 17th hour UTC time, every day."
  schedule_expression = "cron(0 17 ? * MON-FRI *)"

  flexible_time_window {
    mode = "OFF"
  }
  target {
    role_arn = aws_iam_role.scheduler.arn
    arn = aws_lambda_function.lambda_stopec2.arn
  }
}