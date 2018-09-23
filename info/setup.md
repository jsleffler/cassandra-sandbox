# Setup & Development Tooling

## Installing

```sh
# Install dependencies using
> yarn install

# Trigger everything in watch mode for development purposes
> yarn start:dev

# Start Unit test watching in another terminal window
> yarn test:watch
# Now on a change of a JavaScript file or a test file the tests will run

# Start the development database (see below for more info)
> yarn db:start
```

## Development
To start developing locally the single command `yarn start` will work. For this application there is no server so, unit tests are the primary form of validating the code. This command will start watch tasks on lint, docs and unit tests all in the one terminal window. Also, the database is checked if it running.

You can then use the command `yarn dev:open` to open the web pages for test coverage and documentation are opened. This command uses `open` that may not be available on your system.

## Testing & Linting

Unit tests are present and can be run using the below commands
```sh
# Just run the tests
> yarn test
# Run tests and watch for changes and rerun
> yarn test:watch
# Run the tests and publish coverage report
> yarn test:coverage
```

Linting is configure to provide the first layer of security and consistent coding
```sh
# Just run the lint
> yarn lint
# Run in another terminal and watch for file changes
> yarn lint:watch
# Run check and fix any issues
> yarn lint:fix
```

Prettier is also installed to format code to a consistent style
```sh
# Check for formatting and replace
> yarn pretty
```

Plato is also installed to check of maintainability standards in the code
```sh
# run Plato and get report in ./plato/index.html
> yarn plato
```

## Documentation

This application is using [documentation.js](http://documentation.js.org/) to power its docs. DocumentationJS does use the common `JSDoc` style which you may be able to get helpers for within your IDE. In some cases if you type `/**` and press `enter` above a `function` the documentation comment is automatically generated. If not, linting is available to help get the commenting correct.

The following commands are available:
```sh
# Generate html docs into docs/ folder
> yarn docs
# Lint documentation comments
> yarn docs:lint
# Generate markdown based docs to docs.md file
> yarn docs:md
# Run a server for docs to auto rebuild on changes, server runs at localhost:4001
> yarn docs:watch
```

# Database
Cassandra is used as the primary database in this sandbox. The Cassandra database should be installed and run independently of this application, but for development purposes a DB has been added and will be run inside a Docker container. Ensure you have docker installed and running, if you do not have it go [here](https://www.docker.com/get:started).

For development the container is available on `localhost:9160`.

```sh
# To start the docker container run
> yarn db:start

# To stop the docker container run
> yarn db:stop

# If you need to restart the db for whatever reason, use
> yarn db:restart
```

Links:
* [Cassandra Home](https://cassandra.apache.org/)
* [Cassandra-driver](https://github.com/datastax/nodejs-driver)
* [Driver API Docs](https://docs.datastax.com/en/developer/nodejs-driver/3.5/)
* [CQL Reference](https://docs.datastax.com/en/cql/3.1/cql/cql_reference/cqlReferenceTOC.html)