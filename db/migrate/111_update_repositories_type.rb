class UpdateRepositoriesType < ActiveRecord::Migration
  def self.up
    # Set class name for existing SVN repositories
    Repository.update_all type: 'Subversion'
  end
end
