resource "aws_instance" "web" {
  ami           = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"
  #availability_zone = "us-east-1a"
  subnet_id = "subnet-0838b4e81640fc8db"  
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id] 

  user_data = file("apache.sh")
 
  tags = {
    Name = "HelloWorld"
  }
}



output ec2 {
    value = [aws_instance.web.public_ip, aws_instance.web.key_name]
}