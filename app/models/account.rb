class Account < ActiveRecord::Base
  has_many :users

  validates_format_of :name, :with => /^[a-zA-Z][a-zA-Z0-9_]*[a-zA-Z0-9]$/, :message => "Only letters, numbers and underscores allowed"
end
