# Bloodhound - Securing

In this example we show a complete example on how to add basic security to an API, by applying both an API key filtering system, and a basic authentication actor.

More information about the actors can be found in the [Advanced Actors documentation](https://github.com/apifortress/bloodhound/blob/master/doc/06_advanced_actors.md).

## Usage

1. Start Bloodhound by issuing `docker-compose up`

2. Execute the following request: `curl -H 'accept: application/json' http://afthem:12345@127.0.0.1:8080/relay?key=ABC123`

3. The output of the proxied API should appear on your screen

4. Change the API key or the credentials and notice the request does not go through

5. Check the files `etc/api_keys.yml` and `etc/htpasswd.txt` for keys and credentials

6. Check the logs in the `docker_log` directory

