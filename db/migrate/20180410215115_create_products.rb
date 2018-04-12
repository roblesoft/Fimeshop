class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.boolean :available
      t.boolean :desktop
      t.boolean :clothing
      t.boolean :accessories
      t.boolean :thermos
      t.boolean :others

      t.timestamps
    end
  end
end
