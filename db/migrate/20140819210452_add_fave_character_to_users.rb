class AddFaveCharacterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fave_character, :string
  end
end
