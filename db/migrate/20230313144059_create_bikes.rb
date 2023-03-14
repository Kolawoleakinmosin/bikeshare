class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.string :location
      t.integer :price
      t.boolean :availability, default: false
      t.references :user
      t.timestamps
    end
  end
end
