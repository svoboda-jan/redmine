class ChangeJournalDetailsValuesToText < ActiveRecord::Migration
  def self.up
    # FIXME FirebirdSQL: Changing datatype is not supported for BLOB or ARRAY columns.
    unless ActiveRecord::Base.connection_config[:adapter] == 'fb'
      change_column :journal_details, :old_value, :text
      change_column :journal_details, :value, :text
    end
  end

  def self.down
    # FIXME FirebirdSQL: Changing datatype is not supported for BLOB or ARRAY columns.
    unless ActiveRecord::Base.connection_config[:adapter] == 'fb'
      change_column :journal_details, :old_value, :string
      change_column :journal_details, :value, :string
    end
  end
end
