class AddMissingIndexesToWatchers < ActiveRecord::Migration
  def self.up
    add_index :watchers, :user_id
    add_index :watchers, [:watchable_id, :watchable_type], name: :watchers_wtch_id_wtch_type
  end

  def self.down
    remove_index :watchers, :user_id
    remove_index :watchers, :name => :watchers_wtch_id_wtch_type
  end
end
