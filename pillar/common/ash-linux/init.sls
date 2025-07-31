{%- set content_matcher = salt.grains.filter_by({
    8: salt.grains.filter_by({
        'AlmaLinux': 'centos8',
        'CentOS': 'centos8',
        'CentOS Stream': 'centos8',
        'OEL': 'ol8',
        'RedHat': 'rhel8',
        'Rocky': 'rl8',
    }, grain='os'),
    9: salt.grains.filter_by({
        'AlmaLinux': 'almalinux9',
        'CentOS Stream': 'cs9',
        'OEL': 'ol9',
        'RedHat': 'rhel9',
        'Rocky': 'rl9',
    }, grain='os'),
    10: salt.grains.filter_by({
        'AlmaLinux': 'almalinux10',
        'CentOS Stream': 'cs10',
        'OEL': 'ol10',
        'RedHat': 'rhel10',
        'Rocky': 'rl10',
    }, grain='os'),
    2023: salt.grains.filter_by({
        'Amazon Linux': 'al2023',
    }, grain='os'),
}, grain='osmajorrelease')%}

ash-linux:
  lookup:
    scap-profile: stig
    scap-cpe: /root/scap/content/openscap/ssg-rhel{{ grains['osmajorrelease'] }}-cpe-dictionary.xml
    scap-xccdf: /root/scap/content/openscap/ssg-{{ content_matcher }}-xccdf.xml
    scap-ds: /root/scap/content/openscap/ssg-{{ content_matcher }}-ds.xml
