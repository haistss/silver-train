module "network" {
  source = "./network"

  vpc = {
    subnet = {
      privateCidr = ""
      publicCidr  = ""
    }
  }

  domain = "xn--g5h3899nepb.ws"

  github_secrets = {
    godaddy_key    = "h1Jiaa4RCX1d_QnuxoqRo4CKfTcjAFXSSwM"
    godaddy_secret = "N7zscut31AzctKxcLLmzbE"
  }
}
