class AddFactToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fact, :text
  end
end
