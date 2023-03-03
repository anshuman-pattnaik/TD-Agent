#! /bin/sh

# Set Hostname
hostnamectl set-hostname $HOSTNAME

# Install plugins
sudo apt install -y auditd audispd-plugins acl gnupg2 dos2unix

# Copy audit rules
sudo cp /tmp/audit.rules /etc/audit/rules.d/audit.rules
sudo chmod 640 /etc/audit/rules.d/audit.rules

# Copy audispd files
sudo cp /tmp/rsyslog_z_client_audispd.conf /etc/rsyslog.d/z_client_audispd.conf
sudo chmod 644 /etc/rsyslog.d/z_client_audispd.conf
 
sudo cp /tmp/audisp_audit-alt.conf /etc/audisp/plugins.d/audit-alt.conf
sudo chmod 640 /etc/audisp/plugins.d/audit-alt.conf
 
sudo cp /tmp/logrotate_audit-alt /etc/logrotate.d/audit-alt
sudo chmod 644 /etc/logrotate.d/audit-alt

# Finish
echo 'Configurations Setup Completed! Now reboot the machine and install td-agent.sh file'
