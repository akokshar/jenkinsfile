pipeline {
  agent {
    kubernetes {
      defaultContainer 'jnlp'
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    purpose: devops
spec:
  containers:
  - name: docker-cli
    image: docker-cli:19.03.2
    imagePullPolicy: Never
    env:
    - name: DOCKER_HOST
      value: tcp://docker.devops.svc:2375
    command:
    - cat
    tty: true
"""
    }
  }

  stages {
    stage('Test') {
      steps {
        sh 'pwd'
        sh 'env'
      }
    }
    stage('Build') {
      steps {
        container('docker-cli') {
          sh '/docker build -t devops:${BRANCH_NAME} .'
        }
      }
    }
    stage('Deploy') {
      steps {
        sh 'echo Deploy'
      }
    }
  }
}
