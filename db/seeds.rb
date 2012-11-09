# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Create the default Admin user
AdminUser.create :email => 'admin@compassitesinc.com', :password => 'password', :password_confirmation => 'password'

# Create the default set of Categories
Category.create :name => 'Chemical Engineering', :badge_image => File.open("#{Dir.pwd}/db/icon_badge.gif")
Category.create :name => 'Mechanical Engineering', :badge_image => File.open("#{Dir.pwd}/db/icon_badge.gif")
Category.create :name => 'Civil Engineering', :badge_image => File.open("#{Dir.pwd}/db/icon_badge.gif")
Category.create :name => 'Automobile Engineering', :badge_image => File.open("#{Dir.pwd}/db/icon_badge.gif")
Category.create :name => 'Particle Physics', :badge_image => File.open("#{Dir.pwd}/db/icon_badge.gif")
Category.create :name => 'Nuclear Physics', :badge_image => File.open("#{Dir.pwd}/db/icon_badge.gif")
Category.create :name => 'Quantum Physics', :badge_image => File.open("#{Dir.pwd}/db/icon_badge.gif")
Category.create :name => 'Microbiology', :badge_image => File.open("#{Dir.pwd}/db/icon_badge.gif")