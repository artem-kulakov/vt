# frozen_string_literal: true

source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '6.0.2.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '5.0.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'bootstrap-sass'
gem 'devise'
gem 'sdoc', group: :doc
# gem 'awesomplete'
gem 'best_in_place'
gem 'bootsnap', require: false
gem 'cancancan'
gem 'chartkick'
gem 'cocoon'
gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
gem 'fullcalendar-rails'
gem 'geocoder'
gem 'groupdate'
gem 'highcharts-rails'
gem 'kaminari'
gem 'momentjs-rails'
gem 'prawn-table'
gem 'prawnto_2', require: 'prawnto'
gem 'rails-timeago'
gem 'rails_12factor', group: :production
gem 'ransack'
gem 'rubocop-rails', require: false
gem 'underscore-rails'
gem 'webpacker'
gem 'will_paginate'
gem 'will_paginate-bootstrap4'

# Wicked PDF
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :staging, :production do
  gem 'wkhtmltopdf-heroku'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'

  gem 'listen'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
