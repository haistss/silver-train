variable "vpc" {
  type = object({
    subnet = object({
      privateCidr = string,
      publicCidr  = string,
    })
  })
}

variable "domain" {
  type = string
}

variable "github_secrets" {
  type = any
}
