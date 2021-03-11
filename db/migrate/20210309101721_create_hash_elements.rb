class CreateHashElements < ActiveRecord::Migration[6.1]
  def change
    create_table :hash_elements do |t|
      t.string :value
      t.belongs_to :hash_attribute, index: true

      t.timestamps
    end
  end
end
