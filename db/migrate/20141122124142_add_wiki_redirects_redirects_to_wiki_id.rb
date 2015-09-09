class AddWikiRedirectsRedirectsToWikiId < ActiveRecord::Migration
  def self.up
    add_column :wiki_redirects, :redirects_to_wiki_id, :integer
  end

  def self.down
    remove_column :wiki_redirects, :redirects_to_wiki_id
  end
end
