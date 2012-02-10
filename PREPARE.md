Prepare for home directory
==========================

Cygwin
------

Full package install is the simplest way.

RHEL (CentOS)
-------------

Upgrade system and install development tools:

    sudo yum upgrade
    # 5.x
    sudo yum groupinstall 'Development tools' 'Development Libraries'
    # 6.x
    sudo yum groupinstall 'Development tools' 'Additional Development'

Add repoforge:

    # ref: http://wiki.centos.org/AdditionalResources/Repositories/RPMForge
    # 5.x
    wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm
    sudo rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
    sudo rpm -K rpmforge-release-0.5.2-2.el5.rf.*.rpm
    sudo rpm -i rpmforge-release-0.5.2-2.el5.rf.*.rpm
    # 6.x
    wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
    sudo rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
    sudo rpm -K rpmforge-release-0.5.2-2.el6.rf.*.rpm
    sudo rpm -i rpmforge-release-0.5.2-2.el6.rf.*.rpm

Install useful tools:

    sudo yum install screen zsh
    sudo yum install mercurial
    # 5.x
    sudo yum install gcc44 gcc44-c++
