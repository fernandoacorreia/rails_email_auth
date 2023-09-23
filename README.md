# Rails email authentication

Example of passwordless, email-based authentication with Ruby on Rails.

Based on [Building passwordless email auth in Rails](https://blog.testdouble.com/posts/2022-10-25-building-passwordless-email-auth-in-rails/).

## Requirements

Setup development environment: see [fernandoacorreia/macos-rails-setup](https://github.com/fernandoacorreia/macos-rails-setup)

This will set up PostgreSQL. Start it with:

```
brew services start postgresql@16
```

## Development setup

Create database:

```
bin/rails db:create
```

Start development server:

```
bin/rails server
```