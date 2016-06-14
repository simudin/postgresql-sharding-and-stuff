class Clone < ActiveRecord::Base
  belongs_to :person
  has_many :therapists
end
