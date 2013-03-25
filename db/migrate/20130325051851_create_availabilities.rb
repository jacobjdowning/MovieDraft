class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :league_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
