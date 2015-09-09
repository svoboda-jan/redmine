class AddOpenIdAuthenticationTables < ActiveRecord::Migration
  def self.up
    # FirebirdSQL: table name is limited to 31 characters
    create_table :open_id_auth_assocs, :force => true do |t|
      t.integer :issued, :lifetime
      t.string :handle, :assoc_type
      t.binary :server_url, :secret
    end

    # FirebirdSQL: table name is limited to 31 characters
    create_table :open_id_auth_nonces, :force => true do |t|
      t.integer :timestamp, :null => false
      t.string :server_url, :null => true
      t.string :salt, :null => false
    end
  end

  def self.down
    drop_table :open_id_auth_assocs
    drop_table :open_id_auth_nonces
  end
end
