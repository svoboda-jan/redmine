class AddUniqueIndexOnTokensValue < ActiveRecord::Migration
  def up
    say_with_time "Adding unique index on tokens, this may take some time..." do
      # Just in case
      duplicates = Token.select(:value).group(:value).having('COUNT(id) > 1').to_a
      Token.where(:value => duplicates).delete_all
  
      add_index :tokens, :value, :unique => true, :name => 'tokens_value'
    end
  end

  def down
    remove_index :tokens, :name => 'tokens_value'
  end
end
