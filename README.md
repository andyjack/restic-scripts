## Setup

### Install

https://github.com/restic/restic/releases

Unpack the file into e.g. `~/local/bin`

You can `cd ~/local/bin && ./restic self-update` to do an in place update.

### Init a repository

```
cd /my-big-disk
mkdir backup-repo
restic -r backup-repo init
# think of a good password and save it
```

### `password.txt`

Put your password into a password.txt file in this git repo.

Good idea: `chmod 600 password.txt`, so this file can't be read by other users
on your system.

### `exclude.txt`

Put some excludes into this file in the git repo.

See [the
docs](https://restic.readthedocs.io/en/stable/040_backup.html#including-and-excluding-files)
for creating excludes.

### `env.sh`

```
export RESTIC_REPOSITORY=/path/to/repo
export PASSWORD_FILE=password.txt
```

### crontab

```
MAILTO=me@mymail
PATH=/bin:/usr/bin:/path/to/bin/restic
0  9-19/2 * * 1-5 $HOME/local/work/restic-scripts/backup.sh --quiet $HOME
55 23     * * *   $HOME/local/work/restic-scripts/backup.sh --quiet /etc 2>&1 | grep -v 'permission denied'
0  0      * * *   $HOME/local/work/restic-scripts/forget.sh --quiet
30 0      * * *   $HOME/local/work/restic-scripts/restic.sh check --quiet || /bin/echo "restic check failed!"
```

<!--
 vim:tw=78
-->
