class Parameter < ApplicationRecord

  belongs_to :category
  belongs_to :product, optional: true

  has_many :int_attribute
  has_many :decimal_attribute
  has_many :string_attribute
  has_many :hash_attribute

end
