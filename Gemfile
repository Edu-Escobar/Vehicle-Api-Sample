source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.8'

# Gem dependencies used in this project

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'

gem 'mysql2', '~> 0.5.3'

gem 'puma', '~> 5.0'

gem 'bootsnap', '>= 1.4.4', require: false

gem 'rack-cors', :require => 'rack/cors'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
	
	gem 'faker'		# Library that allows us to insert fake data to our database. 
					# Used to check scalability.
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
