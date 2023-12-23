#!/usr/bin/

pipeline {
    agent any

    environment {
       AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
       AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
       AWS_DEFAULT_REGION = "us-east-1"
    }

    stages {
        stage("Initializing Terraform") {
            steps {
                script {
                    dir('terraform') {
                        sh "terraform init"
                    }
                }
            }
        }

        stage("Validating Terraform") {
            steps {
                script {
                    dir('terraform') {
                        sh "terraform validate"
                    }
                }
            }
        }

        stage("Formatting Terraform Code") {
            steps {
                script {
                    dir('terraform') {
                        sh "terraform fmt"
                    }
                }
            }
        }

        stage("Planing the Infrastructure using Terraform") {
            steps{
                script{
                    dir('terraform'){
                        sh 'terraform plan'
                    }
                    input(message: "Are you sure to proceed?", ok: "Proceed")
                }
            }
        }

        stage("Building the my-eks-cluster") {
            steps {
                script {
                    dir('terraform') {
                        sh "terraform $action --auto-approve"
                    }
                }
            }
        }

        stage("Deploying our cookies-web-app") {
            steps {
                script {
                    dir('kubernetes') {
                        sh "aws eks --region us-east-1 update-kubeconfig --name my-eks-cluster"
                        sh "kubectl apply -f cookiesweb-manifest.yaml"
                        sh "kubectl apply -f cookiesweb-service-manifest.yaml"
                    }
                }
            }
        }
    }
}

