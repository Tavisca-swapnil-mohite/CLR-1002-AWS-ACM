resource "aws_lb" "default" {

  name                                        = var.name
  internal                                    = var.internal
  load_balancer_type                          = "application"
  security_groups                             = var.security_group_ids
  subnets                                     = var.subnet_ids
  enable_cross_zone_load_balancing            = var.cross_zone_load_balancing_enabled
  enable_http2                                = var.http2_enabled
  idle_timeout                                = var.idle_timeout
  ip_address_type                             = var.ip_address_type
  enable_deletion_protection                  = var.deletion_protection_enabled
  drop_invalid_header_fields                  = var.drop_invalid_header_fields
  preserve_host_header                        = var.preserve_host_header
  xff_header_processing_mode                  = var.xff_header_processing_mode
  client_keep_alive                           = var.client_keep_alive
  desync_mitigation_mode                      = var.desync_mitigation_mode
  enable_tls_version_and_cipher_suite_headers = var.enable_tls_version_and_cipher_suite_headers
  enable_xff_client_port                      = var.enable_xff_client_port
  enable_waf_fail_open                        = var.enable_waf_fail_open

  access_logs {
    bucket  = var.access_logs["bucket"]
    prefix  = var.access_logs["prefix"]
    enabled = var.access_logs["enabled"]
  }

  connection_logs {
    bucket  = var.connection_logs["bucket"]
    prefix  = var.connection_logs["prefix"]
    enabled = var.connection_logs["enabled"]
  }

  dynamic "subnet_mapping" {
    for_each = var.subnet_mapping

    content {
      allocation_id        = lookup(subnet_mapping.value, "allocation_id", null)
      ipv6_address         = lookup(subnet_mapping.value, "ipv6_address", null)
      private_ipv4_address = lookup(subnet_mapping.value, "private_ipv4_address", null)
      subnet_id            = subnet_mapping.value.subnet_id
    }
  }
}
