class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :imdb_url
      t.string :img_url

      t.timestamps null: false
    end
  end
end
