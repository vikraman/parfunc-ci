node default {

    include jenkins

    package { 'curl': }
    package { 'unzip': }

    # The jenkins::plugin provider cannot handle plugin dependencies
    exec { 'jenkins-plugin-blueocean':
        command => '/usr/local/bin/install_jenkins_plugin.sh -a blueocean@1.0.1',
        creates => '/var/lib/jenkins/plugins/blueocean.hpi',
        require => [ Class['jenkins::package']
                   , File['/var/lib/jenkins/plugins']
                   , Package['curl']
                   , Package['unzip'] ],
    }

    jenkins::plugin { 'blueocean':
        version => '1.0.1',
        require => Exec['jenkins-plugin-blueocean'],
    }

}
