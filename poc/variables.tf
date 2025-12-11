# Provide default values for variables used in poc/main.tf
variable "github_org" {
    type    = string
    default = "Sakthikavin"
}

variable "repository" {
    type    = string
    default = "terraform-git-impl"
}

variable "data_product" {
    type = object({
        id           = string
        domain       = string
        display_name = string
        description  = string
        assets       = list(string)
    })
    default = {
        id           = "sample-data-product"
        domain       = "sample-domain"
        display_name = "Sample Data Product"
        description  = "This is a sample data product for testing."
        assets       = ["urn:li:dataset:(urn:li:dataPlatform:hive,sample_dataset,PROD)"]
    }
}

variable "app_id" {
    type   = string
    default = "2451004"  
}
variable "app_installation_id" {
    type   = string
    default = "99033654"
}