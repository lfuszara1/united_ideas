class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
