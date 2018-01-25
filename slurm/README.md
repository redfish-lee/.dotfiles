### Slurm

#### Installation
##### Slurm associated components
```bash
$ apt-get update
$ apt-get install git gcc make ruby ruby-dev libpam0g-dev libmariadb-client-lgpl-dev libmysqlclient-dev
$ gem install fpm
```
##### Munge (key)
```bash
$ apt-get install libmunge-dev libmunge2 munge
$ systemctl enable munge
$ systemctl start munge
$ munge -n | unmunge | grep STATUS
STATUS:           Success (0)
```

##### Build Slurm
```bash
$ wget https://www.schedmd.com/downloads/archive/slurm-17.02.6.tar.bz2
$ tar xvjf slurm-17.02.6.tar.bz2
$ cd slurm-17.02.6
$ ./configure --prefix=/tmp/slurm-build \
              --sysconfdir=/etc/slurm \
              --enable-pam --with-pam_dir=/lib/x86_64-linux-gnu/security/
$ make
$ make install
### settings
$ cd ..
$ fpm -s dir -t deb -v 1.0 -n slurm-17.02.6 --prefix=/usr -C /tmp/slurm-build .
$ dpkg -i slurm-17.02.6_1.0_amd64.deb
$ useradd slurm 
$ mkdir -p /etc/slurm /var/spool/slurm/ctld /var/spool/slurm/d /var/log/slurm
$ chown slurm /var/spool/slurm/ctld /var/spool/slurm/d /var/log/slurm
```

- `slurm.conf` should be put in `/etc/slurm/
- `SlurmdSpoolDir=/var/spool/slurm/d` need to be set.
- `slurmctld.service` is acive only on controller node.
```bash
user@ivsdeep3:~$ systemctl status slurmctld.service
● slurmctld.service - Slurm controller daemon
   Loaded: loaded (/lib/systemd/system/slurmctld.service; enabled; vendor preset: enabled)
   Active: active (running) since Tue 2018-01-23 19:24:23 CST;
  Process: 4551 ExecStart=/usr/sbin/slurmctld $SLURMCTLD_OPTIONS
 Main PID: 4554 (slurmctld)
   CGroup: /system.slice/slurmctld.service
           └─4554 /usr/sbin/slurmctld
```

#### Compute node
##### Install Munge
All compute nodes should share the same munge.key from controller node.
```bash
$ apt-get update
$ apt-get install libmunge-dev libmunge2 munge
$ scp slurm-ctrl:/etc/munge/munge.key /etc/munge/
$ chown munge:munge /etc/munge/munge.key
$ chmod 400 /etc/munge/munge.key

$ systemctl enable munge
$ systemctl restart munge

```

#### Scenario
```bash
### Different STATE will show node on same partition separately.
user@ivsdeep3:~$ sinfo
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
debug*       up      15:00      1   idle ivsdeep3
debug*       up      15:00      1   down ivsdeep5

### Same STATE
user@ivsdeep3:~$ sinfo
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
debug*       up      15:00      2   idle ivsdeep[3,5]
```

#### Troubleshooting
- Fix down state of node
```bash
user@ivsdeep5:/var/log/slurm-llnl$ sinfo
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
debug*       up      15:00      1   down ivsdeep5

### /var/log/slurm/slurmd.log
[2018-01-23T19:27:54.028] error: this host (ivsdeep5) not valid controller (ivsdeep3 or (null))
user@ivsdeep5:/var/log/slurm-llnl$ sudo scontrol update nodename=ivsdeep5 state=resume

user@ivsdeep5:/var/log/slurm-llnl$ sinfo
debug*       up      15:00      1   idle ivsdeep5
```

- Check slurmd service state
```bash
user@ivsdeep5:/var/log/slurm-llnl$ systemctl status slurmd
● slurmd.service - Slurm node daemon
   Loaded: loaded (/lib/systemd/system/slurmd.service; enabled; vendor preset: enabled)
   Active: active (running) since Tue 2018-01-23 19:27:54 CST; 24min ago
  Process: 1850 ExecStart=/usr/sbin/slurmd $SLURMD_OPTIONS (code=exited, status=0/SUCCESS)
 Main PID: 1889 (slurmd)
   CGroup: /system.slice/slurmd.service
           └─1889 /usr/sbin/slurmd
```
