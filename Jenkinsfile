pipeline{
    
    agent any
    stages{
         stage('Terraform Init'){
            steps{
                dir("${env.WORKSPACE}/vpc"){
                bat 'terraform init'
            }
        }
        }
        stage('Terraform Plan'){
            steps{
                withAWS(credentials: 'aws-cred') {
                dir("${env.WORKSPACE}/vpc"){
                bat 'terraform plan'
            }
            }
        }
        }
        stage('Terraform Apply'){
            steps{
                timeout(time:5, unit:'MINUTES'){
                    input message: 'Are you sure you want to Apply?'
                }
                withAWS(credentials: 'aws-cred') {
                dir("${env.WORKSPACE}/vpc"){
                bat 'terraform apply --auto-approve'
            }
            }
        }
        }
        stage('Terraform Destroy'){
            steps{
                 timeout(time:5, unit:'MINUTES'){
                    input message: 'Are you sure you want to detroy?'
                }
                withAWS(credentials: 'aws-cred') {
                dir("${env.WORKSPACE}/vpc"){
                bat 'terraform destroy --auto-approve'
            }
            }
        }
    }
}
}
        

