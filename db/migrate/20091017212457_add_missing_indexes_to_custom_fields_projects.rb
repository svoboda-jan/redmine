class AddMissingIndexesToCustomFieldsProjects < ActiveRecord::Migration
  def self.up
    add_index :custom_fields_projects, [:custom_field_id, :project_id], name: :cf_projects_cf_id_project_id
  end

  def self.down
    remove_index :custom_fields_projects, :name => :cf_projects_cf_id_project_id
  end
end
