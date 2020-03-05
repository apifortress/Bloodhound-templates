# AFtheM - Tunnelling

This is an unusual application of AFtheM. The idea is to create a tunnel between two AFtheM instances, using [HazelCast](https://hazelcast.org/).
The *afthem-server* will await for an *afthem-client* to permanently connect to it. HTTP requests will be performed to the server which, instead
of executing them, it will foward them to the *afthem-client*. The *afthem-client* will actually execute the HTTP request and send the response
back to *afthem-server*.

By executing this paradigm, a user capable of performing HTTP requests to an *afthem-server* will be able to access the infrastructure where
*afthem-client* is deployed, regardless of any inbound firewall rules the environment may have, assuming no strict outbound rules are applied.

## Usage

1. Run AFtheM server by issuing `sudo docker-compose up -d afthem-server`

2. Run AFtheM client by issuing `sudo docker-compose up -d afthem-client`

## Tweaking

Ideally, to better understand the mechanism, the server should run in an HTTP-accessible location, while the client should be in an environment
that allows outbound connections, but not inbound.
To update the configuration, proceed as follows:

1. Update the server `docker-compose.yml` and expose the following port:
   - 5701:5701/tcp

2. Update the client `etc/implementers.yml` and change the `ingresses.config.server` address to match the server's address

3. Call an API call `curl 127.0.0.1:8080/get`

4. Notice how the request bounced through the client by issuing `sudo docker-compose logs`

## Important

This is just an example and it's **not secured** as we decided to keep the configuration as minimal as possible. This mode may expose sensitive
information. We advise you to read the [Official module documentation](https://github.com/apifortress/afthem-modules/blob/master/hazelcast/README.md) and the [HazelCast XML configuration guide](https://docs.hazelcast.org/docs/3.0/manual/html/ch12.html).
