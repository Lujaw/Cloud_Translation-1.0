class AddDocumentClient < ActiveRecord::Migration
  def up
  end

  def down
  end
def change
  add_column :clients ,:document ,:string
end
end
