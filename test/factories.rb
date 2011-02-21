Factory.define :content_item do |f|
   f.name 'Test Item #{n}' 
   f.content 'An automatically generated Content Item for testing'  
 #  f.after_create do |item|
 #     f.tags.each 
 #     item.tags << Tag.first #
#
 #  end item.tags << Tag.first } 

end  

Factory.sequence :email do |n| 
   "jsmith#{n}@yahoo.com"
end

Factory.define :user do |f|
   f.email Factory.next(:email)   
   f.given_names 'John'
   f.family_name 'Smith' 
   f.password_hash 'password'
end  

Factory.sequence :account do |n|
  "account#{n}"
end

Factory.define :account do |f|
   f.name Factory.next(:account)
end  


Factory.define :registration_step2_command do |f|
   f.user_name Factory.next(:email)   
   f.password 'password'
   f.password_confirmation 'password'
end  

