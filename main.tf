provider "aws" {
  region = "ap-south-1" # Updated to your specified region
}

# Security Group allowing access to specific ports
resource "aws_security_group" "allow_traffic" {
  name        = "allow_traffic"
  description = "Security group to allow SSH, HTTP, and custom ports"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Custom ports: 8080, 8081, 8082, 8083, 8084, 8085
  ingress {
    description = "Allow traffic on 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow traffic on 8081"
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow traffic on 8082"
    from_port   = 8082
    to_port     = 8082
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow traffic on 8083"
    from_port   = 8083
    to_port     = 8083
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow traffic on 8084"
    from_port   = 8084
    to_port     = 8084
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow traffic on 8085"
    from_port   = 8085
    to_port     = 8085
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allows all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_traffic_security_group"
  }
}

# Create an EC2 instance
resource "aws_instance" "web_server" {
  ami           = "ami-0dee22c13ea7a9a67" # Updated to your specified AMI
  instance_type = "t2.medium"             # Updated instance type

  key_name = "mumbai-k" # Updated to your key name

  security_groups = [
    aws_security_group.allow_traffic.name
  ]

  tags = {
    Name = "Nuhvin-final-task"
  }


}

output "instance_public_ip" {
  value = aws_instance.web_server.public_ip
}

