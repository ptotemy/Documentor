# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


TestType.create!(:name=>"Docket")
TestType.create!(:name=>"Document")

User.create!(:email=>"admin@documentor.com", :password=>"documentor", :password_confirmation=>"documentor", :admin=>true, :documentor=>false)
User.create!(:email=>"documentor@documentor.com", :password=>"documentor", :password_confirmation=>"documentor", :admin=>false, :documentor=>true)

