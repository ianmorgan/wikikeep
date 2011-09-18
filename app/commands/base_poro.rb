# Build an active record model manually 
#  without a database table 
#
# TODO - need to work out how to get mass assigment (attributes and attributes=) methodd added
 
class  BasePoro
    extend ActiveModel::Naming
    include ActiveModel::Conversion
    include ActiveModel::Validations

#    def initialize
#      @errors = ActiveModel::Errors.new(self)
#    end

    attr_accessor :attributes
    attr_reader   :errors
    
    
    def initialize(attributes={})
        @errors = ActiveModel::Errors.new(self)
         @attributes = attributes.stringify_keys.inject({}) do |x,y|
             respond_to?("#{y.first}=") && send("#{y.first}=", y.last) ? x.merge(y.first => y.last) : x
        end
    end

    
    # The following methods are needed to be minimally implemented

    def read_attribute_for_validation(attr)
      send(attr)
    end

    def BasePoro.human_attribute_name(attr, options = {})
      attr
    end

    def BasePoro.lookup_ancestors
      [self]
    end

    def persisted?
      false
    end 

  end

