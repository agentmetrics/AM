#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

#Amtest::Application.load_tasks

require 'sprockets'
require 'compass'
require 'sprockets-sass'
require 'bootstrap-sass'
require 'handlebars_assets'
require 'coffee-script'

Bundler.require

task :compile do

	project_root = File.expand_path(File.dirname(__FILE__))

	environment = Sprockets::Environment.new(project_root)
	environment.append_path 'app/assets/javascripts'
	environment.append_path 'lib/assets/javascripts'
	environment.append_path 'vendor/assets/javascripts'
	environment.append_path 'app/assets/stylesheets'
	environment.append_path 'lib/assets/stylesheets'
	environment.append_path 'vendor/assets/stylesheets'

	target_javascript = 'public/javascripts/application.js'
	target_css = 'public/stylesheets/application.css'
  	environment['application.js'].write_to target_javascript
  	environment['application.css'].write_to target_css
end
 
task :default => [:compile]


# task :turn_off_alarm do
#   puts "Turned off alarm. Would have liked 5 more minutes, though."
# end
 
# task :groom_myself do
#   puts "Brushed teeth."
#   puts "Showered."
#   puts "Shaved."
# end
 
#  desc "Make coffee"
#  task :make_coffee do
#   cups = ENV["COFFEE_CUPS"] || 2
#   puts "Made #{cups} cups of coffee. Shakes are gone."
# end
 
# task :walk_dog do
#   puts "Dog walked."
# end
 
# task :ready_for_the_day => [:turn_off_alarm, :groom_myself, :make_coffee, :walk_dog] do
#   puts "Ready for the day!"
# end

#  task :default => [:ready_for_the_day]

