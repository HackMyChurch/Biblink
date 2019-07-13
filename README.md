# Biblink
Appli qui lie Bible &amp; art

## Install Virtualbox
[https://www.virtualbox.org/](https://www.virtualbox.org/)

## Install Vagrant
[https://www.vagrantup.com/downloads.html](https://www.vagrantup.com/downloads.html)

### Configure Local VM with Vagrant

- Add Local VM host in `/etc/hosts` file: `192.168.56.4 biblink`
- To prevent old ssh keys issues : `ssh-keygen -R 192.168.56.4`

### Start Vagrant on host machine
`# vagrant up`

# Manual install

Couchdb
==
- Launch ansible playbook manually from local machine to install couchdb. ansible should be installed on local machine
<br>`$ ansible-playbook -i provisionning/inventories/local provisionning/setup.yml`

- Couchdb config file modification
<br>`$ sudo vi /opt/couchdb/etc/default.ini`

- Let couchdb listen to other IP adresse 
<br>[http://docs.couchdb.org/en/stable/config/http.html](http://docs.couchdb.org/en/stable/config/http.html) : <br/>`default.ini:`<br>
&nbsp;&nbsp;&nbsp;`bind_address = 0.0.0.0`</code>

- Enable CORS 
<br>[http://docs.couchdb.org/en/1.3.0/cors.html](http://docs.couchdb.org/en/1.3.0/cors.html) : <br/>`default.ini:`<br>
&nbsp;&nbsp;&nbsp;`enable_cors = true`<br>
&nbsp;&nbsp;&nbsp;`[cors]`<br>
&nbsp;&nbsp;&nbsp;`credentials = false`<br>
&nbsp;&nbsp;&nbsp;`origins = *`<br>

### Couchdb commands 
- `$ sudo systemctl start couchdb`
- `$ sudo systemctl enable couchdb`
- `$ systemctl status couchdb`

### Couchdb check port usage 
- `$ netstat -ln | grep 5984`

Couchapp
==

### Install couchapp on host machine
`# sudo pip install couchapp`

### Install Argos

- On host machine, create a database named **argos** at <br> [http://127.0.0.1:5984/_utils](http://127.0.0.1:5984/_utils)

- Clone Argos repo and push couchapp model to Couchdb
<br>`# git clone https://github.com/Hypertopic/Argos.git`
<br>`# cd Argos`
<br>`# couchapp init`
<br>`# couchapp push http://127.0.0.1:5984/argos`

### Load data
<br>`# curl -d @data/HMB_01.json -H "Content-type: application/json" -X POST http://127.0.0.1:5984/argos/_bulk_docs`

# Access url from host machine
[http://192.168.56.4:5984/_utils/](http://192.168.56.4:5984/_utils/)