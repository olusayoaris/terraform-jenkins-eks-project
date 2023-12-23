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
                    dir('eks-test') {
                        sh "terraform init"
                    }
                }
            }
        }

        stage("Validating Terraform") {
            steps {
                script {
                    dir('eks-test') {
                        sh "terraform validate"
                    }
                }
            }
        }

        stage("Formatting Terraform Code") {
            steps {
                script {
                    dir('eks-test') {
                        sh "terraform fmt"
                    }
                }
            }
        }

        stage("Previewing the Infra using Terraform") {
            steps{
                script{
                    dir('eks-test'){
                        sh 'terraform plan'
                    }
                    input(message: "Are you sure to proceed?", ok: "Proceed")
                }
            }
        }

        stage("Creating a my-eks-cluster") {
            steps {
                script {
                    dir('eks-test') {
                        sh "terraform $action --auto-approve"
                    }
                }
            }
        }

        stage("Deploying to Votingapp EKS Cluster") {
            steps {
                script {
                    dir('kubernetes') {
                        sh "aws eks --region us-east-1 update-kubeconfig --name my-eks-cluster"
                        sh "kubectl apply -f mongodb-manifest.yaml"
                        sh "kubectl apply -f mongodb-service-manifest.yaml"
                        sh "kubectl apply -f votingapp-manifest.yaml"
                        sh "kubectl apply -f votingapp-service-manifest.yaml"
                    }
                }
            }
        }
    }
}

