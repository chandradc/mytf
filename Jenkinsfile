pipeline{
    
    agent any
    stages{
        stage('Git Checkout'){
            steps{
                git 'https://github.com/chandradc/mytf.git'
            }
        }
        stage('Terraform Init'){
            steps{
                bat 'terraform init'
            }
        }
        stage('Terraform Apply'){
            steps{
                withAWS(credentials: 'aws-cred') {
                bat 'terraform apply --auto-approve'
            }
            }
        }
        stage('Terraform Destroy'){
            steps{
                 timeout(time:5, unit:'MINUTES'){
                    input message: 'Are you sure you want to detroy?'
                }
                withAWS(credentials: 'aws-cred') {
                bat 'terraform destroy --auto-approve'
            }
            }
        }
    }
}