#!/bin/sh
apk add ca-certificates
wget https://github.com/concourse/concourse/releases/download/v5.0.0/fly-5.0.0-linux-amd64.tgz
tar xzf fly-5.0.0-linux-amd64.tgz

echo "Configuring Concourse at $BASE_URL, using user $USERNAME"
./fly -t main login -c "$BASE_URL" -u "$USERNAME" -p "$PASSWORD"

yes | ./fly -t main set-pipeline -p concourse-config -c config/pipelines/concourse-config.pipeline.yml

yes | ./fly -t main set-team -n harry-infra -c config/teams/harry-infra.yaml
