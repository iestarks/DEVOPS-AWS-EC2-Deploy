node {
    jobDsl scriptText: 'job("example-2")'

    jobDsl targets: ['jobs/projectA/*.groovy', 'jobs/common.groovy'].join('\n'),
           removedJobAction: 'DELETE',
           removedViewAction: 'DELETE',
           lookupStrategy: 'SEED_JOB',
           additionalClasspath: ['libA.jar', 'libB.jar'].join('\n'),
           additionalParameters: [message: 'Hello from pipeline', credentials: 'SECRET']
}
pipeline {   
  agent {
    node {
      label 'master'
    }  
  }
  stages {
    stage('checkout') {
      steps {
        checkout scm
        sh 'docker pull hashicorp/terraform:light'
      }
    }
    stage('init') {
      steps {
        sh 'docker run -w /app -v /root/.aws:/root/.aws -v `pwd`:/app hashicorp/terraform:light init'
      }
    }
    stage('plan') {
      steps {
        sh 'docker run -w /app -v /root/.aws:/root/.aws -v `pwd`:/app hashicorp/terraform:light plan'
      }
    }
    stage('approval') {
      options {
        timeout(time: 1, unit: 'HOURS') 
      }
      steps {
        input 'approve the plan to proceed and apply'
      }
    }
    stage('apply') {
      steps {
        sh 'docker run -w /app -v /root/.aws:/root/.aws -v `pwd`:/app hashicorp/terraform:light apply -auto-approve'
        cleanWs()
      }
    }
  }
}
