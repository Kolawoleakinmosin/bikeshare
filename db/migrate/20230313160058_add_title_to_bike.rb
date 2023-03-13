class AddTitleToBike < ActiveRecord::Migration[7.0]
  def change
    add_column :bikes, :title, :string
  end
end
