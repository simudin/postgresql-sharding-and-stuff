class Person < ActiveRecord::Base
	has_many :clones

	def partition_id
    self.id % 32
  end

  has_many :images, ->(u) { where( partition_id: u.partition_id ) }
end
