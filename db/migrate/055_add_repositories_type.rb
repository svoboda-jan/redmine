class AddRepositoriesType < ActiveRecord::Migration
  def self.up
    add_column :repositories, :type, :string
  end

  def self.down
    remove_column :repositories, :type
  end
end
