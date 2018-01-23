# Uses ansible vault to generate a local pem file.
# Requires the vault password. Contact devops team
ansible-vault view default.pem.vault > default.pem
chmod 600 default.pem
