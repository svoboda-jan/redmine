class UpdateVersionsStatus < ActiveRecord::Migration
  def self.up
    Version.update_all status: 'open'
  end
end
