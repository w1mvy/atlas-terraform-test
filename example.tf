provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_instance" "nginx" {
  ami = "ami-4ddffc4c"
  instance_type = "t1.micro"
  security_groups = ["${aws_security_group.development.name}"]
  depends_on = ["aws_security_group.development"]
}

resource "aws_instance" "nginx2" {
  ami = "ami-4ddffc4c"
  instance_type = "t1.micro"
  security_groups = ["${aws_security_group.development.name}"]
  depends_on = ["aws_security_group.development"]
}

resource "aws_security_group" "development" {
  name = "development"
  description = "allow all traffic in development"
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    self = true
  }
}
