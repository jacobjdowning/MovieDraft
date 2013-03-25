class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
      t.datetime :draftdate
      t.string :draftkind
      t.string :integer
      t.integer :startingFunds
      t.integer :timeLimit

      t.timestamps
    end
  end
end
