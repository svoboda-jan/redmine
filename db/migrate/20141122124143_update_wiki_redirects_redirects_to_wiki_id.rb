class UpdateWikiRedirectsRedirectsToWikiId < ActiveRecord::Migration
  def self.up
    WikiRedirect.update_all "redirects_to_wiki_id = wiki_id"
    change_column :wiki_redirects, :redirects_to_wiki_id, :integer, :null => false
  end
end
