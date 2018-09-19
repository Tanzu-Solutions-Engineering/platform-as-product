# Platform as a Product Demo

This is to demonstrate how we treat the Platform as a Product by using a Concourse pipeline to leverage Cloud Foundry and Pivnet APIs to upgrade Buildpacks.

This concept can easily be applied for upgrading products as well such as Stemcells, MySQL, PAS or even OpsManager to name a few.

## Quick Start for Upgrading Buildpack

1. Clone this repository.
2. Go to the `ci` directory and copy `pipeline-params.yml.sample` to `your-pipeline-params.yml`
3. Edit `your-pipeline-params.yml` for your specific deployment
4. Deploy the pipeline using fly. For example: `fly -t wings set-pipeline -p platform-as-product -c pipeline.yml --load-vars-from pipeline-params.yml`
5. Unpause the new pipeline. For example: `fly -t wings unpause-pipeline -p platform-as-product`
6. Manually start the regulator job and wait for the pipeline to execute through stage job
7. When ready manually kick off promote job
8. Afterwards you need to reset the buildpack - see below

## Updating the pipeline
You will need to reset the buildpack after upgrading in order to run the demo again.  Therefore, you'll want to change the job ``dotnet-core-buildpack`` to use ``product_version: ".NET Core 2.1.3"``.

## Slides
These [slides](https://docs.google.com/presentation/d/1j6gLb1t6uoN1tsRsOVmZsPw0sCLEXc-jLThTiseTC-I/edit#slide=id.g40fcc755db_0_355) complement the buildpack upgrade.

## PCF Foundation Info for S1P
This is shut down at night since it runs on GCP. You will need to login.  See [google doc](https://docs.google.com/spreadsheets/d/1X48beVPXKBcTqAyDdjx2kPCOFZLfpimAxu0O270I7LQ/edit#gid=772775189) for creds.

``cf login -a https://api.system.srt-v2-pas.pcf-labs.com --skip-ssl-validation``

## Quick Start for Upgrading a Tile

1. Clone this repository.
2. Go to the `ci` directory and copy `tile-params.yml.sample` to `your-pipeline-params.yml`
3. Edit `your-pipeline-params.yml` for your specific deployment
4. Deploy the pipeline using fly. For example: `fly -t wings set-pipeline -p platform-as-product -c pipeline.yml --load-vars-from pipeline-params.yml`
5. Unpause the new pipeline. For example: `fly -t wings unpause-pipeline -p platform-as-product`
6. Manually start the regulator job and wait for the pipeline to execute through upload-and-stage job
7. If necessary, run the generate-product-config job and copy the apply_changes_config that is generated and put it in your params file.
8. Update your pipeline with the new config, then start the apply-changes job.

Note: Depending on the tile you're upgrading, it can take a while for this to complete.  For example, it took 1h 45m to upgrade PAS.  So if you're demoing this, choose a tile that upgrades quickly and perhaps turn off errands.

## References

Upgrade buildpack is based on [PCF Pipelines](https://github.com/pivotal-cf/pcf-pipelines)

Upgrade tile/product pipeline is based on Rahul's [PCF Product Tile Pipelines](https://github.com/rahul-kj/pcf-concourse-pipelines) and [PCF Pipelines](https://github.com/pivotal-cf/pcf-pipelines).  I combined elements I like from each repo and created my own repo for the [pcf-pipelines](git@github.com:msegvich/pcf-tiles-pipelines.git) resource.
