# contributors
Comparing CNCF and OpenStack contributors

- To deploy projects use: `PG_PASS=... ./deploy.sh` (see some other options commented out in deploy.sh).
- To run sync (update since last run) use: `PG_PASS=... ./run.sh`.
- To run sync from cron copy `contrib.sh` to your PATH and install crontab from `crontab` (changing PATH, passwords etc.).
- To start grafana process (for example after server restart) run `./grafana.sh`.

Note that this project uses non-standard bots exclusion list.
- 'openstack-gerrit' bot is enabled, because it is generating >80% of OpenStack traffic.

