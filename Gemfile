source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.5'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # デバッグ
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  gem 'rspec-rails'
  # テストデータの作成をサポートする
  gem "factory_bot_rails"
  # テスト用のダミーデータを用意する
  gem 'faker'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'jquery-rails'

# ユーザ認証機能
gem 'devise'

# ファイルをアップロードできるようにする
gem 'refile', require: 'refile/rails', github: 'manfe/refile'
# アップロードした画像のリサイズを行える
gem 'refile-mini_magick'

# Bootstrap
# BootstrapはjQueryに依存している
gem 'bootstrap', '~> 4.5'
# fontawesome
gem 'font-awesome-sass', '~> 5.13'

# ページング機能
gem 'kaminari','~> 1.2.1'

# 住所←→座標（緯度、経度）変換
gem 'geocoder'

# 検索、ソート機能（投稿日時）
gem 'ransack'

gem "enum_help"

# 日本語化
gem 'rails-i18n'
gem 'devise-i18n'

# 静的コード解析ツール
gem 'rubocop', require:false
gem 'rubocop-rails', require:false
gem 'rubocop-performance', require:false

# 環境変数を管理する
# プロジェクトごとにファイルベースで環境変数を管理することができる
gem 'dotenv-rails'
group :production do
  # MySQLを利用するために必要
  gem 'mysql2'
end