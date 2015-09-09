class UpdateWorkflowsAssigneeAndAuthor < ActiveRecord::Migration
  def self.up
    WorkflowRule.update_all(:assignee => false)
    WorkflowRule.update_all(:author => false)
  end
end
