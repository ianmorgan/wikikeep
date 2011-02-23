#require "#{Rails.root}/app/services/parsing_service.rb"

class RegistrationService

   #
   # Registration of a new member using data captured by the registration wizard
   # in the registration_stepX_commands.
   #
   # A check is made to see if the member name is unique.
   # 
   def create_account (attrs)
     account = Account.new do |a| 
       a.name = attrs[:account_name]
     end 
     user = User.new do |u|
       u.user_name = attrs[:user_name]
       u.password_hash = attrs[:password]
       u.given_names = attrs[:given_names]
       u.family_name = attrs[:family_name]
     end
     account.users << user
 
     result = account.save
     return result 
   end

end
