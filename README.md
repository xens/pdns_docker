### Installation

change the Mysql + API passwords then #sudo docker-compose up

### Usage

some basic usage of the API, for more info see: https://doc.powerdns.com/md/httpapi/README/

#### Create a new zones
`curl -X POST --data '{"name":"freeture.ch.", "kind": "Native", "masters": [], "nameservers": ["ns.freeture.ch.", "n2.freeture.ch."]}' -v -H 'X-API-Key: changeme' 127.0.0.1:8080/api/v1/servers/localhost/zones`


#### Show zones
`curl -H 'X-API-Key: changeme' http://127.0.0.1:8080/api/v1/servers/localhost/zones | jq .`

#### Create new A record
`curl -X PATCH --data '{"rrsets": [ {"name": "www.freeture.ch.", "type": "A", "ttl": 86400, "changetype": "REPLACE", "records": [ {"content": "192.0.5.4", "disabled": false } ] } ] }' -H 'X-API-Key: changeme' http://127.0.0.1:8080/api/v1/servers/localhost/zones/example.org. | jq .`
