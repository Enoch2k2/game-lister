class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name
      t.belongs_to :user_game, foreign_key: true

      t.timestamps
    end
  end
end
