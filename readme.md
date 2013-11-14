# Shipyard PostgreSQL

This provides PostgreSQL for production deployment.

* `docker build -t shipyard-db .`
* `docker run shipyard-db`

Ports

* 5432

Environment Variables

* `DB_USER`: Database user (default: shipyard)
* `DB_PASS`: Database pass (default: <randomly generated>)
* `DB_NAME`: Database name (default: shipyard)
