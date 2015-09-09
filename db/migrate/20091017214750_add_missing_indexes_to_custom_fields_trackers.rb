class AddMissingIndexesToCustomFieldsTrackers < ActiveRecord::Migration
  def self.up
    add_index :custom_fields_trackers, [:custom_field_id, :tracker_id], name: :cf_trackers_cf_id_tacker_id
  end

  def self.down
    remove_index :custom_fields_trackers, :name => :cf_trackers_cf_id_tacker_id
  end
end
