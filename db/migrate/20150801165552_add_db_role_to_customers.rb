class AddDbRoleToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :db_role, :string
  end
end
