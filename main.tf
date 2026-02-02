data "aws_caller_identity" "current" {}


resource "aws_route53_zone" "homelab_zone" {
  name = "homelab24.online"
}

resource "aws_route53_record" "website_alias" {
  zone_id = data.aws_route53_zone.homelab_zone.zone_id
  name    = "homelab24.online"
  type    = "A"
  alias {
    name                   = aws_s3_bucket.website_bucket.website_domain
    zone_id                = aws_s3_bucket.website_bucket.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "website_alias_www" {
  zone_id = data.aws_route53_zone.homelab_zone.zone_id
  name    = "www.homelab24.online"
  type    = "A"
  alias {
    name                   = aws_s3_bucket.website_bucket.website_domain
    zone_id                = aws_s3_bucket.website_bucket.hosted_zone_id
    evaluate_target_health = false
  }
}
