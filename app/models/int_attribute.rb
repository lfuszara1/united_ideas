class IntAttribute < ApplicationRecord

  belongs_to :parameter
  belongs_to :product, optional: true

end
