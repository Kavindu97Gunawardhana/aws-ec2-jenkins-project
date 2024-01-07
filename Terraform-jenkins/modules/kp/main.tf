resource "aws_key_pair" "deployer" {
  key_name   = "jen-key"
  public_key = find("Path")
}