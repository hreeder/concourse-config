#!/bin/bash
wget https://github.com/concourse/concourse/releases/download/v5.0.0/fly-5.0.0-linux-amd64.tgz
tar xzf fly-5.0.0-linux-amd64.tgz

./fly -t main login -c $URL -u $USERNAME -p $PASSWORD

./fly -t main set-team -n harry-infra -c config/teams/harry-infra.yaml
