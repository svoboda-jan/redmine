# Redmine - project management software
# Copyright (C) 2006  Jean-Philippe Lang
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

class InitTables < ActiveRecord::Migration

  class User < ActiveRecord::Base
    attr_protected :id
  end

  # model removed
  class Permission < ActiveRecord::Base; end

  def self.up
    create_table "attachments", :force => true do |t|
      t.column "container_id", :integer, :default => 0, :null => false
      t.column "container_type", :string, :limit => 30, :default => "", :null => false
      t.column "filename", :string, :default => "", :null => false
      t.column "disk_filename", :string, :default => "", :null => false
      t.column "filesize", :integer, :default => 0, :null => false
      t.column "content_type", :string, :limit => 60, :default => ""
      t.column "digest", :string, :limit => 40, :default => "", :null => false
      t.column "downloads", :integer, :default => 0, :null => false
      t.column "author_id", :integer, :default => 0, :null => false
      t.column "created_on", :timestamp
    end

    create_table "auth_sources", :force => true do |t|
      t.column "type", :string, :limit => 30, :default => "", :null => false
      t.column "name", :string, :limit => 60, :default => "", :null => false
      t.column "host", :string, :limit => 60
      t.column "port", :integer
      t.column "account", :string, :limit => 60
      t.column "account_password", :string, :limit => 60
      t.column "base_dn", :string, :limit => 255
      t.column "attr_login", :string, :limit => 30
      t.column "attr_firstname", :string, :limit => 30
      t.column "attr_lastname", :string, :limit => 30
      t.column "attr_mail", :string, :limit => 30
      t.column "onthefly_register", :boolean, :default => false, :null => false
    end

    create_table "custom_fields", :force => true do |t|
      t.column "type", :string, :limit => 30, :default => "", :null => false
      t.column "name", :string, :limit => 30, :default => "", :null => false
      t.column "field_format", :string, :limit => 30, :default => "", :null => false
      t.column "possible_values", :text
      t.column "regexp", :string, :default => ""
      t.column "min_length", :integer, :default => 0, :null => false
      t.column "max_length", :integer, :default => 0, :null => false
      t.column "is_required", :boolean, :default => false, :null => false
      t.column "is_for_all", :boolean, :default => false, :null => false
    end

    create_table "custom_fields_projects", :id => false, :force => true do |t|
      t.column "custom_field_id", :integer, :default => 0, :null => false
      t.column "project_id", :integer, :default => 0, :null => false
    end

    create_table "custom_fields_trackers", :id => false, :force => true do |t|
      t.column "custom_field_id", :integer, :default => 0, :null => false
      t.column "tracker_id", :integer, :default => 0, :null => false
    end

    create_table "custom_values", :force => true do |t|
      t.column "customized_type", :string, :limit => 30, :default => "", :null => false
      t.column "customized_id", :integer, :default => 0, :null => false
      t.column "custom_field_id", :integer, :default => 0, :null => false
      t.column "value", :text
    end

    create_table "documents", :force => true do |t|
      t.column "project_id", :integer, :default => 0, :null => false
      t.column "category_id", :integer, :default => 0, :null => false
      t.column "title", :string, :limit => 60, :default => "", :null => false
      t.column "description", :text
      t.column "created_on", :timestamp
    end

    add_index "documents", ["project_id"], :name => "documents_project_id"

    create_table "enumerations", :force => true do |t|
      t.column "opt", :string, :limit => 4, :default => "", :null => false
      t.column "name", :string, :limit => 30, :default => "", :null => false
    end

    create_table "issue_categories", :force => true do |t|
      t.column "project_id", :integer, :default => 0, :null => false
      t.column "name", :string, :limit => 30, :default => "", :null => false
    end

    add_index "issue_categories", ["project_id"], :name => "issue_categories_project_id"

    create_table "issue_histories", :force => true do |t|
      t.column "issue_id", :integer, :default => 0, :null => false
      t.column "status_id", :integer, :default => 0, :null => false
      t.column "author_id", :integer, :default => 0, :null => false
      t.column "notes", :text
      t.column "created_on", :timestamp
    end

    add_index "issue_histories", ["issue_id"], :name => "issue_histories_issue_id"

    create_table "issue_statuses", :force => true do |t|
      t.column "name", :string, :limit => 30, :default => "", :null => false
      t.column "is_closed", :boolean, :default => false, :null => false
      t.column "is_default", :boolean, :default => false, :null => false
      t.column "html_color", :string, :limit => 6, :default => "FFFFFF", :null => false
    end

    create_table "issues", :force => true do |t|
      t.column "tracker_id", :integer, :default => 0, :null => false
      t.column "project_id", :integer, :default => 0, :null => false
      t.column "subject", :string, :default => "", :null => false
      t.column "description", :text
      t.column "due_date", :date
      t.column "category_id", :integer
      t.column "status_id", :integer, :default => 0, :null => false
      t.column "assigned_to_id", :integer
      t.column "priority_id", :integer, :default => 0, :null => false
      t.column "fixed_version_id", :integer
      t.column "author_id", :integer, :default => 0, :null => false
      t.column "lock_version", :integer, :default => 0, :null => false
      t.column "created_on", :timestamp
      t.column "updated_on", :timestamp
    end

    add_index "issues", ["project_id"], :name => "issues_project_id"

    create_table "members", :force => true do |t|
      t.column "user_id", :integer, :default => 0, :null => false
      t.column "project_id", :integer, :default => 0, :null => false
      t.column "role_id", :integer, :default => 0, :null => false
      t.column "created_on", :timestamp
    end

    create_table "news", :force => true do |t|
      t.column "project_id", :integer
      t.column "title", :string, :limit => 60, :default => "", :null => false
      t.column "summary", :string, :limit => 255, :default => ""
      t.column "description", :text
      t.column "author_id", :integer, :default => 0, :null => false
      t.column "created_on", :timestamp
    end

    add_index "news", ["project_id"], :name => "news_project_id"

    create_table "permissions", :force => true do |t|
      t.column "controller", :string, :limit => 30, :default => "", :null => false
      t.column "action", :string, :limit => 30, :default => "", :null => false
      t.column "description", :string, :limit => 60, :default => "", :null => false
      t.column "is_public", :boolean, :default => false, :null => false
      t.column "sort", :integer, :default => 0, :null => false
      t.column "mail_option", :boolean, :default => false, :null => false
      t.column "mail_enabled", :boolean, :default => false, :null => false
    end

    create_table "permissions_roles", :id => false, :force => true do |t|
      t.column "permission_id", :integer, :default => 0, :null => false
      t.column "role_id", :integer, :default => 0, :null => false
    end

    add_index "permissions_roles", ["role_id"], :name => "permissions_roles_role_id"

    create_table "projects", :force => true do |t|
      t.column "name", :string, :limit => 30, :default => "", :null => false
      t.column "description", :string, :default => "", :null => false
      t.column "homepage", :string, :limit => 60, :default => ""
      t.column "is_public", :boolean, :default => true, :null => false
      t.column "parent_id", :integer
      t.column "projects_count", :integer, :default => 0
      t.column "created_on", :timestamp
      t.column "updated_on", :timestamp
    end

    create_table "roles", :force => true do |t|
      t.column "name", :string, :limit => 30, :default => "", :null => false
    end

    create_table "tokens", :force => true do |t|
      t.column "user_id", :integer, :default => 0, :null => false
      t.column "action", :string, :limit => 30, :default => "", :null => false
      t.column "value", :string, :limit => 40, :default => "", :null => false
      t.column "created_on", :datetime, :null => false
    end

    create_table "trackers", :force => true do |t|
      t.column "name", :string, :limit => 30, :default => "", :null => false
      t.column "is_in_chlog", :boolean, :default => false, :null => false
    end

    create_table "users", :force => true do |t|
      t.column "login", :string, :limit => 30, :default => "", :null => false
      t.column "hashed_password", :string, :limit => 40, :default => "", :null => false
      t.column "firstname", :string, :limit => 30, :default => "", :null => false
      t.column "lastname", :string, :limit => 30, :default => "", :null => false
      t.column "mail", :string, :limit => 60, :default => "", :null => false
      t.column "mail_notification", :boolean, :default => true, :null => false
      t.column "admin", :boolean, :default => false, :null => false
      t.column "status", :integer, :default => 1, :null => false
      t.column "last_login_on", :datetime
      t.column "language", :string, :limit => 2, :default => ""
      t.column "auth_source_id", :integer
      t.column "created_on", :timestamp
      t.column "updated_on", :timestamp
    end

    create_table "versions", :force => true do |t|
      t.column "project_id", :integer, :default => 0, :null => false
      t.column "name", :string, :limit => 30, :default => "", :null => false
      t.column "description", :string, :default => ""
      t.column "effective_date", :date
      t.column "created_on", :timestamp
      t.column "updated_on", :timestamp
    end

    add_index "versions", ["project_id"], :name => "versions_project_id"

    create_table "workflows", :force => true do |t|
      t.column "tracker_id", :integer, :default => 0, :null => false
      t.column "old_status_id", :integer, :default => 0, :null => false
      t.column "new_status_id", :integer, :default => 0, :null => false
      t.column "role_id", :integer, :default => 0, :null => false
    end

  end

  def self.down
    drop_table :attachments
    drop_table :auth_sources
    drop_table :custom_fields
    drop_table :custom_fields_projects
    drop_table :custom_fields_trackers
    drop_table :custom_values
    drop_table :documents
    drop_table :enumerations
    drop_table :issue_categories
    drop_table :issue_histories
    drop_table :issue_statuses
    drop_table :issues
    drop_table :members
    drop_table :news
    drop_table :permissions
    drop_table :permissions_roles
    drop_table :projects
    drop_table :roles
    drop_table :trackers
    drop_table :tokens
    drop_table :users
    drop_table :versions
    drop_table :workflows
  end
end
