variable "location" {
  type        = string
  description = "The Azure Region where the Firewall Policy should exist."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the Firewall Policy should exist."
}

variable "base_policy_id" {
  type        = string
  description = "The ID of the base Firewall Policy."
}

variable "private_ip_ranges" {
  type        = list(string)
  description = "A list of private IP ranges to which traffic will not be SNAT."
}

variable "auto_learn_private_ranges_enabled" {
  type        = bool
  description = "Whether enable auto learn private ip range."
}

variable "sku" {
  type        = string
  description = "The SKU Tier of the Firewall Policy. Possible values are Standard, Premium and Basic. Defaults to Standard."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags which should be assigned to the Firewall Policy."
}

variable "threat_intelligence_mode" {
  type        = string
  description = "The operation mode for Threat Intelligence. Possible values are Alert, Deny and Off. Defaults to Alert."
}

variable "sql_redirect_allowed" {
  type        = bool
  description = "Whether SQL Redirect traffic filtering is allowed. Enabling this flag requires no rule using ports between 11000-11999."
}

variable "dns" {
  type = object({
    proxy_enabled = bool
    servers       = list(string)
  })
  description = "A dns block as defined below."
}

variable "identity" {
  type = object({
    type         = string
    identity_ids = list(string)
  })
  description = "A identity block as defined below."
}

variable "insights" {
  type = object({
    enabled                            = bool
    default_log_analytics_workspace_id = string
    retention_in_days                  = number
    log_analytics_workspace = list(object({
      id                = string
      firewall_location = string
    }))
  })
  description = "A insights block as defined below."
}

variable "intrusion_detection" {
  type = object({
    mode = string
    signature_overrides = list(object({
      id    = string
      state = string
    }))
    traffic_bypass = list(object({
      name                  = string
      protocol              = string
      description           = string
      destination_addresses = list(string)
      destination_ip_groups = list(string)
      destination_ports     = list(string)
      source_addresses      = list(string)
      source_ip_groups      = list(string)
    }))
    private_ranges = list(string)
  })
  description = "A intrusion_detection block as defined below."
}

variable "threat_intelligence_allowlist" {
  type = object({
    fqdns        = list(string)
    ip_addresses = list(string)
  })
  description = "A threat_intelligence_allowlist block as defined below."
}

variable "tls_certificate" {
  type = object({
    key_vault_secret_id = string
    name                = string
  })
  description = "A tls_certificate block as defined below."
}

variable "explicit_proxy" {
  type = object({
    enabled         = bool
    http_port       = number
    https_port      = number
    enable_pac_file = bool
    pac_file_port   = number
    pac_file        = string
  })
  description = "A explicit_proxy block as defined below."
}

variable "naming_convention_info" {
  type = object({
    name         = string
    project_code = string
    env          = string
    zone         = string
    tier         = string
  })
  description = "A naming_convention_info block as defined below."

}

