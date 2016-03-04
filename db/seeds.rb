# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

usernames = ["sk8rboi", "tinydancer", "kangaroozr2kool", "ficklepeaches", "brokenlaugh", "spacemanspiff", "hobbesisbest", "chrysanthemum", "joanna", "quill"]

10.times do |x|
	User.create(username: usernames[x], email:"#{x}@user.com", password: "password", password_confirmation:"password")
end
p "test users created"