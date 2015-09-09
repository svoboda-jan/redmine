class AddMissingIndexesToJournals < ActiveRecord::Migration
  def self.up
    add_index :journals, :user_id
    # Index name 'journals_journalized_id' on table 'journals' already exists
    #add_index :journals, :journalized_id
  end

  def self.down
    remove_index :journals, :user_id
    remove_index :journals, :journalized_id
  end
end
