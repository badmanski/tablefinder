class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :place_id
      t.string :role, default: 'visitor'
      t.string :password_digest

      t.timestamps
    end
  end
end
