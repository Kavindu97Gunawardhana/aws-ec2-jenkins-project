resource "aws_instance" "jenkins_server" {
  ami = "ami-079db87dc4c10ac91"
  instance_type = "t2.micro"
  tags = {
    "Name" = "Jenkinsserver"
  }
  vpc_security_group_ids = [ var.sg_id ] 
  associate_public_ip_address = true
  key_name = "jen-key"  

  # user data below
  user_data = <<-EOF
  #!/bin/bash -xe
    
  sudo yum update
  sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo 
  sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
  sudo yum upgrade
  sudo dnf install java-17-amazon-corretto -y
  sudo yum install jenkins -y
  sudo systemctl enable jenkins
  sudo systemctl start jenkins
  sudo systemctl status jenkins
  EOF

}