locals {
  naming_convention_info = {
    project_code = "project_code"
    env          = "env"
    zone         = "zone"
    tier         = "tier"
    name         = "name"
    agency_code  = "agency_code"
  }
  tags = {
    environment = "Production"
  }

}
module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    1 = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags = {
      }
    }
  }
}


module "azure_firewall_policy" {
  source = "../"
  resource_group_name    = module.resource_groups.rg_output[1].name
  location                          = azurerm_resource_group.example.location
  base_policy_id                    = var.base_policy_id
  private_ip_ranges                 = var.private_ip_ranges
  auto_learn_private_ranges_enabled = var.auto_learn_private_ranges_enabled
  sku                               = var.sku
  tags                              = local.tags
  threat_intelligence_mode          = var.threat_intelligence_mode
  sql_redirect_allowed              = var.sql_redirect_allowed
naming_convention_info = local.naming_convention_info

  dns = {
    proxy_enabled = var.dns_proxy_enabled
    servers       = var.dns_servers
  }

  identity = {
    type         = var.identity_type
    identity_ids = var.identity_identity_ids
  }

  insights ={
    enabled                            = var.insights_enabled
    default_log_analytics_workspace_id = var.insights_default_log_analytics_workspace_id
    retention_in_days                  = var.insights_retention_in_days

    log_analytics_workspace = {
      id                = var.insights_log_analytics_workspace_id
      firewall_location = var.insights_log_analytics_workspace_firewall_location
    }
  }

  intrusion_detection = {
    mode = var.intrusion_detection_mode

    signature_overrides = {
      id    = var.intrusion_detection_signature_overrides_id
      state = var.intrusion_detection_signature_overrides_state
    }

    traffic_bypass = {
      name                  = var.intrusion_detection_traffic_bypass_name
      protocol              = var.intrusion_detection_traffic_bypass_protocol
      description           = var.intrusion_detection_traffic_bypass_description
      destination_addresses = var.intrusion_detection_traffic_bypass_destination_addresses
      destination_ip_groups = var.intrusion_detection_traffic_bypass_destination_ip_groups
      destination_ports     = var.intrusion_detection_traffic_bypass_destination_ports
      source_addresses      = var.intrusion_detection_traffic_bypass_source_addresses
      source_ip_groups      = var.intrusion_detection_traffic_bypass_source_ip_groups
    }
    private_ranges = var.intrusion_detection_private_ip_ranges
  }

threat_intelligence_allowlist = {
    fqdns        = var.threat_intelligence_allowlist_fqdns
    ip_addresses = var.threat_intelligence_allowlist_ip_addresses
  }

  tls_certificate = {
    key_vault_secret_id = var.tls_certificate_key_vault_secret_id
    name                = var.tls_certificate_name
  }

  explicit_proxy = {
    enabled         = var.explicit_proxy_enabled
    http_port       = var.explicit_proxy_http_port
    https_port      = var.explicit_proxy_https_port
    enable_pac_file = var.explicit_proxy_enable_pac_file
    pac_file_port   = var.explicit_proxy_pac_file_port
    pac_file        = var.explicit_proxy_pac_file
  }
}