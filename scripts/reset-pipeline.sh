#!/usr/bin/env bash

fly -t s1p destroy-pipeline -p upgrade-buildpack -n
fly -t s1p sp -p upgrade-buildpack -c ci/demo-upgrade-buildpack-pipeline.yml -l ci/s1p-buildpack-params.yml
