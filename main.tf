provider "tfe" {
  hostname = "app.terraform.io"
}

resource "tfe_workspace" "ws" {
  name         = "aa___${var.workspace-name}-prod"
  organization = var.org

  vcs_repo {
    branch         = "master"
    identifier     = var.vcs_identifier
    oauth_token_id = var.oauth_token
  }
}

resource "tfe_workspace" "ws-dev" {
  name         = "aa___${var.workspace-name}-dev"
  organization = var.org

  vcs_repo {
    branch         = "master"
    identifier     = var.vcs_identifier
    oauth_token_id = var.oauth_token
  }
}

resource "tfe_workspace" "ws-qa" {
  name         = "aa___${var.workspace-name}-qa"
  organization = var.org

  vcs_repo {
    branch         = "master"
    identifier     = var.vcs_identifier
    oauth_token_id = var.oauth_token
  }
}

resource "tfe_variable" "arm_client_id" {
  key          = "ARM_CLIENT_ID"
  value        = var.arm_client_id
  category     = "env"
  workspace_id = tfe_workspace.ws.id
}

resource "tfe_variable" "arm_subscription_id" {
  key          = "ARM_SUBSCRIPTION_ID"
  value        = var.arm_subscription_id
  category     = "env"
  workspace_id = tfe_workspace.ws.id
}

resource "tfe_variable" "arm_client_secret" {
  key          = "ARM_CLIENT_SECRET"
  value        = var.arm_client_secret
  category     = "env"
  workspace_id = tfe_workspace.ws.id
}

resource "tfe_variable" "arm_tenant_id" {
  key          = "ARM_TENANT_ID"
  value        = var.arm_tenant_id
  category     = "env"
  workspace_id = tfe_workspace.ws.id
}
