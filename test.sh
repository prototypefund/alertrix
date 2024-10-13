sudo docker compose -f compose-test.yml build &&
sudo docker compose -f compose-develop.yml down --volumes --remove-orphans &&
sudo docker compose -f compose-test.yml down --volumes --remove-orphans &&
rm -f data/test/synapse/homeserver.db &&
sudo docker compose -f compose-test.yml up -d &&
sudo docker compose -f compose-test.yml logs -f alertrix &&
sudo docker compose -f compose-test.yml down --volumes --remove-orphans &&
rm data/test/synapse/homeserver.db &&
sudo docker compose -f compose-test.yml down &&
echo \a
