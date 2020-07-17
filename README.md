# 23People Application

This is an API with CI/CD, using GCP Cloud Run, GCP SQL (postgres) and Apigee proxy with auth.
in the developer branch you can see the most important steps to make this small API.

I will expose the most important files:

* test/controller/people_controller_test.rb
in this file we have all the test for people controller class and to complete the (4) REST API Spec in the document

* app/controller/people_controller.rb
in this file you will find the controller method for every path request possible

* db/schema.rb
this is the schema of database that rails use to make every table

* config/routes.rb
here we have all the routes permitted by our application

* Dockerfile
is the file to run the test and build the container for application

* cloudbuild.yaml
is the file to make the build in GCP, push this to a Container Registry and Deploy this
