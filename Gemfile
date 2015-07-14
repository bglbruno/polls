source 'https://rubygems.org'

ruby "2.2.2"

gem 'rails', '4.2.0'
gem 'sqlite3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'
gem 'turbolinks'

gem "slim"
gem "slim-rails"
gem 'responders', '~> 2.0'
gem 'kaminari'
source 'https://rails-assets.org' do
  gem 'rails-assets-material-design-lite'
  gem 'rails-assets-jquery.easy-pie-chart'
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

gem "foreman"
group :production, :staging do
  gem "rails_12factor"
  gem "rails_stdout_logging"
  gem "rails_serve_static_assets"
end
