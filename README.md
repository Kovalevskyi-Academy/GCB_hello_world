# GCB_hello_world
This is a test repo for learning Google Claud Build. Lets experimenting! :)

## Hello world from container in local GCB
1. clear docker run example: `docker run --rm --name alpTest -it alpine echo 'Hello World from Alpine container in Google Cloud Build'`

## Build project locally
2. Try cloud-build local: `cloud-build-local --config=cloudbuild.yaml --dryrun=false .`

## Run build hello world in the cloud
3. Try cloud-build in cloud, using CLI: `gcloud builds submit --config cloudbuild.yaml`
