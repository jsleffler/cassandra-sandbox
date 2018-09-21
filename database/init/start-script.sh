# Script to loop through cql files to init the database

for f in docker-entrypoint-initdb.d/*; do
  case "$f" in
    *.sh)     echo "$0: running $f"; . "$f" ;;
    *.cql)    echo "$0: running $f" && until cqlsh -f "$f"; do >&2 echo "Cassandra is unavailable - sleeping"; sleep 2; done & ;;
    *)        echo "$0: ignoring $f" ;;
  esac
  echo
done

# https://stackoverflow.com/questions/32254497/create-keyspace-automatically-inside-docker-container-with-cassandra

# https://docs.datastax.com/en/cql/3.1/cql/cql_reference/list_permissions_r.html
# https://docs.datastax.com/en/cql/3.1/cql/cql_reference/create_user_r.html