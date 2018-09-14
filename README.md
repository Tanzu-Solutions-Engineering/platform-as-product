# Platform as a Product Demo

This is to demonstrate how we treat the Platform as a Product by using a Concourse pipeline to leverage Cloud Foundry and Pivnet APIs to upgrade Buildpacks.

This concept can easily be applied for upgrading products as well such as Stemcells, MySQL, PAS or even OpsManager to name a few.

## Quick Start

1. Clone this repository.
2. Go to the `ci` directory and copy `pipeline-params.yml.sample` to `pipeline-params.yml`
3. Edit `pipeline-params.yml` for your specific deployment
4. Deploy the pipeline using fly. For example: `fly -t wings set-pipeline -p platform-as-product -c pipeline.yml --load-vars-from pipeline-params.yml`
5. Unpause the new pipeline. For example: `fly -t wings unpause-pipeline -p platform-as-product`
6. Manually start the regulator job and wait for the pipeline to execute through stage job
7. When ready manually kick off promote job
8. Afterwards you need to reset the buildpack - see below

## Updating the pipeline
You will need to reset the buildpack after upgrading in order to run the demo again.  Therefore, you'll want to change the job ``dotnet-core-buildpack`` to use ``product_version: ".NET Core 2.1.3"``.

## PCF Foundation Info
You will need to login.  See [google doc](https://docs.google.com/spreadsheets/d/1X48beVPXKBcTqAyDdjx2kPCOFZLfpimAxu0O270I7LQ/edit#gid=772775189) for creds.

``cf login -a https://api.system.srt-v2-pas.pcf-labs.com --skip-ssl-validation``
 