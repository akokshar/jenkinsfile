pipeline {

  agent {
    kubernetes {
      defaultContainer 'jnlp'
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    branch: ${BRANCH_NAME}
spec:
  containers:
  - name: golang
    image: golang:latest
    imagePullPolicy: IfNotPresent
    command:
    - cat
    tty: true
  - name: docker-cli
    image: docker-cli:19.03.2
    imagePullPolicy: Never
    env:
    - name: DOCKER_HOST
      value: tcp://docker:2375
    command:
    - cat
    tty: true
"""
    }
  }

  stages {

    // stage('Checks...') {
    //   steps {
    //     script {
    //       def e = env.getEnvironment()
    //       e.each { k, v ->
    //         println("${k} = '${v}'")
    //       }
    //     }
    //   }
    // }

    stage('Build') {
      steps {
        container('golang') {
          withEnv([
            'CGO_ENABLED=0',
            'GOCACHE=/tmp'
          ]) {
            sh 'go test ./...'
            sh 'go build -o app .'
          }
        }
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
