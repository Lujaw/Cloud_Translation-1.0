class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.text :content
      t.string :from
      t.string :to
      t.float :reward
      t.text :additional_info
      t.text :translated_text
      t.references :client

      t.timestamps
    end
    add_index :works, :client_id
  end
end
