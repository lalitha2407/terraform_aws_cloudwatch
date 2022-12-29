resource "aws_cloudwatch_event_rule" "watchEC2" {
  name           = var.name
  description    = var.description
  event_bus_name = var.event_bus_name
  is_enabled     = var.is_enabled
  event_pattern  = <<PATTERN
{
  "source": [
    "aws.ec2"
  ],
  "detail-type":["EC2 Instance Launch Successful"]

}
PATTERN



}

resource "aws_cloudwatch_event_target" "target" {
  # target_id = var.target_id
  rule = aws_cloudwatch_event_rule.watchEC2.name
  arn  = var.arn
  sqs_target {
    message_group_id = var.queue
  }


}