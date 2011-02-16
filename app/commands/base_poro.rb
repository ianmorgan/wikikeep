# Build an active record model manually 
#  without a database table 
#
# TODO - need to work out how to get mass assigment (attributes and attributes=) methodd added
 
class  BasePoro
    extend ActiveModel::Naming
    include ActiveModel::Conversion
    include ActiveModel::Validations

    def initialize
      @errors = ActiveModel::Errors.new(self)
    end

    attr_reader   :errors
    
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

