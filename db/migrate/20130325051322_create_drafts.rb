class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
      t.datetime :draftdate
      t.string :draftkind
      t.string :integer
      t.integer :startingFunds
      t.integer :timeLimit
      t.integer :league_id

      t.timestamps
    end
  end
end
