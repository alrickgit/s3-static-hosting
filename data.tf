data "aws_route53_zone" "homelab_zone" {
  name         = "homelab24.online"
  private_zone = false
  depends_on = [ aws_route53_zone.homelab_zone ]
}

data "aws_route53_records" "existing_records" {
  zone_id = data.aws_route53_zone.homelab_zone.zone_id
  
}


output "homelab_zone_ns_records" {
  description = "All NS records in the hosted zone"
  value = {
    for r in data.aws_route53_records.existing_records.resource_record_sets :
    r.name => [for rec in r.resource_records : rec.value]
    if r.type == "NS"
  }
}

output "website_url" {
  description = "Website URL"
  value       = "https://${aws_route53_record.website_alias.name}"
}

output "s3_static_url" {
  description = "S3 website endpoint"
  value       = aws_s3_bucket.website_bucket.website_endpoint
}

