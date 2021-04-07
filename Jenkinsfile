pipeline {
    agent any
	tools
	{
		maven "Maven3"
		 jdk "Default"
	}
	
    stages {
        stage('CheckOut')
        {
            steps
            {
                checkout scm
            }
        }
        stage('Build') 
        {
            steps 
            {
                echo 'Hello World'
		echo 'Building.....'
                bat  "mvn package"
            }
        }
	
        stage('Unit Test')
        {
            steps
            {
		echo 'Testing....'
                bat 'mvn test'
            }
        }
        stage('Sonar Analysis') 
        {
            steps 
            {
		echo 'Sonar Analysis....'
                withSonarQubeEnv("Sonar")
                //withSonarQubeEnv(credentialsId: 'sonar-api-key', installationName: 'sonarserver') 
                {
                    bat "mvn sonar:sonar"
                }   
            }
        }
        stage('Artifactory')
        {
	        steps
	        {
		        rtMavenDeployer (
    			    id: 'deployer',
		            serverId: 'Artifactory Server',
		            releaseRepo: 'example-repo-local',
		            snapshotRepo: 'example-repo-local' 
		        )
		        rtMavenRun (
		        pom: 'pom.xml',
		        goals: 'clean install',
		        deployerId: 'deployer'
			)
		        rtPublishBuildInfo (
		            serverId: 'Artifactory Server' 
		                )
	        }
	}

       stage('Build Image'){
		    steps{
			    bat "docker build -t secondimage ."
		    }
	    }
	    stage("Cleaning Previous Deployment"){
		steps{
		catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
		bat "docker stop secondcontainer"
		bat "docker rm -f secondcontainer"
			}
		}
}
	    
	     stage('Docker Deployment'){
		    steps{
			    bat "docker run --name secondcontainer -d -p 9090:8080 secondimage"
		    }
	    }
	stage ('deploy')
	    {
		    steps
		    {
			    bat 'dir'
			    bat 'xcopy /S /Q /Y /F target\\*.war "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.5\\webapps"'
			    //bat 'C:\\apache-tomcat-8.5.61\\bin\\catalina.bat restart'
		    }
	    }
    }
}
