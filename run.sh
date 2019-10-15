#!/bin/bash
# cp ~/dev/go/src/github.com/cncf/devstats/util_sql/postprocess_texts.sql util_sql/
# cp ~/dev/go/src/github.com/cncf/devstats/util_sql/postprocess_labels.sql util_sql/
# cp ~/dev/go/src/github.com/cncf/devstats/util_sql/postprocess_issues_prs.sql util_sql/
# cp ~/dev/go/src/github.com/cncf/devstats/util_sql/postprocess_repo_groups_from_repos.sql util_sql/
# cp ~/dev/go/src/github.com/cncf/devstats/util_sql/country_codes.sql util_sql/
GHA2DB_AECLEANSKIP=1 GHA2DB_GETREPOSSKIP=1 GHA2DB_GHAPISKIP=1 GHA2DB_LOCAL=1 GHA2DB_PROJECTS_YAML="contrib_projects.yaml" devstats || exit 1
echo OK
