pipeline {
  agent any
  tools { 
        maven 'Maven_3_6_3'  
    }
   stages{
    stage('CompileandRunSonarAnalysis') {
            steps {	
		sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=jenkins-buggywebapp -Dsonar.organization=jenkins-buggywebapp -Dsonar.host.url=https://sonarcloud.io -Dsonar.token=87b213369707779819a4615008c148ade8210c7e'
			}
        }
     stage('RunSCAScanAnalysisUsingSNYK'){
            steps{
             withCredentials([string(credentialsId: 'SNYK_TOKEN', variable: 'SNYK_TOKEN')]) {
             sh 'mvn snyk:test -fn'
                }     
            }
     }

     stage('docker-build'){
       steps{
         withDockerRegistry([credentialsId: "DOCKER_LOGIN", url: ""]){
            script{
                  app = docker.build("devsecops-pipeline-app")
            }
         }   
       }
     }

     stage('push-image-to-ecr'){
      steps{
         script{
            docker.withRegistry('375016145121.dkr.ecr.us-east-2.amazonaws.com/devsecops-pipeline-app','ecr:us-west-2:AWS_CREDS'){
                  app.push("Latest")
            }
         }   
      }
     }    
  }
}
