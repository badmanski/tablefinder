class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author, null: false
      t.text :content, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
  end
end
