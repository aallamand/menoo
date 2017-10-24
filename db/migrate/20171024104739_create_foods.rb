class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
