class AddPgSearchToBikes < ActiveRecord::Migration[7.0]
  def change
    add_column :bikes, :pg_search_document, :tsvector
  end
end
