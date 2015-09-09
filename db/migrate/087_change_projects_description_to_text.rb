class ChangeProjectsDescriptionToText < ActiveRecord::Migration
  def self.up
    # FIXME FirebirdSQL: Changing datatype is not supported for BLOB or ARRAY columns.
    unless ActiveRecord::Base.connection_config[:adapter] == 'fb'
      change_column :projects, :description, :text, :null => true, :default => nil
    end
  end

  def self.down
  end
end
