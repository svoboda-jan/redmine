class UpdateUsersType < ActiveRecord::Migration
  def self.up
    User.update_all type: 'User'
  end
end
