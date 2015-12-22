# Sinatra Active Record Starter Kit

This template provides a basic [Sinatra](http://www.sinatrarb.com/) application
that includes:

- [Active Record](http://guides.rubyonrails.org/active_record_querying.html)
using [sinatra-activerecord](https://github.com/janko-m/sinatra-activerecord)
- [PostgreSQL](http://www.postgresql.org/) for a database
- [Sinatra::Reloader](http://www.sinatrarb.com/contrib/reloader.html) to
  automatically reload modified files during development
- [RSpec](https://github.com/rspec/rspec) for unit testing
- [Capybara](https://github.com/jnicklas/capybara) for acceptance testing
- [Pry](https://github.com/pry/pry) for debugging
- [Foundation 6](http://foundation.zurb.com/sites.html) with flex grid for styling
- [lodash v3.10.1](https://lodash.com/) for easier javascripting.

### Setting Up the Database

If you look in `config/database.yml` you can find the details of how to connect to your PostgreSQL database. In `db/migrate` you'll see that there is a migration that has already been written to create the `users` table.

Run the following commands to create and migrate your database:

```no-highlight
# Install all the dependencies for the app
$ bundle install

# Create the database
$ rake db:create

# Run all the migrations to get our schema up to date
$ rake db:migrate
```

### User Authentication

The authentication system has already been implemented using the OAuth standard with GitHub's authentication service. You'll need to register your development app with GitHub and provide your own application keys using the following instructions:

1. Go to your [application settings page][github-app-settings] on GitHub and register a new application (the name of the application doesn't matter).
2. Set your "Homepage URL" to `http://localhost:4567/`.
3. Set your "Authorization Callback URL" to `http://localhost:4567/auth/github/callback`.
4. Register your application.
5. Create a `.env` file in your project's root directory (same folder where `app.rb` is located).
6. Place all of your API keys in the `.env` file. The file's contents should look like this:

```no-highlight
SESSION_SECRET="replace_this_string_with_a_secret_of_your_choosing"
GITHUB_CLIENT_ID="replace_this_string_with_your_client_id_from_github"
GITHUB_CLIENT_SECRET="replace_this_string_with_your_client_secret_from_github"
```

At this point, run your test suite by running `rake`. The tests that have been provided for you should be passing. Also, you should start your server and open the application in your browser.


## Configuring Your Database

This template is set up for using a PostgreSQL database. You will need to edit the
`config/database.yml`.

You can create your database with
`rake db:create`.

## Rake Tasks

This template uses the [sinatra-activerecord](https://github.com/janko-m/sinatra-activerecord)
gem, which provides the following rails-like rake tasks:

```no-highlight
rake db:create            # create the database from config/database.yml from the current Sinatra env
rake db:create_migration  # create an ActiveRecord migration
rake db:drop              # drops the data from config/database.yml from the current Sinatra env
rake db:migrate           # migrate the database (use version with VERSION=n)
rake db:rollback          # roll back the migration (use steps with STEP=n)
rake db:schema:dump       # dump schema into file
rake db:schema:load       # load schema into database
rake db:seed              # load the seed data from db/seeds.rb
rake db:setup             # create the database and load the schema
rake db:test:prepare      # Prepare test database from development schema
```
