class RegistrationStep2Command < BasePoro
  attr_accessor :user_name
  attr_accessor :given_names
  attr_accessor :family_name
  attr_accessor :password
  attr_accessor :password_confirmation

  validates_presence_of :user_name, :password, :family_name, :message => 'must be provided'
  validates_confirmation_of :password,  :if => Proc.new { |cmd| !cmd.password.blank? } 

   
  def initialize(attrs=Hash.new)
    super() 
    @user_name = attrs[:user_name]
    @password = attrs[:password]
    @given_names = attrs[:given_names]
    @family_name = attrs[:family_name]
    @password_confirmation = attrs[:password_confirmation]
  end
end
