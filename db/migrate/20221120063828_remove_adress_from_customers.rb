class RemoveAdressFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :adress, :string
  end
end
