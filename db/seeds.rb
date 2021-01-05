# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
role_list = ["Admin","Buyer","Broker"]
role_list.each do |role_name|
    Role.create(role_name: role_name)
    
end


admin_user = User.new({ name: "Admin User", email: 'admin@rubyonrails.com',
    password: 'password123', password_confirmation: 'password123', role_id: 1})

    if admin_user.valid?
        admin_user.save()
  
      elsif admin_user.errors.any?
        admin_user.errors.full_messages.each do |msg|
          puts msg
        end
      else
        puts "****NOT VALID****"
      end


      