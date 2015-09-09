module OpenIdAuthentication
  class Nonce < ActiveRecord::Base
    # FirebirdSQL: table name is limited to 31 characters
    self.table_name = :open_id_auth_nonces
  end
end
