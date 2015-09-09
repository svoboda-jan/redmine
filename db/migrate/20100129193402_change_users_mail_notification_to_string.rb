class ChangeUsersMailNotificationToString < ActiveRecord::Migration
  def self.up
    rename_column :users, :mail_notification, :mail_notification_bool
    add_column :users, :mail_notification, :string, :default => '', :null => false
  end

  def self.down
    User.where("mail_notification_char <> 'all'").
      update_all("mail_notification = #{connection.quoted_false}")
    remove_column :users, :mail_notification_char
  end
end
