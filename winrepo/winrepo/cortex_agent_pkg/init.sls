{#- Set the name of the winrepo package. -#}
{%- set name = 'cortex-agent' -%}

{#-
Define variables that may be unique to the system and are required for one of
the winrepo parameters.
-#}

{#-
Define a dictionary of versions with variables that are distinct for each
version.
-#}
{%- load_yaml as versions %}
'9.1.0.20768':
  installer: 'https://url/to/9.1.0.20768/Windows_Agent_Pkg-v91020768_x64.msi'
  full_name: 'Cortex XDR 9.1.0.20768'
  uninstall_flags: '/x "Windows_Agent_Pkg-v91020768_x64.msi" /qn /norestart UNINSTALL_PASSWORD="OrgPassword"'
{% endload %}

{#-
Initialize the `package` dictionary, which will contain the information needed
for the winrepo package definition. This dictionary is structured so that the
jinja content can be separated into another file, and this single variable can
be imported into an accompanying winrepo sls file.
-#}
{%- load_yaml as package -%}
name: {{ name }}
pillar: '{{ name }}:winrepo'
{# `common_params` are winrepo params that are the same for all versions. #}
common_params:
  reboot: False
  install_flags: ' /qn /norestart'
  msiexec: True
{# `versions` are winrepo params that are distinct per version. #}
versions:
  {% for version,params in versions.items() %}
  '{{ version }}':
    installer: {{ params.installer }}
    full_name: {{ params.full_name }}
    uninstaller: >-
      https://path/to/my/cortex-xdr-agent-uninstaller.msi
  {% endfor %}
{%- endload -%}

{#-
Update and merge the `package.versions` dictionary with winrepo version
settings from pillar.
-#}
{%-
do package.versions.update(salt['pillar.get'](
    package.pillar ~ ':versions',
    default=package.versions,
    merge=True))
-%}

{#-
Create the winrepo state definition, looping over the versions and merging in
the `package.common_params` dictionary.
-#}
{{ package.name }}:
  {%- for version,params in package.versions.items() %}
  {%- do params.update(salt['pillar.get'](
      package.pillar ~ ':common_params',
      default=package.common_params,
      merge=True)) %}
  '{{ version }}':
    {{ params | yaml }}
  {%- endfor %}
