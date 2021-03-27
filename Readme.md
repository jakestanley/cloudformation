# cloudformation linkup server stuff

- SshIngressIP should be the admin IP. Needs to follow the `12.34.45.56/32` format
- `chmod 600 ~/.ssh/Linkup.pem`
- Log in with `ubuntu@<instance-ip> -i ~/.ssh/Linkup.pem`