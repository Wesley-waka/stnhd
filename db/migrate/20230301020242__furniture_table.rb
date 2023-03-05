class FurnitureTable < ActiveRecord::Migration[6.1]
  def change
    create_table :furnitures do |t|
      t.string :name
      t.integer :price
      t.string :image
      t.string :description
      t.string :shipping
      t.integer :category_id
      t.integer :company_id
    end
  end
end
