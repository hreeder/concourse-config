#!/bin/sh
apk add --no-progress ca-certificates
wget https://github.com/concourse/concourse/releases/download/v5.0.0/fly-5.0.0-linux-amd64.tgz
tar xzf fly-5.0.0-linux-amd64.tgz

echo "Configuring Concourse at $BASE_URL, using user $USERNAME"
./fly -t main login -c "$BASE_URL" -u "$USERNAME" -p "$PASSWORD"

yes | ./fly -t main set-pipeline -p concourse-config -c config/pipelines/concourse-config.pipeline.yml

for filename in config/teams/*.yaml; do
    teamname=$(basename $filename .yaml)
    yes | ./fly -t errwtf set-team -n $teamname -c $filename
done
