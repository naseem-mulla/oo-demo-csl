####################################################
#!!
#! @description: Operation_description - This flow generates the json output with all required information for suite installation.
#! @input input_name: input_description
#! @output output_name: output_description
#! @result result_name: result_description
#!!#
####################################################

namespace: io.cloudslang.test

operation:
  name: create_config_json

  inputs:
      - vm_name:
          default: ""
          required: true
      - vm_username:
          default: ""
          required: false
      - vm_password:
          default: ""
          required: false


  python_action:
    script: |

     import json
     vm_hostname = ""
     vm_json = {}
     vm_hostname = vm_name.split(",")[0]

     vm_json['vm_hostname'] = vm_hostname
     vm_json['vm_username'] = vm_username
     vm_json['vm_password'] = vm_password

     vm_json = json.dumps(vm_json).__str__()
     vm_json = vm_json.replace('"','\\\"')

  outputs:
    - vm_hostname
    - vm_json

  results:
    - SUCCESS
