terraform {
  required_version = ">= 1.11.0"

  backend "s3" {} # per-environment settings in envs/<env>.backend.hcl

  # State and saved plans are encrypted, because plans are pipeline artifacts.
  encryption {
    key_provider "aws_kms" "state" {
      kms_key_id = var.state_kms_key_id
      region     = var.region
      key_spec   = "AES_256"
    }
    method "aes_gcm" "state" {
      keys = key_provider.aws_kms.state
    }
    state {
      method   = method.aes_gcm.state
      enforced = true
    }
    plan {
      method   = method.aes_gcm.state
      enforced = true
    }
  }
}

provider "aws" {
  region = var.region
}

module "path" {
  source = "git::https://gitlab.com/michaeljloria/golden-paths-platform.git//golden-paths/paths/event-driven/aws?ref=paths-v0.1.0"

  contract = yamldecode(file("${path.root}/../golden-path.yaml"))
  env      = var.env
  env_id   = var.env_id
  ttl      = var.ttl
}
