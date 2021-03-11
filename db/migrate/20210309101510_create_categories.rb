class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.integer :parameters_from

      t.timestamps
    end
  end
end
