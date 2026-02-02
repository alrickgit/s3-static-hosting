data "aws_caller_identity" "current" {}


resource "aws_route53_zone" "homelab_zone" {
  name = "homelab24.online"
}

resource "aws_route53_record" "website_alias" {
  zone_id = data.aws_route53_zone.homelab_zone.zone_id
  name    = "homelab24.online"
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.website_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.website_distribution.hosted_zone_id
    evaluate_target_health = false
  }
  depends_on = [ aws_route53_zone.homelab_zone ]
}

resource "aws_route53_record" "website_alias_www" {
  zone_id = data.aws_route53_zone.homelab_zone.zone_id
  name    = "www.homelab24.online"
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.website_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.website_distribution.hosted_zone_id
    evaluate_target_health = false
  }
  depends_on = [ aws_route53_zone.homelab_zone ]
}


