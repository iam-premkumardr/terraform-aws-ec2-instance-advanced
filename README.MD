<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running and follow these simple example steps.

### Prerequisites

This is one time activity and you don't need to do it everytime.

This is an example of how to use the terraform module and how to install them.

Install Terraform locally using the link https://developer.hashicorp.com/terraform/install

Preferablly binary download and extract it to c:\Program Files\Terraform

Open the powershell in admin mode and run the below command (Windows Only)

```sh
# Set $installPath to location of Terraform executable
$installPath = "C:\Program Files\Terraform"
# Save current value of PATH
$currentPath = (Get-Item -path "HKCU:\Environment" ).GetValue('Path', '', 'DoNotExpandEnvironmentNames')
# Add $installPath to $currentPath, saved as $newPath
$newPath = $currentPath + ";$installPath"
# Set PATH environment variable to $newPath value
setx PATH ($newPath)
   ```

Verify the installation
  ```sh
 terraform -help
   ```

Configure the aws login
 ```sh
 aws configure
   ```

### Installation

1. Initialise the terraform module 
 ```sh
 terraform init
   ```

2. Plan and check the terraform module 
 ```sh
 terraform plan
   ```
3. Apply the terraform module 
 ```sh
 terraform apply -auto-approve
   ```
<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

Assumptions 
a) you have already run ```aws configure``` with the correct access credentials to create the environment.
b) This is executed from windows machine.

1. create s3 and dynamodb for remote s3 state maintenance. Change the directory where repository exists.
  ```sh
cd C:\devops\terraform-aws-ec2-instance-advanced
  ```
2. Initialise the terraform module 
 ```sh
 terraform init
   ```
3. Plan and check the terraform module 
 ```sh
 terraform plan
   ```
4. Apply the terraform module 
 ```sh
 terraform apply -auto-approve
   ```
5. once the s3 bucket and dynamodb tables are created you run the below command and do it for each environments.
 ```sh
terraform -chdir=C:\devops\terraform-aws-ec2-instance-advanced\environments\prd workspace new prd 
   ```
6. Change the directory as per you current folder/directory structure. This step will create the VM with configuration in main.tf. You can modify it accord to your need.
 ```sh
terraform -chdir=C:\devops\terraform-aws-ec2-instance-advanced\environments\prd init
   ```
7. Plan and check the terraform module for create an VM 
 ```sh
 terraform -chdir=C:\devops\terraform-aws-ec2-instance-advanced\environments\prd plan
   ```
8. Apply the terraform module 
 ```sh
 terraform -chdir=C:\devops\terraform-aws-ec2-instance-advanced\environments\prd apply -auto-approve
   ```
_For more examples, please refer to the [Documentation](https://developer.hashicorp.com/terraform/tutorials)_

<p align="right">(<a href="#readme-top">back to top</a>)</p># terraform-aws-ec2-instance
