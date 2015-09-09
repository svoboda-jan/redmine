class ChangeChangesPathLengthLimit < ActiveRecord::Migration
  def self.up
    # these are two steps to please MySQL 5 on Win32
    # FIXME FirebirdSQL: Changing datatype is not supported for BLOB or ARRAY columns.
    unless ActiveRecord::Base.connection_config[:adapter] == 'fb'
      change_column :changes, :path, :text, :default => nil, :null => true
      change_column :changes, :path, :text, :null => false

      change_column :changes, :from_path, :text
    end
  end

  def self.down
    # FIXME FirebirdSQL: Changing datatype is not supported for BLOB or ARRAY columns.
    unless ActiveRecord::Base.connection_config[:adapter] == 'fb'
      change_column :changes, :path, :string, :default => "", :null => false
      change_column :changes, :from_path, :string
    end
  end
end
