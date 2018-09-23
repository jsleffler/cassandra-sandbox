# Cassandra Sandbox
This repo is an exploration of Cassandra, using docker to maintain one or more Cassandra instances. NodeJS apps will be used to load data and work with the tables. The plan is to build simply, load in test data and then use Cassandra and other tooling to perform analytics on this data. May also use DataStax tooling in the form of OpsCentre to investigate what is going on with the cluster(s).

# Quick Start

```sh
# Install dependencies using
> yarn install

# Trigger everything in watch mode for development purposes
> yarn start:dev
```

# Cassandra Learning Points

* Column Store
  * Cassandra is a column store, allowing two main concepts, `static` and `dynamic` columns
  * These column act as data points within a *"row"*, such that you can have `user.name` as you JSON type object and user is the row extracted and name is the column
  * Static setup means all rows have all the same columns, but they do not have to be filled, e.g. `null` and `undefined` are valid
  * Dynamic allows each row to have any number of different columns
* Keyspace
  * Similar to the concept of a schema
  * A keyspace is generally associated with an application
  * Keyspaces are created in the Cassandra command line tooling, may not be advisable to do this via an application, security reason
  * *"Tables"* are created within the keyspace, these are referred to as `Column Families`
* Column Families
  * Effectively the same as tables in RDBS
* Compound Keys
  * > A compound primary ey includes the partition key, which determines on which node data is stored, and one or more additional columns that **determine clustering**.  [1]
  * > You need to know which fields you want to be able to sort and order by before you create the data model. [1]
* Collections
  * Arrays and objects in a single column


# References
* Training Course on Cassandra from Scratch, available from [Eduonix][1]


[1]: https://www.eduonix.com/dashboard/Learn-Apache-Cassandra-from-Scratch/