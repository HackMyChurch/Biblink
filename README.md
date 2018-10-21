# Biblink
Appli qui lie Bible &amp; art

## Install Virtualbox
https://www.virtualbox.org/

### Install Vagrant
https://www.vagrantup.com/downloads.html

### Configure Local VM with Vagrant

- Add Local VM host in `/etc/hosts` file: `192.168.56.4 biblink`
- To prevent old ssh keys issues : `ssh-keygen -R 192.168.56.4`

### Start Vagrant on host machine
`# vagrant up`

## Couchdb

### Optional : Launch ansible playbook manually from host machine to install couchdb on guest vm. ansible should be installed on host machine
`# ansible-playbook -i provisionning/hosts provisionning/install-couchdb.yml`

### Modify config couchdb
- `# vagrant ssh`
- `[vagrant@biblink 2.2.0]$ sudo vi /opt/couchdb/etc/default.ini`

- Let couchdb listen to other IP adresse &nbsp;&nbsp;&nbsp;http://docs.couchdb.org/en/stable/config/http.html : <br/>`bind_address = 0.0.0.0`
- Enable CORS &nbsp;&nbsp;&nbsp; http://docs.couchdb.org/en/1.3.0/cors.html : <br/>
`enable_cors = true`

`[cors]`

`credentials = false`

`origins = *`
### Start couchdb on guest vm
- `[vagrant@biblink 2.2.0]$ sudo systemctl start couchdb`
- `[vagrant@biblink 2.2.0]$ sudo systemctl enable couchdb`

### Check couchdb status :

- `[vagrant@biblink 2.2.0]$ systemctl status couchdb`
- `[vagrant@biblink 2.2.0]$ netstat -ln | grep 5984`

### Install couchapp on host machine
`# sudo pip install couchapp`

### Install Argos

- On host machine, create a database named **argos** at 

http://127.0.0.1:5984/_utils

port forwarding allows to reach couchdb on guest vm from host machine
- `# git clone https://github.com/Hypertopic/Argos.git`
- `# cd Argos`
- `# couchapp init`
- `# couchapp push http://127.0.0.1:5984/argos`

### Load data
`# curl -d @data/HMB_01.json -H "Content-type: application/json" -X POST http://127.0.0.1:5984/argos/_bulk_docs`

