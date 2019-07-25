resource "aws_security_group" "allow_http_only" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic,Allow all outbound traffic"
  
  ingress {
    #http
    from_port   = 80 
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow http inbound"
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    description     = "allow all traffic outbound"
  }
}