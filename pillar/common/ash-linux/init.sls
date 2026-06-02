{%- set mapping = salt.grains.filter_by({
    8: salt.grains.filter_by({
        'AlmaLinux': {
            'ds': 'centos8',
        },
        'CentOS': {
            'ds': 'centos8',
        },
        'CentOS Stream': {
            'ds': 'centos8',
        },
        'OEL': {
            'ds': 'ol8',
        },
        'RedHat': {
            'ds': 'rhel8',
        },
        'Rocky': {
            'ds': 'rl8',
        },
    }, grain='os'),
    9: salt.grains.filter_by({
        'AlmaLinux': {
            'ds': 'almalinux9',
        },
        'CentOS Stream': {
            'ds': 'cs9',
        },
        'OEL': {
            'ds': 'ol9',
        },
        'RedHat': {
            'ds': 'rhel9',
        },
        'Rocky': {
            'ds': 'rl9',
        },
    }, grain='os'),
    10: salt.grains.filter_by({
        'AlmaLinux': {
            'ds': 'almalinux10',
        },
        'CentOS Stream': {
            'ds': 'cs10',
        },
        'OEL': {
            'ds': 'ol10',
        },
        'RedHat': {
            'ds': 'rhel10',
        },
        'Rocky': {
            'ds': 'rl10',
        },
    }, grain='os'),
    2023: salt.grains.filter_by({
        'Amazon': {
            'ds': 'al2023',
        },
    }, grain='os'),
}, grain='osmajorrelease')%}

ash-linux:
  lookup:
    scap-profile: stig
    scap-ds: /root/scap/content/openscap/ssg-{{ mapping.ds }}-ds.xml
