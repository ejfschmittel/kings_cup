resource "aws_cloudfront_origin_access_identity" "cf_access" {
  comment = var.bucket_name
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  tags = {
    App        = var.bucket_name
  }
}


resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.allow_access.json
}

data "aws_iam_policy_document" "allow_access" {
  statement {
    principals {
      identifiers = [aws_cloudfront_origin_access_identity.cf_access.iam_arn]
      type        = "AWS"
    }

    actions = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.bucket.arn}/*"]

  }
}

provider "aws" {
  alias = "virginia"
  region = "us-east-1"
}

data "aws_acm_certificate" "issued" {
  domain   = "eliasschmittel.com"
  provider = aws.virginia
}




resource "aws_cloudfront_distribution" "s3_distribution" {
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "S3 bucket distribution for ${local.full_domain}"
  default_root_object = "index.html"

  aliases = [local.full_domain]

  default_cache_behavior {
    allowed_methods  = [ "GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.bucket.bucket

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  origin {
    domain_name = aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.bucket.bucket
    origin_path = "/live"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.cf_access.cloudfront_access_identity_path
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }


  price_class = "PriceClass_100"


  tags = {
    App        = var.bucket_name
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn = data.aws_acm_certificate.issued.id
    minimum_protocol_version = "TLSv1.2_2019"
    ssl_support_method = "sni-only"
  }
}


data "aws_route53_zone" "selected" {
  name = "eliasschmittel.com"
}

resource "aws_route53_record" "root_domain" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name = local.full_domain
  type = "CNAME"
  ttl = 300
  records = [aws_cloudfront_distribution.s3_distribution.domain_name]
}
