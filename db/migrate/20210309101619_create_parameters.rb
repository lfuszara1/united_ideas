class CreateParameters < ActiveRecord::Migration[6.1]
  def change
    create_table :parameters do |t|
      t.string :name
      t.boolean :searchable?
      t.integer :field_type
      t.belongs_to :category, index: true
      t.belongs_to :product, index: true, null: true

      t.timestamps
    end
  end
end
