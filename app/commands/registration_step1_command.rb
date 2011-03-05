class RegistrationStep1Command < BaseCommand 
  column :account_name, :string 
 # attr_accessor :account_name

  validates_presence_of :account_name, :message => 'must be provided'
  validates_length_of :account_name, :in => 6..32, :allow_blank => true
  validates_format_of :account_name, :with => /^[a-zA-Z][a-zA-Z0-9_]*[a-zA-Z0-9]$/, :message => "Only letters, numbers and underscores allowed" , :allow_blank => true
  #validates_with UniqueAccountNameValidator
  validate :account_name_cannot_be_in_use 
  
  def account_name_cannot_be_in_use
    if Account.find_by_name(account_name)
      errors.add(:account_name, "Sorry, this name is already in use")
    end
  end
 
end


