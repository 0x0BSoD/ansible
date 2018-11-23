# strings with %VALUE% must be changed

external_url '%http[s]://HOST_FQDN%'
gitlab_rails['ldap_enabled'] = true
gitlab_rails['ldap_servers'] = YAML.load <<-'EOS'
main:
    label: '%DOMAIN_NAME%'
    host: '%DOMAIN_NAME_CONTROLLER%'
    port: 636
    uid: 'sAMAccountName'
    bind_dn: 'CN=%BIND_USER%,OU=%BIND_USER_OU%,DC=%DOMAIN_1%,DC=%DOMAIN_0%'
    password: '%BIND_PASS%'
    encryption: 'ssl'
    verify_certificates: false
    active_directory: true
    allow_username_or_email_login: false
    lowercase_usernames: false
    block_auto_created_users: false
    # target users OU
    base: 'OU=%USERS_OU%,DC=%DOMAIN_1%,DC=%DOMAIN_0%'
    # filter bu user group 'FILTER_GROUP'
    # e.g
    # memberOf:1.2.840.113556.1.4.1941:=CN=gitlab_users,OU=Security_groups,DC=my_domain,DC=local
    user_filter: '(memberOf:1.2.840.113556.1.4.1941:=CN=%FILTER_GROUP%,OU=%GROUP_OU%,DC=%DOMAIN_1%,DC=%DOMAIN_0%)'
EOS
