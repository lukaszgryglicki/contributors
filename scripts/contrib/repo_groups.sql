-- Add repository groups
update gha_repos set repo_group = name;
update gha_repos set alias = name;

update gha_repos set repo_group = 'CNCF', alias = 'CNCF';

update
  gha_repos
set
  repo_group = 'OpenStack',
  alias = 'OpenStack'
where
  lower(org_login) like 'openstack%'
  or org_login = 'kata-containers'
;

select
  repo_group,
  count(*) as number_of_repos
from
  gha_repos
where
  repo_group is not null
group by
  repo_group
order by
  number_of_repos desc,
  repo_group asc;
