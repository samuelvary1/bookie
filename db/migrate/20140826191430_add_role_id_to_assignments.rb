class AddRoleIdToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :role_id, :integer
  end
end
