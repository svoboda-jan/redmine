class AddEnumerationsPosition < ActiveRecord::Migration
  def self.up
    add_column(:enumerations, :position, :integer, :default => 1) unless Enumeration.column_names.include?('position')
  end

  def self.down
    remove_column :enumerations, :position
  end
end
