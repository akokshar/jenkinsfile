//podTemplate (
//    label: 'test',
//    containers: [
//        containerTemplate(
//            name: 'nodejs',
//            image: 'node:alpine',
//            command: 'cat',
//            ttyEnabled: true
//        )
//    ]
//)
//{
//  node('test') {
//    stage('nodejs') {
//      container('nodejs') {
//        sh "node --version"
//      }
//    }
//    stage('Run shell') {
//      sh 'echo YAY! Hello Sasha!'
//    }
//  }
//}
//
kubernetes.pod('hello')
  .withImage('ubuntu')
//  .withVolumeClaim('/home/jenkins/agent', 'jenkins-workspace', false)
  .inside {
    sh 'uname -a'
}
