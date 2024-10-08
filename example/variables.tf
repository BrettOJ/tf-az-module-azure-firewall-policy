variable "location" {
  type        = string
  description = "The Azure Region where the Firewall Policy should exist."
}

variable "name" {
  type        = string
  description = "The name which should be used for this Firewall Policy."
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

variable "dns_proxy_enabled" {
  type        = bool
  description = "Whether the DNS Proxy is enabled."
}

variable "dns_servers" {
  type        = list(string)
  description = "A list of DNS servers to use."
}

variable "identity_type" {
  type        = string
  description = "The type of identity to use. Possible values are SystemAssigned, UserAssigned and SystemAssigned, UserAssigned."
}

variable "identity_identity_ids" {
  type        = list(string)
  description = "A list of identity IDs to use."
}

variable "insights_enabled" {
  type        = bool
  description = "Whether the Firewall Policy should send logs to Azure Monitor."
}

variable "insights_default_log_analytics_workspace_id" {
  type        = string
  description = "The ID of the default Log Analytics Workspace to send logs to."
}

variable "insights_retention_in_days" {
  type        = number
  description = "The retention period for logs sent to Azure Monitor."
}

variable "insights_log_analytics_workspace_id" {
  type        = string
  description = "The ID of the Log Analytics Workspace to send logs to."
}

variable "insights_log_analytics_workspace_firewall_location" {
  type        = string
  description = "The location of the Log Analytics Workspace to send logs to."
}

variable "intrusion_detection_mode" {
  type        = string
  description = "The operation mode for Intrusion Detection. Possible values are Alert, Deny and Off. Defaults to Alert."  
}

variable "intrusion_detection_signature_overrides_id" {
  type        = string
  description = "The ID of the signature overrides."
}

variable "intrusion_detection_signature_overrides_state" {
  type        = string
  description = "The state of the signature overrides."
}


variable "intrusion_detection_traffic_bypass_name" {
  type        = string
  description = "The name of the traffic bypass."
}

variable "intrusion_detection_traffic_bypass_protocol" {
  type        = string
  description = "The protocol of the traffic bypass."
}

variable "intrusion_detection_traffic_bypass_description" {
  type        = string
  description = "The description of the traffic bypass."
}

variable "intrusion_detection_traffic_bypass_destination_addresses" {
  type        = list(string)
  description = "The destination addresses of the traffic bypass."
}

variable "intrusion_detection_traffic_bypass_destination_ip_groups" {
  type        = list(string)
  description = "The destination of the traffic bypass."
}

variable "intrusion_detection_traffic_bypass_destination_ports" {
  type        = list(string)
  description = "The destination of the traffic bypass."
}

variable "intrusion_detection_traffic_bypass_source_addresses" {
  type        = list(string)
  description = "The source addresses of the traffic bypass."
}

variable "intrusion_detection_traffic_bypass_source_ip_groups" {
  type        = list(string)
  description = "The source of the traffic bypass."
}

variable "intrusion_detection_private_ip_ranges" {
  type        = list(string)
  description = "A list of private IP ranges to which traffic will not be SNAT."
}

variable "threat_intelligence_allowlist_fqdns" {
  type        = list(string)
  description = "A list of FQDNs to allowlist."
}

variable "threat_intelligence_allowlist_ip_addresses" {
  type        = list(string)
  description = "A list of IP addresses to allowlist."
}

variable "tls_certificate_key_vault_secret_id" {
  type        = string
  description = "The ID of the Key Vault Secret which contains the TLS certificate."
}

variable "tls_certificate_name" {
  type        = string
  description = "The name of the TLS certificate."
}

variable "explicit_proxy_enabled" {
  type        = bool
  description = "Whether the explicit proxy is enabled."
}

variable "explicit_proxy_http_port" {
  type        = number
  description = "The HTTP port for the explicit proxy."
}

variable "explicit_proxy_https_port" {
  type        = number
  description = "The HTTPS port for the explicit proxy."
}

variable "explicit_proxy_enable_pac_file" {
  type        = bool
  description = "Whether the explicit proxy should enable the PAC file."
}

variable "explicit_proxy_pac_file_port" {
  type        = number
  description = "The port for the PAC file."
}

variable "explicit_proxy_pac_file" {
  type        = string
  description = "The URL for the PAC file."
}



