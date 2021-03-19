pipeline {
    agent any 
	
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
                bat 'mvn clean install'
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
                //withSonarQubeEnv(credentialsId: 'New Sonar', installationName: 'sonarserver') 
                {
                    bat "mvn sonar:sonar"
                }   
            }
        }
        stage('Upload to Artifactory')
        {
	        steps
	        {
			echo 'Uploading....'
		        rtMavenDeployer (
    			    id: 'deployer-unique-id',
		            serverId: 'Artifactory Server',
		            releaseRepo: 'example-repo-local',
		            snapshotRepo: 'example-repo-local' 
		        )
		        rtMavenRun (
		        pom: 'pom.xml',
		        goals: 'clean install',
		        deployerId: 'deployer-unique-id' 
		        )
		        rtPublishBuildInfo (
		            serverId: 'Artifactory Server' 
		                )
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
