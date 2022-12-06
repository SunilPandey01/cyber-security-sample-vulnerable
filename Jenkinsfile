pipeline {
    agent {
        docker {
            image 'kennethreitz/pipenv:latest'
            args '-u root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('test') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: 'master']], userRemoteConfigs: [[url: 'https://github.dxc.com/assure/cyber-security-sample-vulnerable']]])
                script {
                    sh """export PRISMA_API_URL=https://api2.prismacloud.io
                    pipenv install
                    pipenv run pip install bridgecrew
                    pipenv run bridgecrew --directory . --bc-api-key 15e1019f-1eee-4aa9-ace7-6388fd021db5::KEtTgwftmOMBT59L2NcP1q/6xSY= --repo-id assure/cyber-security-sample-vulnerable"""
                }
            }
        }
    }
    options {
        preserveStashes()
        timestamps()
    }
}
