#
# A tableless actve model
# See :
#    http://yehudakatz.com/2010/01/10/activemodel-make-any-ruby-object-feel-like-activerecord/
#
#

class BasePoro2
  extend ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Conversion
  #include ActiveModel::Serialization
 
  #validates_presence_of :first_name, :last_name
 
  attr_accessor :attributes
  attr_reader   :errors
   
  def initialize(attributes = {})
    @errors = ActiveModel::Errors.new(self)
    @attributes = attributes
  end
 
  def read_attribute_for_validation(key)
    @attributes[key]
  end
  
  def BasePoro2.human_attribute_name(attr, options = {})
    attr
  end
  
  def BasePoro2.lookup_ancestors
      [self]
    end
    
    def persisted?
      false
    end    
    
 #   def type_cast_code(var_name)
#         case type
#           when :string    then nil
#           when :text      then nil
#           when :integer   then "(#{var_name}.to_i rescue #{var_name} ? 1 : 0)"
#           when :float     then "#{var_name}.to_f"
#           when :decimal   then "#{self.class.name}.value_to_decimal(#{var_name})"
#           when :datetime  then "#{self.class.name}.string_to_time(#{var_name})"
#           when :timestamp then "#{self.class.name}.string_to_time(#{var_name})"
#           when :time      then "#{self.class.name}.string_to_dummy_time(#{var_name})"
#           when :date      then "#{self.class.name}.string_to_date(#{var_name})"
#           when :binary    then "#{self.class.name}.binary_to_string(#{var_name})"
#           when :boolean   then "#{self.class.name}.value_to_boolean(#{var_name})"
#           else nil
#         end
#       end
end