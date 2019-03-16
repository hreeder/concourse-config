#!/bin/sh
apk add ca-certificates
wget https://github.com/concourse/concourse/releases/download/v5.0.0/fly-5.0.0-linux-amd64.tgz
tar xzf fly-5.0.0-linux-amd64.tgz

echo "Configuring Concourse at $BASE_URL"
./fly -t main login -c "$BASE_URL" -u "$USERNAME" -p "$PASSWORD"

./fly -t main set-team -n harry-infra -c config/teams/harry-infra.yaml
