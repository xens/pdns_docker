### Installation

change the Mysql + API passwords then #sudo docker-compose up

### Usage

some basic usage of the API, for more info see: https://doc.powerdns.com/md/httpapi/README/

#### Create a new zone
`curl -X POST --data '{"name":"example.com.", "kind": "Native", "masters": [], "nameservers": ["ns1.example.com.", "n2.example.com."]}' -v -H 'X-API-Key: changeme' 127.0.0.1:8080/api/v1/servers/localhost/zones`


#### Show zones
`curl -H 'X-API-Key: changeme' http://127.0.0.1:8080/api/v1/servers/localhost/zones | jq .`

#### Create new A record
`curl -X PATCH --data '{"rrsets": [ {"name": "www.example.com.", "type": "A", "ttl": 86400, "changetype": "REPLACE", "records": [ {"content": "192.0.5.4", "disabled": false } ] } ] }' -H 'X-API-Key: changeme' http://127.0.0.1:8080/api/v1/servers/localhost/zones/example.org. | jq .`
