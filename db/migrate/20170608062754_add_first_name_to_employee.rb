class AddFirstNameToEmployee < ActiveRecord::Migration[5.1]
  def change
    rename_column :employees, :name, :lastname
    add_column :employees, :firstname, :string
  end
end
