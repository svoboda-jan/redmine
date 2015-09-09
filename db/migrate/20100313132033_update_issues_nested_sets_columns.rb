class UpdateIssuesNestedSetsColumns < ActiveRecord::Migration
  def self.up
    Issue.update_all parent_id: nil, root_id: 'id', lft: 1, rgt: 2
  end
end
