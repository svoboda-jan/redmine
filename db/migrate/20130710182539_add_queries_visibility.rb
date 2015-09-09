class AddQueriesVisibility < ActiveRecord::Migration
  def up
    add_column :queries, :visibility, :integer, :default => 0
  end

  def down
    Query.where('visibility <> ?', 2).update_all(:is_public => false)
    remove_column :queries, :visibility
  end
end
