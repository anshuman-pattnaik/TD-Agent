#! /bin/sh

echo 'Check Pre-installation Guide Before Installation'

# td-agent 4
curl -fsSL https://toolbelt.treasuredata.com/sh/install-debian-buster-td-agent4.sh | sh
# td-agent 3 (EOL)
curl -fsSL https://toolbelt.treasuredata.com/sh/install-debian-buster-td-agent3.sh | sh

# Enable td-agent
sudo systemctl enable td-agent.service

# Create tmp log folder for fluentD process
sudo mkdir -p /var/log/fluentd/tmp
sudo chown -R td-agent:td-agent /var/log/fluentd

# Run facl to set permissions
sudo setfacl -m g:td-agent:4 /var/log/auth.log

# Copy td-agent config and start service
sudo mv /tmp/td-agent.conf /etc/td-agent/td-agent.conf
sudo systemctl start td-agent.service
 
sudo systemctl status td-agent.service

# Verify td-agent logs and tailed paths
sudo tail -f /var/log/td-agent/td-agent.log
cat /var/log/td-agent/td-agent.log |grep "tailing paths"
