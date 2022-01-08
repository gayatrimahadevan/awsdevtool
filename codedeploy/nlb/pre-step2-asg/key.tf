resource "aws_key_pair" "gk" {
  key_name   = "gk"
  public_key = file("gk.pub")
}
