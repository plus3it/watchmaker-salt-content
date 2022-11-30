{%- set os = salt.grains.filter_by({
    'RedHat': 'rhel',
    'OEL': 'ol',
    'CentOS': 'centos',
    'Rocky': 'centos',
    'AlmaLinux': 'centos'
}, grain='os') %}

ash-linux:
  lookup:
    scap-profile: stig
    scap-cpe: /root/scap/content/openscap/ssg-rhel{{ grains['osmajorrelease'] }}-cpe-dictionary.xml
    scap-xccdf: /root/scap/content/openscap/ssg-{{ os }}{{ grains['osmajorrelease'] }}-xccdf.xml
    scap-ds: /root/scap/content/openscap/ssg-{{ os }}{{ grains['osmajorrelease'] }}-ds.xml
