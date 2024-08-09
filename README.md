# Thin Man Reviews

This is my site for reviews on all things cultural. 

## Getting started

To get started with the app, clone the repo and then install the needed gems:
```
$ gem install bundler
$ bundle config set --local without 'production'
$ bundle install
```

Next, migrate the database:
```
$ rails db:migrate
```

This app uses Dart Sass, installed as a Ruby Gem (see [documentation](https://github.com/rails/dartsass-rails)). While developing this application, it is necessary to run Dart Sass in watch mode, so changes are automatically reflected in the generated CSS output. Do this by running `rails dartsass:watch` as a separate process.

Finally, run the test suite to verify that everything is working correctly:
```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:
```
$ rails server
```
