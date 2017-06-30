# Deploy a static website with S3 and terraform

This repo will show you how to create the necessary infrastructure to host a static web page via terraform.
It also includes a sample application that can be deployed.
The page itself will be uploaded via aws cli.

## Prerequesites

* terraform
* aws cli
* configured aws profile (do it with cli, will also be used by terraform)

## The infrastructure

The infrastructure is defined in main.tf. Make sure to change the bucket name. Bucketnames are unique! The infrastructure and can be provisioned with 

    terraform apply

After the command has successfully run you should get an output named: website-endpoint. Remember that for later.

You can destroy the infrastruture with

    terraform destroy -force

This might fail if the bucket you try to delete ist still containing items. If so delete the content of the bucket before that.

aws s3 rm --recursive s3://{bucketname}

As an alternative you can define the force_destroy parameter in the bucket properties in main.tf

## The website

As an example I created a angular web app. You can use whatever framework (or none at all). If you want to create your own angular web app you can use the ng cli to create your app.
If you haven't done so install the ng cli (you need npm for that):

    npm install -g @angular/cli

Then create the app:

    ng new spa-demo

Then get it ready for deployment (build, minify...)

    cd .\spa-demo\
    ng build --prod

This should have build the app to the folder dist.


## Deploying the website

To deploy the website to your bucket run the following command

    aws s3 sync --delete --acl public-read .\spa-demo\dist\ s3://{bucketname}

You can now navigate to the website-endpoint we got earlier.

To update the site make whatever changes you want and build the web app with the "ng build" command and rerun the sync command 