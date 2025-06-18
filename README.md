## Gem Description:
currencyapi-ruby is a simple Ruby wrapper for the CurrencyAPI, providing easy access to real-time and historical foreign exchange rates. It allows developers to integrate currency conversion and exchange rate data into Ruby applications with minimal setup.

## Features:
- Fetch real-time currency exchange rates

- Retrieve historical rates by date

- Support for multiple base currencies

- Lightweight and easy to use

- Built-in error handling for API responses

## Example Usage:
```ruby
  require 'currencyapi'

  client = CurrencyAPI::Client.new(api_key: 'YOUR_API_KEY')
```
## Get latest exchange rates
```ruby
  response = client.latest(base_currency: 'USD')

  puts response

  client = CurrencyAPI::Client.new(api_key: 'YOUR_API_KEY')
```

## Get latest exchange rates
```ruby
response = client.latest(base_currency: 'USD')

puts response
```
## Installation:
Add this line to your Gemfile:
```ruby
gem 'currencyapi-ruby'
```
Then run:
```ruby
bundle install
```
Or install it directly:

```ruby
gem install currencyapi-ruby
```

## Links:
  - CurrencyAPI Docs - https://currencyapi.com/docs

  - Gem Source (replace with your repo link)