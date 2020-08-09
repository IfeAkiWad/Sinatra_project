This is the Flatiron Sinatra project. My Sinatra project is a web app called, HaiRx. It is a database of three tables that controls a users subscriptions of hair products using Sinatra ActiveRecord CRUD. This web app requires a user to sign up and/or log in. The user has the liberty of searching and choosing a product through a list of products; the user will create a subscription, and edit/delete that subscription. Furthermore, the web app requires user validation before executing an action. This project is built using a full Sinatra MVC with separation of concerns, and single responsibility. There are three models (User, Product, Subscription) that have "has-many" (User and Product have many subscriptions), "belongs-to" (Subscription belongs to user and product), and "has-many through" (User has many products through subscriptions, and vice versa) relationships. 

The gems used to build this web app are as listed: gem 'sinatra', gem 'activerecord', '~> 4.2', '>= 4.2.6:
require => 'active_record', gem 'sinatra-activerecord', :require => 'sinatra/activerecord', gem 'rake', gem 'require_all', gem 'sqlite3', '~> 1.3.6', gem 'thin', gem 'shotgun', gem 'pry', gem 'bcrypt', gem 'tux', gem 'dotenv', gem 'rspec', gem 'capybara', gem 'rack-test', gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
The gems are installed by running bundle install in the terminal.
To have access to the web app via the server, run shotgun into the terminal.


