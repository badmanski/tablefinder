class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :url

      t.timestamps
    end
  end
end
