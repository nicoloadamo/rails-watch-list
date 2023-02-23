class AddPostUrlToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :post_url, :string
  end
end
