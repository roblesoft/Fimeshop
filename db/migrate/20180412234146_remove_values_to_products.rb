class RemoveValuesToProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :desktop, :boolean
    remove_column :products, :clothing, :boolean
    remove_column :products, :accesories, :boolean
    remove_column :products, :thermos, :boolean
    remove_column :products, :other, :boolean
  end
end
