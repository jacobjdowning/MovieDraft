class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :score
      t.string :link
      t.datetime :releaseDate

      t.timestamps
    end
  end
end
