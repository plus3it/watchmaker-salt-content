{%- from 'map.jinja' import env with context %}

ash-windows:
  lookup:
    logdir: {{ env.systemdrive }}\\Watchmaker\\Logs\\Ash
    apply_lgpo_source: https://s3.amazonaws.com/systemprep-repo/windows/lgpo-utilities/Apply_LGPO_Delta.exe
    apply_lgpo_source_hash: https://s3.amazonaws.com/systemprep-repo/windows/lgpo-utilities/Apply_LGPO_Delta.exe.SHA512
