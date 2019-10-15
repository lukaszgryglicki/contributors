#!/bin/bash
function finish {
  rm -rf devel/ util_sql/ shared/ apache/ grafana/shared/
  git checkout devel/* util_sql/*
}
trap finish EXIT
# PG_PASS=... ./deploy.sh
# CERT=1 GHA2DB_AECLEANSKIP=1 GHA2DB_GETREPOSSKIP=1 GHA2DB_GHAPISKIP=1 IDROP=1 PDROP=1 STOP=1 RM=1 ./devel/deploy_contrib.sh || exit 1
# GHA2DB_AECLEANSKIP=1 GHA2DB_GETREPOSSKIP=1 GHA2DB_GHAPISKIP=1 STOP=1 RM=1 ./devel/deploy_contrib.sh || exit 1
# GHA2DB_AECLEANSKIP=1 GHA2DB_GETREPOSSKIP=1 GHA2DB_GHAPISKIP=1 IDROP=1 PDROP=1 ./devel/deploy_contrib.sh || exit 1
# GHA2DB_AECLEANSKIP=1 GHA2DB_GETREPOSSKIP=1 GHA2DB_GHAPISKIP=1 SKIPTEMP=1 IDROP=1 ./devel/deploy_contrib.sh || exit 1
# GHA2DB_AECLEANSKIP=1 GHA2DB_GETREPOSSKIP=1 GHA2DB_GHAPISKIP=1 IDROP=1 PDROP=1 SKIPTEMP=1 ./devel/deploy_contrib.sh || exit 1
# GHA2DB_AECLEANSKIP=1 GHA2DB_GETREPOSSKIP=1 GHA2DB_GHAPISKIP=1 STOP=1 CUSTGRAFPATH=1 ./devel/deploy_contrib.sh || exit 1
# GHA2DB_AECLEANSKIP=1 GHA2DB_GETREPOSSKIP=1 GHA2DB_GHAPISKIP=1 SKIPTEMP=1 ./devel/deploy_contrib.sh || exit 1
# GHA2DB_NCPUS=40 GHA2DB_AECLEANSKIP=1 GHA2DB_GETREPOSSKIP=1 GHA2DB_GHAPISKIP=1 SKIPTEMP=1 ./devel/deploy_contrib.sh || exit 1
cp -n ~/dev/go/src/github.com/cncf/devstats/devel/* ./devel/
cp -n ~/dev/go/src/github.com/cncf/devstats/util_sql/* ./util_sql/
cp -R ~/dev/go/src/github.com/cncf/devstats/shared ./shared/
cp -R ~/dev/go/src/github.com/cncf/devstats/apache ./apache
cp -R ~/dev/go/src/github.com/cncf/devstats/grafana/shared ./grafana/shared
cp ~/dev/go/src/github.com/cncf/devstats/skip_dates.yaml ~/dev/go/src/github.com/cncf/devstats/companies.yaml ./
export GHA2DB_PROJECTS_YAML="contrib_projects.yaml"
GHA2DB_AECLEANSKIP=1 GHA2DB_GETREPOSSKIP=1 GHA2DB_GHAPISKIP=1 CUSTGRAFPATH=1 SKIPTEMP=1 SKIPWWW=1 TRAP=1 ./devel/deploy_contrib.sh || exit 1
echo 'Deploy succeeded'
