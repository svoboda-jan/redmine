class PopulateEmailAddresses < ActiveRecord::Migration
  def self.up
    t = EmailAddress.connection.quoted_true
    n = EmailAddress.connection.quoted_date(Time.now)

    # FIXME FirebirdSQL
    if ActiveRecord::Base.connection_config[:adapter] == 'fb'
      User.find_each(batch_size: 100) do |user|
        EmailAddress.create!({
          user_id: user.id,
          address: user[:mail],
          is_default: t,
          notify: t,
          created_on: n,
          updated_on: n
        })
      end
    else
      sql = "INSERT INTO #{EmailAddress.table_name} (user_id, address, is_default, notify, created_on, updated_on)" +
            " SELECT id, mail, #{t}, #{t}, '#{n}', '#{n}' FROM #{User.table_name} WHERE type = 'User' ORDER BY id"
      EmailAddress.connection.execute(sql)
    end
  end

  def self.down
    EmailAddress.delete_all
  end
end
