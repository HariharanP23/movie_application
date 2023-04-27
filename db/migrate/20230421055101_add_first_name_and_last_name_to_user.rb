class AddFirstNameAndLastNameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :First_name, :string
    add_column :users, :Last_name, :string
  end
end
