#!/usr/bin/env bash

# You can use wings as well. This is my own Concourse server.  It uses github authentication.
# Contact @msegvich to get added to the github org
fly -t s1p login --concourse-url https://s1p.ci.pcf-labs.com --ca-cert ./s1p-ca-cert.pem
fly -t s1p fly trigger-job -j reset-buildpack/regulator
