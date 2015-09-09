class AddIssuesNestedSetsColumns < ActiveRecord::Migration
  def self.up
    add_column :issues, :parent_id, :integer, :default => nil
    add_column :issues, :root_id, :integer, :default => nil
    add_column :issues, :lft, :integer, :default => nil
    add_column :issues, :rgt, :integer, :default => nil
  end

  def self.down
    remove_column :issues, :parent_id
    remove_column :issues, :root_id
    remove_column :issues, :lft
    remove_column :issues, :rgt
  end
end
