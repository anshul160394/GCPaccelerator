pipeline {
    agent any
    stages {
            stage ('Docker Build') {
         // Build and push image with Jenkins' docker-plugin
            withDockerRegistry([credentialsId: "dockerhub", url: "https://index.docker.io/v1/"]) {

            image = docker.build("devendradhoot/vote", "vote")
            image.push()    
            image = docker.build("devendradhoot/result", "result")
            image.push()
            image = docker.build("devendradhoot/worker", "worker")
            image.push()
            
            

            }
        }
           stage('Git Clone') {
             steps {
                 script { 
                     sshagent(credentials : ['ubuntu']) {
                    sh "scp -r -o StrictHostKeyChecking=no * $ssh_user@$HOST:/home/ubuntu/deploy"                
                    }
                }
             }
         }
         
        }
    }
