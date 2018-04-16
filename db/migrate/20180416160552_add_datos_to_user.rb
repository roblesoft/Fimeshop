class AddDatosToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :matricula, :integer
    add_column :users, :carrera, :string
    add_column :users, :anoegreso, :integer
  end
end
