class AddUniqueIndexOnRolesManagedRoles < ActiveRecord::Migration
  def change
    add_index :roles_managed_roles, [:role_id, :managed_role_id], :unique => true, :name => :roles_mng_roles_r_id_mng_r_id
  end
end
