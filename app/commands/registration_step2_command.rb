class RegistrationStep2Command < BasePoro
  attr_accessor :user_name
  attr_accessor :password
  attr_accessor :password_confirmation

  validates_presence_of :user_name, :password, :message => 'must be provided'
  validates_confirmation_of :password,  :message => "should match confirmation"

   
  def initialize(attrs=Hash.new)
    super() 
    @user_name = attrs[:user_name]
    @password = attrs[:password]
    @password_confirmation = attrs[:password_confirmation]
  end
end
