terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "/home/lu/Documentos/TRAINING/training1/development"
    region = "us-east-1"
  }
}
/*
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::mybucket"
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject"],
      "Resource": "arn:aws:s3:::mybucket/path/to/my/key"
    }
  ]
}
*/