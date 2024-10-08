resource "azurerm_firewall_policy" "az_firewall_policy" {
  name                              = module.azfw_policy_name.naming_convention_output[var.naming_convention_info.name].names.0
  resource_group_name               = azurerm_resource_group.example.name
  location                          = azurerm_resource_group.example.location
  base_policy_id                    = var.base_policy_id
  private_ip_ranges                 = var.private_ip_ranges
  auto_learn_private_ranges_enabled = var.auto_learn_private_ranges_enabled
  sku                               = var.sku
  tags                              = var.tags
  threat_intelligence_mode          = var.threat_intelligence_mode
  sql_redirect_allowed              = var.sql_redirect_allowed

  dns {
    proxy_enabled = var.dns.proxy_enabled
    servers       = var.dns.servers
  }

  identity {
    type         = var.identity.type
    identity_ids = var.identity.identity_ids
  }

  insights {
    enabled                            = var.insights.enabled
    default_log_analytics_workspace_id = var.insights.default_log_analytics_workspace_id
    retention_in_days                  = var.insights.retention_in_days

    log_analytics_workspace {
      id                = var.insights.log_analytics_workspace.id
      firewall_location = var.insights.log_analytics_workspace.firewall_location
    }
  }

  intrusion_detection {
    mode = var.intrusion_detection.mode

    signature_overrides {
      id    = var.intrusion_detection.signature_overrides.id
      state = var.intrusion_detection.signature_overrides.state
    }

    traffic_bypass {
      name                  = var.intrusion_detection.traffic_bypass.name
      protocol              = var.intrusion_detection.traffic_bypass.protocol
      description           = var.intrusion_detection.traffic_bypass.description
      destination_addresses = var.intrusion_detection.traffic_bypass.destination_addresses
      destination_ip_groups = var.intrusion_detection.traffic_bypass.destination
      destination_ports     = var.intrusion_detection.traffic_bypass.destination
      source_addresses      = var.intrusion_detection.traffic_bypass.source
      source_ip_groups      = var.intrusion_detection.traffic_bypass.source
    }
    private_ranges = var.intrusion_detection.private_ip_ranges
  }

  threat_intelligence_allowlist {
    fqdns        = var.threat_intelligence_allowlist.fqdns
    ip_addresses = var.threat_intelligence_allowlist.ip_addresses
  }

  tls_certificate {
    key_vault_secret_id = var.tls_certificate.key_vault_secret_id
    name                = var.tls_certificate.name
  }

  explicit_proxy {
    enabled         = var.explicit_proxy.enabled
    http_port       = var.explicit_proxy.http_port
    https_port      = var.explicit_proxy.https_port
    enable_pac_file = var.explicit_proxy.enable_pac_file
    pac_file_port   = var.explicit_proxy.pac_file_port
    pac_file        = var.explicit_proxy.pac_file
  }
}

