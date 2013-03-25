class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :player_id
      t.integer :movie_id
      t.integer :league_id

      t.timestamps
    end
  end
end
