class RegistrationStep3Command < BasePoro2
  attr_accessor :default_visibility
 
   
  def initialize(attrs=Hash.new)
    super() 
    @default_visibility = attrs[:default_visibility]
  end
end
