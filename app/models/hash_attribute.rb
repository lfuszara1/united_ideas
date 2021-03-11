class HashAttribute < ApplicationRecord

  belongs_to :parameter
  belongs_to :product, optional: true
  has_many :hash_elementss

end
