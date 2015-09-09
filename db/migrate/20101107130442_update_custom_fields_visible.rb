class UpdateCustomFieldsVisible < ActiveRecord::Migration
  def self.up
    CustomField.update_all("visible = #{CustomField.connection.quoted_true}")
  end
end
