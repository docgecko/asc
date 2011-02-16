# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system./}.each(&:drop)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'docgecko', :email => 'daren.sdw@gmail.com', :password => 'Ma1andra', :password_confirmation => 'Ma1andra'
puts 'New user created: ' << user.name