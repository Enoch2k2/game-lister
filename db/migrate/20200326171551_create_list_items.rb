class CreateListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :list_items do |t|
      t.integer :quantity, default: 1
      t.boolean :complete, default: false
      t.belongs_to :list, foreign_key: true
      t.belongs_to :item, foreign_key: true

      t.timestamps
    end
  end
end
