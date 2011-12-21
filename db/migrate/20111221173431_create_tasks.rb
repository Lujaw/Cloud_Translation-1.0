class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :content
      t.float :reward
      t.text :translated_text
      t.references :work

      t.timestamps
    end
    add_index :tasks, :work_id
  end
end
