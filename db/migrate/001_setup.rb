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

class Setup < ActiveRecord::Migration

  class User < ActiveRecord::Base
    attr_protected :id
  end

  # model removed
  class Permission < ActiveRecord::Base; end

  def self.up
    # project
    Permission.create :controller => "projects", :action => "show", :description => "label_overview", :sort => 100, :is_public => true
    Permission.create :controller => "projects", :action => "changelog", :description => "label_change_log", :sort => 105, :is_public => true
    Permission.create :controller => "reports", :action => "issue_report", :description => "label_report_plural", :sort => 110, :is_public => true
    Permission.create :controller => "projects", :action => "settings", :description => "label_settings", :sort => 150
    Permission.create :controller => "projects", :action => "edit", :description => "button_edit", :sort => 151
    # members
    Permission.create :controller => "projects", :action => "list_members", :description => "button_list", :sort => 200, :is_public => true
    Permission.create :controller => "projects", :action => "add_member", :description => "button_add", :sort => 220
    Permission.create :controller => "members", :action => "edit", :description => "button_edit", :sort => 221
    Permission.create :controller => "members", :action => "destroy", :description => "button_delete", :sort => 222
    # versions
    Permission.create :controller => "projects", :action => "add_version", :description => "button_add", :sort => 320
    Permission.create :controller => "versions", :action => "edit", :description => "button_edit", :sort => 321
    Permission.create :controller => "versions", :action => "destroy", :description => "button_delete", :sort => 322
    # issue categories
    Permission.create :controller => "projects", :action => "add_issue_category", :description => "button_add", :sort => 420
    Permission.create :controller => "issue_categories", :action => "edit", :description => "button_edit", :sort => 421
    Permission.create :controller => "issue_categories", :action => "destroy", :description => "button_delete", :sort => 422
    # issues
    Permission.create :controller => "projects", :action => "list_issues", :description => "button_list", :sort => 1000, :is_public => true
    Permission.create :controller => "projects", :action => "export_issues_csv", :description => "label_export_csv", :sort => 1001, :is_public => true
    Permission.create :controller => "issues", :action => "show", :description => "button_view", :sort => 1005, :is_public => true
    Permission.create :controller => "issues", :action => "download", :description => "button_download", :sort => 1010, :is_public => true
    Permission.create :controller => "projects", :action => "add_issue", :description => "button_add", :sort => 1050, :mail_option => 1, :mail_enabled => 1
    Permission.create :controller => "issues", :action => "edit", :description => "button_edit", :sort => 1055
    Permission.create :controller => "issues", :action => "change_status", :description => "label_change_status", :sort => 1060, :mail_option => 1, :mail_enabled => 1
    Permission.create :controller => "issues", :action => "destroy", :description => "button_delete", :sort => 1065
    Permission.create :controller => "issues", :action => "add_attachment", :description => "label_attachment_new", :sort => 1070
    Permission.create :controller => "issues", :action => "destroy_attachment", :description => "label_attachment_delete", :sort => 1075
    # news
    Permission.create :controller => "projects", :action => "list_news", :description => "button_list", :sort => 1100, :is_public => true
    Permission.create :controller => "news", :action => "show", :description => "button_view", :sort => 1101, :is_public => true
    Permission.create :controller => "projects", :action => "add_news", :description => "button_add", :sort => 1120
    Permission.create :controller => "news", :action => "edit", :description => "button_edit", :sort => 1121
    Permission.create :controller => "news", :action => "destroy", :description => "button_delete", :sort => 1122
    # documents
    Permission.create :controller => "projects", :action => "list_documents", :description => "button_list", :sort => 1200, :is_public => true
    Permission.create :controller => "documents", :action => "show", :description => "button_view", :sort => 1201, :is_public => true
    Permission.create :controller => "documents", :action => "download", :description => "button_download", :sort => 1202, :is_public => true
    Permission.create :controller => "projects", :action => "add_document", :description => "button_add", :sort => 1220
    Permission.create :controller => "documents", :action => "edit", :description => "button_edit", :sort => 1221
    Permission.create :controller => "documents", :action => "destroy", :description => "button_delete", :sort => 1222
    Permission.create :controller => "documents", :action => "add_attachment", :description => "label_attachment_new", :sort => 1223
    Permission.create :controller => "documents", :action => "destroy_attachment", :description => "label_attachment_delete", :sort => 1224
    # files
    Permission.create :controller => "projects", :action => "list_files", :description => "button_list", :sort => 1300, :is_public => true
    Permission.create :controller => "versions", :action => "download", :description => "button_download", :sort => 1301, :is_public => true
    Permission.create :controller => "projects", :action => "add_file", :description => "button_add", :sort => 1320
    Permission.create :controller => "versions", :action => "destroy_file", :description => "button_delete", :sort => 1322

    # create default administrator account
    user = User.new :firstname => "Redmine",
                    :lastname => "Admin",
                    :mail => "admin@example.net",
                    :mail_notification => true,
                    :status => 1
    user.login = 'admin'
    user.hashed_password = "d033e22ae348aeb5660fc2140aec35850c4da997"
    user.admin = true
    user.save


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
