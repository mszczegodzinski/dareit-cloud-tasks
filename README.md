# cloud_challenge

DareIT tasks

## DareIT Cloud Challenge 2023

### task_1:

List available services in "My First Project".

### task_2:

Create a unique bucket with a basic, static website and make it public. Created URL place to website_url file.

### task_3 and task_3_optional:

Add cloud function url and hello_function script

### task_4:

Create a VM, install apache server, and host index.html file

### task_5:

Create a postgres DB instance in the GCP, insert student data and calculate the average age of them.

Task 5 question:
What is average age of the students in the class?
31.33

### task_6

Infrastructure as a code using Terraform
1. Create main.tf file, configure the provider and add configuration to create resources: 
1.1. Cloud Storage bucket that has public access configured
1.2. Compute Instance
1.3. Cloud SQL instance with Postgres engine. Create database called dareit and a user called dareit_user
2. Manually change the password of the dareit_user
3. Upload manually the index.html file (that you previously created in Task 1) into the newly created bucket.
Create a new folder in your cloud_challenge repo with name task_6 , commit the main.tf file there. (don’t commit your terraform state file). Copy the URL of the object (index.htm) from your bucket and add it to readme.md.

Ad.3:
https://storage.googleapis.com/my_task_6_bucket/index.html