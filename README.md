# Inspirer App

Habbits tracker for you

## System dependencies

* Docker
* docker-compose

Docker exposes these ports on localhost:

* 3000 for the web
* 5432 for PostgreSQL
* 6379 for Redis

## Configuration

```bash
cp .env.sample .env
```

## How to run project

Simply run in the terminal:

```bash
make dockerize
```

## Database creation

Open Docker shell in your terminal:

```bash
make shell
```

Then execute:

```bash
rake db:create db:migrate db:seed
```

If you want to drop database, use:

```bash
rake db:drop
```

## How to login as administator

Open [http://localhost:3000](http://localhost:3000) in your browser.

Use credentials from `db/seeds.rake` file.

* Email: `robot@inspirer.app`
* Password: `8DC!Wtf#Wdt`

## How to run the test suite

Simply run in the terminal:

```bash
make test
```
