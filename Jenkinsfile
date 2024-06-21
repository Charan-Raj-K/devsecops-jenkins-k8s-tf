pipeline {
  agent any
  tools { 
        maven 'Maven_3_5_2'  
    }
   stages{
    stage('CompileandRunSonarAnalysis') {
            steps {	
		sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=jenkins-buggywebapp -Dsonar.organization=jenkins-buggywebapp -Dsonar.host.url=https://sonarcloud.io -Dsonar.token=87b213369707779819a4615008c148ade8210c7e'
			}
        } 
  }
}
