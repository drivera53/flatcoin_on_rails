# Flatcoin on rails!
Welcome to FlatCoin on Rails! This App was develop as a Flatiron School Rails project. I developed this app to help users practice building cryptocurrency portfolios and react to the markets in real time safely using fake money.

# Installation
Fork this repository and Install all of the required gems: (If you run into issues try deleting `Gemfile.lock` and then `bundle install` again.)
```ruby
bundle install
```
Migration:
My current database holds ten accounts with trades, if you want to practice with them run:
```ruby
rails db:migrate
``` 
and then `rails s` to start the server, FlatCoin app will be running on `http://127.0.0.1:3000` as default. 
```ruby
rails s
```
If you want to start with a fresh new database you may delete `development.sqlite` and `schema.rb`; then run:
```ruby
rails db:migrate
```
You may also use my `seeds.rb` or make your own.
```ruby
rake db:seed
```

# Setting up the GitHub authentication:
- Visit https://github.com/settings/developers
- Click "New OAuth App"
- Give it a name, Homepage URL: http://127.0.0.1:3000 (Or any other path that Rails is listening on), Description, Authorization call back URL: http://127.0.0.1:3000/auth/github/callback
- Click "Register application"
- Create a `.env` file in main directory and add your GitHub keys.
```ruby
GITHUB_KEY=33...
GITHUB_SECRET=519... 
```
- Save `.env` and users will be able to sign up with GitHub.
- If you run into issues, check the following documentation [OmniAuth: Standardized Multi-Provider Authentication](https://github.com/omniauth/omniauth#integrating-omniauth-into-your-application)

# Usage
After you run `rails s` FlatCoin app will be running on `http://127.0.0.1:3000`. Here you may signup or login using credencials from `seeds.rb`. The main page displays a list of the top 20 cryptocurrencies by market cap and you can start creating porfolios and trading right away. Keep in mind that you should have enough Buying Power in order to execute an order. Each porfolio displays a list of all your trades along with your portfolio value, here you can also sell your trade, users are able to leave comments as well. 
Happy trading!  

## License
[MIT](https://github.com/drivera53/flatcoin_on_rails/blob/main/LICENSE)