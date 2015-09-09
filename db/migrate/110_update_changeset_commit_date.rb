class UpdateChangesetCommitDate < ActiveRecord::Migration
  def self.up
    Changeset.update_all commit_date: :committed_on
  end
end
