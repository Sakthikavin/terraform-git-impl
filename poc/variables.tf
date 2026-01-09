######################################
# GitHub Token (OAuth/PAT)
######################################
variable "github_token" {
  type        = string
  description = "GitHub OAuth token or Personal Access Token (PAT) for authentication"
  sensitive   = true
}

######################################
# GitHub Organization / Owner
######################################
variable "github_org" {
  type        = string
  description = "GitHub organization or user name"
  default     = "Sakthikavin"
}

######################################
# GitHub Repository Name
######################################
variable "repository" {
  type        = string
  description = "GitHub repository name"
  default     = "AlbumAssist"
}

######################################
# Commit Author (User who triggered)
######################################
variable "commit_author" {
  type        = string
  description = "Name of the user who triggered the workflow"
  default     = "Terraform Automation"
}

######################################
# Commit Email (User who triggered)
######################################
variable "commit_email" {
  type        = string
  description = "Email of the user who triggered the workflow"
  default     = "automation@company.com"
}
