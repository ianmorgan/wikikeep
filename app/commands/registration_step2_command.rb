class RegistrationStep2Command < BaseCommand 

  column :user_name, :string
  column :given_names, :string
  column :family_name, :string 
  column :password, :string 
  column :password_confirmation, :string 


  validates_presence_of :user_name, :password, :family_name, :message => 'must be provided'
  validates_length_of  :user_name, :within => 6..40, :allow_blank => true
  validate :user_name_cannot_be_in_use
  validates_length_of  :given_names, :family_name, :maximum  => 32
  validates_length_of  :password, :password_confirmation, :within => 6..16, :allow_blank => true
  validates_confirmation_of :password,  :if => Proc.new { |cmd| !cmd.password.blank? } 
  

  def user_name_cannot_be_in_use
    if User.find_by_user_name(user_name)
      errors.add(:user_name, "Sorry, this user has already registered")
    end
  end

   
end
