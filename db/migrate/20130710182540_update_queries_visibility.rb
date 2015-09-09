class UpdateQueriesVisibility < ActiveRecord::Migration
  def up
    Query.where(:is_public => true).update_all(:visibility => 2)
    remove_column :queries, :is_public
  end

  def down
    add_column :queries, :is_public, :boolean, :default => true, :null => false
  end
end
