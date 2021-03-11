class Category < ApplicationRecord

  has_many :products
  has_many :parameters

  has_many :categories, :foreign_key => "category_id"
  belongs_to :category, optional: true

  scope :childs, -> (category) { where('category_id = ?', category.id) }

end
