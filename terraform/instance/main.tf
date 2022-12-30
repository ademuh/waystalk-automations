terraform {
  required_providers {
    idcloudhost = {
      source = "bapung/idcloudhost"
      version = "0.1.0"
    }
  }
}

provider "idcloudhost" {
    auth_token = "0XqvAD886fhmvi2nvH6mqiwmmKflBcVu"
}

resource "idcloudhost_vm" "server" {
    name = "server"
    os_name = "ubuntu"
    os_version= "20.04"
    disks = 20
    vcpu = 1
    memory = 1024
    username = "ads"
    initial_password = "katasandi"
    billing_account_id = 1200157626
    backup = false
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/PabHFpwUp9pu8dSNhZWE+ErJSA5hR3HvqykUL3qUpEwWXyTBr09+2GHWN/P8ZPcG2ivh6l+TI2fpFNP3kBpehe2vUCSA2fHFI9dInP/LZciSw8JQKXYt3dF7VWsjZIkwI8DMqsdjweo92dOsTQQXIFpAHP+P6AoE86bzlJwn10GXU7l0kN3jWE9i58ikJ8l6tuXK1ircxOW9479poRLlQoVo/Z+SGRKvB7EIYq/Gef2qFAuKfHL5W4X9Mcw9c19H7nP6ZPwQpcZzrkl5I6Njjo6ylrXH8rM0G02xWhIxcyG806Oyll4ovsfBT99L9A5cZrxKerDkjEOa16WPKVsVb6GHHfsINUq0rlnb8U5IUEyq5WlO/0WeYi9cJFLklG7YGxACAOjr+3a098BQaDD3zRIlRQdIjO12XNdykPyTEDl5A7XGWnVRj96hWpJuRJ8C3qPXKxucr1BbmewWLtKT3Q0zfwaLF9NRoIZ+xWSri8IpTyk0Mrv4f/IS79aYrmM= ubuntu@primary"
}

resource "idcloudhost_floating_ip" "testip" {
    name = "My Network"
    billing_account_id = 1200157626
    assigned_to = idcloudhost_vm.server.id
}
