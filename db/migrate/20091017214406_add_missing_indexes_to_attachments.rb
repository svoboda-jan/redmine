class AddMissingIndexesToAttachments < ActiveRecord::Migration
  def self.up
    add_index :attachments, [:container_id, :container_type], name: :attachments_cont_id_cont_type
    add_index :attachments, :author_id
  end

  def self.down
    remove_index :attachments, :name => :attachments_cont_id_cont_type
    remove_index :attachments, :author_id
  end
end
