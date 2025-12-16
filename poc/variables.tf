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
  default     = "terraform-git-impl"
}

######################################
# GitHub App ID
######################################
variable "app_id" {
  type        = string
  description = "GitHub App ID used for authentication"
  default     = "2451004"
}

######################################
# GitHub App Installation ID
######################################
variable "app_installation_id" {
  type        = string
  description = "GitHub App installation ID"
  default     = "99033654"
}
