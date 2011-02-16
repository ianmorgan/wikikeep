class RegistrationStep2Command < BasePoro
  attr_accessor :user_name
  attr_accessor :password
  attr_accessor :password_confirmation

  validates_presence_of :user_name, :message => 'must be provided'
   
  def initialize(user_name=nil,password=nil,password_confirmation=nil)
    super() 
    @user_name = user_name
    @password = password
    @password_confirmation = password_confirmation
  end


end
