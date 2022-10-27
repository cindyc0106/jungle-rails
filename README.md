# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.
Users are able to Sign Up/Log In (not required), shop for products, and place orders. There is an Admin Dashboard(authentication) that Admin Users can add/delete products and categories.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Screenshots

!["Home Page"](https://github.com/cindyc0106/jungle-rails/blob/master/docs/home.png?raw=true)
!["Product Details Page"](https://github.com/cindyc0106/jungle-rails/blob/master/docs/product%20details.png?raw=true)
!["Payment in Cart"](https://github.com/cindyc0106/jungle-rails/blob/master/docs/payment.png?raw=true)
!["After Order Page"](https://github.com/cindyc0106/jungle-rails/blob/master/docs/order%20received.png?raw=true)

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.


## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
