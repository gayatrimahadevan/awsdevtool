#AWS Code Deploy Role
resource "aws_iam_role" "cd-service-role" {
  name = "cd-service-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "codedeploy.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  tags = {
    Name = "cd-service-role"
  }

}
resource "aws_iam_role_policy_attachment" "codedeploy_attach" {
  role       = aws_iam_role.cd-service-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}
