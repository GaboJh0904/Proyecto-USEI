pipeline {
    agent any
    tools {
        maven 'MVN_339'
    }

    environment {
        WAR_FILE = "Backend/target/usei-0.0.1-SNAPSHOT.war"
        RENAMED_WAR = "Backend/target/usei.war"
        TOMCAT_URL = "http://localhost:9191/manager/text"
        TOMCAT_CREDENTIALS = credentials('d1a27c8a-2d5e-4ac7-a2fc-7c6f612b1486') // ID de credenciales en Jenkins para Tomcat
    }

    stages {
        stage('Clonar repositorio') {
            steps {
                git branch: 'Backend-Branch', url: 'https://github.com/GaboJh0904/Proyecto-USEI.git'
            }
        }

        stage('Build') {
            steps {
                dir('Backend') {
                    bat 'mvn clean package'
                }
            }
        }

        stage('Test') {
            steps {
                dir('Backend') {
                    bat 'mvn test'
                }
            }
        }

        stage('Rename WAR') {
            steps {
                script {
                      bat 'copy /Y "Backend\\target\\usei-0.0.1-SNAPSHOT.war" "Backend\\target\\usei.war"'
                }
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                script {
                    bat "curl -u ${env.TOMCAT_CREDENTIALS_USR}:${env.TOMCAT_CREDENTIALS_PSW} --upload-file ${RENAMED_WAR} \"${env.TOMCAT_URL}/deploy?path=/usei&update=true\""
                }
            }
        }
    }

    post {
        always {
            dir('Backend') {
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
                // junit '**/target/surefire-reports/TEST-*.xml'
            }
        }
    }
}
