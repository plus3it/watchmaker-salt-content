{%- from 'map.jinja' import env with context %}

ash-windows:
  lookup:
    logdir: {{ env.systemdrive }}\\Watchmaker\\Logs\\Ash
    apply_lgpo_source: https://watchmaker.cloudarmor.io/repo/microsoft/lgpo/Apply_LGPO_Delta.exe
    apply_lgpo_source_hash: https://watchmaker.cloudarmor.io/repo/microsoft/lgpo/Apply_LGPO_Delta.exe.SHA512
    custom_policies:
      - name: NewAdministratorName
        policy_type: secedit
        value: '"xAdministrator"'
