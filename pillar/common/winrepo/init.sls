scc:
  winrepo:
    versions:
      # examples of adding new versions via pillar
      '5.14':
        # full_name is required if version is not listed in winrepo pkg config
        full_name: SCAP Compliance Checker 5.14
        installer: https://watchmaker.cloudarmor.io/repo/spawar/scc/SCC_5.14_Windows_Setup.exe
      '5.10':
        installer: https://watchmaker.cloudarmor.io/repo/spawar/scc/SCC_5.10_Windows_Setup.exe
      '5.7.1':
        installer: https://watchmaker.cloudarmor.io/repo/spawar/scc/SCC_5.7.1_Windows_Setup.exe
