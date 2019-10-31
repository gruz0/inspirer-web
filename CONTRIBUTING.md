Inspirer is an open source project and we would love you to help us make it better.

## Reporting Issues

A well formatted issue is appreciated, and goes a long way in helping us help you.

* Make sure you have a [GitHub account](https://github.com/signup/free)
* Submit a [Github issue](https://github.com/gruz0/inspirer-web/issues/new/choose) by:
  * Clearly describing the issue
    * Provide a descriptive summary
    * Explain the expected behavior
    * Explain the actual behavior
    * Provide steps to reproduce the actual behavior
    * Put application stacktrace as text (in a [Gist](https://gist.github.com) for bonus points)
    * Any relevant stack traces

If you provide code, make sure it is formatted with the triple backticks (\`\`\`).

At this point, we'd love to tell you how long it will take for us to respond,
but we just don't know.

## Pull requests

We accept pull requests to Inspirer for:

* Fixing bugs
* Adding new features

Not all features proposed will be added but we are open to having a conversation
about a feature you are championing.

Here's a quick guide:

1. Fork the repo.
2. Run the tests. See [How to run tests](#how-to-run-tests) section below.
3. Create a new branch and make your changes. This includes tests for features!
4. Push to your fork and submit a pull request. For more information, see
[Github's pull request help section](https://help.github.com/articles/using-pull-requests/).
5. Make sure you do not delete the existing tests.

At this point you're waiting on us. Expect a conversation regarding your pull
request, questions, clarifications, and so on.

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

## How to run project in Docker

Simply run in the terminal in the project's directory:

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

## Troubleshooting
