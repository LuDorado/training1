provider "aws" {
  #alias      = "a"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

#resource "aws_s3_bucket" "a" {
  #provider = "aws.a"
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
#  bucket = "bucket-del-training"
#  acl    = "private"
#}

resource "aws_instance" "example" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
  #depends_on = ["aws_s3_bucket.a"]
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}
