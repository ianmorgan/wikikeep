class RegistrationStep1Command < BaseCommand 
  column :account_name, :string 
 # attr_accessor :account_name

  validates_presence_of :account_name, :message => 'must be provided'
  validates_length_of :account_name, :in => 6..32, :allow_blank => true
  validates_format_of :account_name, :with => /^[a-zA-Z][a-zA-Z0-9_]*[a-zA-Z0-9]$/, :message => "Only letters, numbers and underscores allowed" , :allow_blank => true
   
#  def initialize(account_name=nil)
#    super() 
#    @account_name = account_name    
#  end

    #def validate!
    #  errors.add(:name, "can not be nil") if name == nil
    #end
 
  #def account_name_format
  #  errors.add(:account_name , "only letters, numbers and underscores allowed") if
  #  
  #end

end
