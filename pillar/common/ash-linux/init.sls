{%- set mapping = salt.grains.filter_by({
    8: salt.grains.filter_by({
        'AlmaLinux': {
            'cpe': 'rhel8',
            'ds_xccdf': 'centos8',
        },
        'CentOS': {
            'cpe': 'rhel8',
            'ds_xccdf': 'centos8',
        },
        'CentOS Stream': {
            'cpe': 'rhel8',
            'ds_xccdf': 'centos8',
        },
        'OEL': {
            'cpe': 'ol8',
            'ds_xccdf': 'ol8',
        },
        'RedHat': {
            'cpe': 'rhel8',
            'ds_xccdf': 'rhel8',
        },
        'Rocky': {
            'cpe': 'rhel8',
            'ds_xccdf': 'rl8',
        },
    }, grain='os'),
    9: salt.grains.filter_by({
        'AlmaLinux': {
            'cpe': 'almalinux9',
            'ds_xccdf': 'almalinux9',
        },
        'CentOS Stream': {
            'cpe': 'rhel9',
            'ds_xccdf': 'cs9',
        },
        'OEL': {
            'cpe': 'ol9',
            'ds_xccdf': 'ol9',
        },
        'RedHat': {
            'cpe': 'rhel9',
            'ds_xccdf': 'rhel9',
        },
        'Rocky': {
            'cpe': 'rhel9',
            'ds_xccdf': 'rl9',
        },
    }, grain='os'),
    10: salt.grains.filter_by({
        'AlmaLinux': {
            'cpe': 'almalinux10',
            'ds_xccdf': 'almalinux10',
        },
        'CentOS Stream': {
            'cpe': 'rhel10',
            'ds_xccdf': 'cs10',
        },
        'OEL': {
            'cpe': 'ol10',
            'ds_xccdf': 'ol10',
        },
        'RedHat': {
            'cpe': 'rhel10',
            'ds_xccdf': 'rhel10',
        },
        'Rocky': {
            'cpe': 'rhel10',
            'ds_xccdf': 'rl10',
        },
    }, grain='os'),
    2023: salt.grains.filter_by({
        'Amazon': {
            'cpe': 'al2023',
            'ds_xccdf': 'al2023',
        },
    }, grain='os'),
}, grain='osmajorrelease')%}

ash-linux:
  lookup:
    scap-profile: stig
    scap-cpe: /root/scap/content/openscap/ssg-{{ mapping.cpe }}-cpe-dictionary.xml
    scap-xccdf: /root/scap/content/openscap/ssg-{{ mapping.ds_xccdf }}-xccdf.xml
    scap-ds: /root/scap/content/openscap/ssg-{{ mapping.ds_xccdf }}-ds.xml
