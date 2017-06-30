
provider "aws" {
  region     = "eu-west-1"
  profile    = "pluralsight"
}

resource "aws_s3_bucket" "somebucket" {
  bucket = "somebucket-0e04ce23f5ff46bdb7ddffe67d995490"
  
  website {
    index_document = "index.html"
  }
}

output "bucket-domain" {
  value = "${aws_s3_bucket.somebucket.bucket_domain_name}"
}

output "website-endpoint" {
  value = "${aws_s3_bucket.somebucket.website_endpoint}"
}



