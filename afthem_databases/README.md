# Bloodhound Database examples

Extended example setup demonstrating how to use databases as upstreams for Bloodhound.

Launch the full package by issuing `docker-compose up`

## Databases

The setup installs 3 different databases using Docker, to simplify the understanding and evaluation of the upstreams.

1. MariaDB (jdbc)
2. PostgreSQL (jdbc)
3. MongoDB (specific driver)

## Admin Tools

The docker-compose also deploys 2 administration tools, one for JDBC databases and one for MongoDB.

### Adminer

For PostgreSQL and MariaDB. Point your browser to `http://localhost:8081`

Sample configurations:

```text
host: mariadb
username: apipulse
password: jk5112
database: apipulse
```

```text
host: postgres
username: apipulse
password: jk5112
database: apipulse
```

### MongoClient

Point your browser to `http://localhost:8082`

Sample configuration:

```text
connection url: mongodb://mongo:27017/apipulse
```

## Test Data

Test data can be found in the `test_data` directory and can be imported with the mentionted admin panels.

### Adminer

For MariaDB and PostgreSQL, access the "import" screen, and choose the mariadb.sql and posgresql.sql file respectively.
**Note**: the Postgres import process shoots an error, but it has no effect.

### MongoClient

For MongoDB, right click on "collections", add a new collection named "test". Select the newly created collection.
In the main area of the screen, switch operation from "find" to "insertMany". Open mongodb.json in a text editor, copy the content and
paste it into the "docs" text area. Click execute.

## Querying with Bloodhound

### Sample query for the PostgreSQL flow

```text
curl -H 'content-type:text/plain' -d 'select * from orders' localhost:8080/postgres
```

### Sample query for the MariaDB flow

```text
curl -H 'content-type:text/plain' -d 'select * from people' localhost:8080/mariadb
```

### Sample query for the MongoDB flow

```text
curl -H 'content-type:application/json' -d '{}' localhost:8080/mongodb
curl -H 'content-type:application/json' -H 'x-op:insert' -d '{"foo":"bar"}' localhost:8080/mongodb
```

## Further reading

* Read more on [the configuration options for the JDBC module](https://github.com/apifortress/afthem-modules/tree/master/jdbc).
* Read more on [the configuration options for the MongoDB module](https://github.com/apifortress/afthem-modules/tree/master/mongodb).