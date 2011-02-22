class RegistrationStep2Command < BaseCommand 
  #attr_accessor :user_name
  #attr_accessor :given_names
  #attr_accessor :family_name
  #attr_accessor :password
  #attr_accessor :password_confirmation

  column :user_name, :string
  column :given_names, :string
  column :family_name, :string 
  column :password, :string 
  column :password_confirmation, :string 


  validates_presence_of :user_name, :password, :family_name, :message => 'must be provided'
  validates_length_of  :user_name, :within => 6..20, :allow_blank => true
  validates_length_of  :given_names, :family_name, :maximum  => 32
  validates_length_of  :password, :password_confirmation, :within => 6..16, :allow_blank => true
  validates_confirmation_of :password,  :if => Proc.new { |cmd| !cmd.password.blank? } 

   
 # def initialize(attrs=Hash.new)
 #   super() 
 #   @user_name = attrs[:user_name]
 #   @password = attrs[:password]
 #   @given_names = attrs[:given_names]
 #3   @family_name = attrs[:family_name]
 #   @password_confirmation = attrs[:password_confirmation]
 # end
end
