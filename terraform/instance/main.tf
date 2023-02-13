terraform {
  required_providers {
    idcloudhost = {
      source = "bapung/idcloudhost"
      version = "0.1.2"
    }
  }
}

provider "idcloudhost" {
    auth_token = "insertAPItokenhere" # API Token from idcloudhost.com
}

resource "idcloudhost_vm" "server" {
    name = "server"
    os_name = "ubuntu"
    os_version= "20.04"
    disks = 20
    vcpu = 1
    memory = 1024
    username = "ads"
    initial_password = "Katasand1" # Combination of Uppercase, Lowercase & Numbers
    billing_account_id = 0987654321 # Billing ID from idcloudhost.com
    backup = false
    public_key = "ssh-rsa xxxxxx= ubuntu@server" # SSH public key
}

resource "idcloudhost_floating_ip" "testip" {
    name = "My Network"
    billing_account_id = 0987654321 # Billing ID from idcloudhost.com
    assigned_to = idcloudhost_vm.server.id
}
