class CreateStringAttributes < ActiveRecord::Migration[6.1]
  def change
    create_table :string_attributes do |t|
      t.string :value
      t.belongs_to :parameter, index: true
      t.belongs_to :product, index: true, null: true

      t.timestamps
    end
  end
end
