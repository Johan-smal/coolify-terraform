#cloud-config
write_files:
  - path: /swapfile
    content: ""
    permissions: "0644"
runcmd:
  - dd if=/dev/zero of=/swapfile bs=1M count=1024
  - chmod 600 /swapfile
  - mkswap /swapfile
  - swapon /swapfile
  - echo '/swapfile none swap sw 0 0' >> /etc/fstab
  - env ROOT_USERNAME=${username} ROOT_USER_EMAIL=${email} ROOT_USER_PASSWORD=${password} bash -c 'curl -fsSL https://cdn.coollabs.io/coolify/install.sh | bash'
  - echo "coolify installed" > initialize.txt