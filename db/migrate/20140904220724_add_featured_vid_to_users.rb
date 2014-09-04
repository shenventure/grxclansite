class AddFeaturedVidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :featured_vid, :text
  end
end
