# data "aws_route53_zone" "homelab_zone" {
#   name         = "homelab24.online"
#   private_zone = false
# }

# data "aws_route53_records" "existing_records" {
#   zone_id = data.aws_route53_zone.homelab_zone.zone_id
# }