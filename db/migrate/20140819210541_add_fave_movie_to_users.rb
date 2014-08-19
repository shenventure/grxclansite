class AddFaveMovieToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fave_movie, :string
  end
end
