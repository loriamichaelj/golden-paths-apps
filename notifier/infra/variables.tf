variable "env" {
  type        = string
  description = "dev, stage, uat, prod or ephemeral"
}

variable "region" {
  type        = string
  description = "Set by the landing zone for this environment"
}

variable "state_kms_key_id" {
  type        = string
  description = "KMS key for state and plan encryption in this environment's account"
}

variable "env_id" {
  type        = string
  default     = ""
  description = "Ephemeral environments only"
}

variable "ttl" {
  type        = string
  default     = ""
  description = "Ephemeral environments only; must equal the contract's ttl"
}
