# Inspirer App

[![Build Status](https://travis-ci.org/gruz0/inspirer-web.svg?branch=master)](https://travis-ci.org/gruz0/inspirer-web)
[![Security](https://hakiri.io/github/gruz0/inspirer-web/master.svg)](https://hakiri.io/github/gruz0/inspirer-web/master)

Habbits tracker for you

| Screenshots |
| --- |
| ![Dashboard](https://user-images.githubusercontent.com/335095/67886375-687a8880-fb5a-11e9-8bfb-101ba4d6daf8.png) |
| ![Add Sleep](https://user-images.githubusercontent.com/335095/67886376-687a8880-fb5a-11e9-98dd-71db9f68ec2f.png) |
| ![Health](https://user-images.githubusercontent.com/335095/67886377-687a8880-fb5a-11e9-9390-e44197ec65b7.png) |
| ![Activity](https://user-images.githubusercontent.com/335095/67886378-69131f00-fb5a-11e9-8ddd-7a21796a7364.png) |
| ![Learning](https://user-images.githubusercontent.com/335095/67886379-69131f00-fb5a-11e9-9c4a-b1eba543e192.png) |
| ![New Article](https://user-images.githubusercontent.com/335095/67886380-69131f00-fb5a-11e9-8ad7-cf93e79a9d92.png) |

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

## How to install linters

Linters used by git pre-commit hook to check project's files.

It runs every time when you try to commit your changes into repository.

```bash
make install_linters
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
