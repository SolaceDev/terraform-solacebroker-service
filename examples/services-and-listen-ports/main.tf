# Copyright 2024 Solace Corporation. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

provider "solacebroker" {
  username = "admin"
  password = "admin"
  url      = "http://localhost:8080"
}

module "testvpn" {
  source = "../.."

  msg_vpn_name = "rest-enabled-vpn"

  // Enable and configure incoming messaging protocols, for example REST. Note that plain text is not recommended for production use.
  service_rest_incoming_plain_text_enabled     = true
  service_rest_incoming_plain_text_listen_port = 9001

  // Uncomment to disable plain text SMF - however secure transport SMF requires a server certificate installed on the broker
  // service_smf_plain_text_enabled = false

  // No need to set the VPN enabled, it defaults to true
  // enabled = true
}

output "created_vpn" {
  value     = module.testvpn.msg_vpn
  sensitive = true
}