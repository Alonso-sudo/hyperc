## Network Configuration

```
echo "ip domain" | sudo tee -a /etc/hots
```

Purpose of this step:

- Maps the IP address 10.10.10.90 to various hostname formate
- Required for Kerberos authentication which relies on FQDNs
- Allows using domain names instead of IP addresses in commands
