resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.minikube_vpc.id

  # Block all ingress traffic.
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Only allow egress traffic.
  egress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]

    # Allow all protocols.
    protocol = "-1"
  }
}