class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price_cents
      t.string :unit
      t.string :slug
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :products, :slug, unique: true
  end
end
