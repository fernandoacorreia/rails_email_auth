# Rails email authentication

Example of passwordless, email-based authentication with Ruby on Rails.

Based on [Building passwordless email auth in Rails](https://blog.testdouble.com/posts/2022-10-25-building-passwordless-email-auth-in-rails/).

See example app at [testdouble/magic_email_demo](https://github.com/testdouble/magic_email_demo).

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

## Additional references

- [The God Login](https://blog.codinghorror.com/the-god-login/)
- [ryanb/letter_opener](https://github.com/ryanb/letter_opener)

## Extending

- Validate email addresses. Sanitize them to prevent HTML/XSS attacks.
- Store emails stripped or whitespace and converted to lower case since on most email services case is not significant.
- Hold unknown email addresses in a separate magic links table and only register a new user when the user clicks on the link.
- Better handling of failure to create new user record.
- Change EmailAuth functions to static (class) methods.
- For security reasons, make sure that tokens are unique (by storing them in a magic links table and not on the users table). This way there's no chance of 2 users having the same token, and a given token matching to the wrong user.
