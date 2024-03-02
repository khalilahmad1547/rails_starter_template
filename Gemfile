# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'rails', '~> 7.1.3'

gem 'sprockets-rails'

gem 'pg', '~> 1.5'

gem 'puma', '>= 5.0'

gem 'figaro'

gem 'importmap-rails'

# dry-rb gems
gem 'dry-monads', '~> 1.6'
gem 'dry-validation', '~> 1.10'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'redis', '>= 4.0.1'
# gem "kredis"

gem 'bcrypt', '~> 3.1.7'
gem 'devise', '~> 4.9'

gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'bootsnap', require: false

# gem "image_processing", "~> 1.2"

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'solargraph', require: false
  gem 'web-console'
end
