select
  dup_actor_login as actor,
  type,
  count(id) as cnt
from
  gha_events
where
  repo_id in (
    select id
    from
      gha_repos
    where
      lower(org_login) like 'openstack%'
  )
group by
  dup_actor_login,
  type
order by
  cnt desc
;
