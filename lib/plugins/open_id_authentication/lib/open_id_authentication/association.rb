module OpenIdAuthentication
  class Association < ActiveRecord::Base
    # FirebirdSQL: table name is limited to 31 characters
    self.table_name = :open_id_auth_assocs

    def from_record
      OpenID::Association.new(handle, secret, issued, lifetime, assoc_type)
    end
  end
end
