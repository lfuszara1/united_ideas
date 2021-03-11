class Product < ApplicationRecord

  belongs_to :category
  has_many :parameters

  has_many :int_attribute
  has_many :decimal_attribute
  has_many :string_attribute
  has_many :hash_attribute

end
