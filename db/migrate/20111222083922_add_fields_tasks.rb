class AddFieldsTasks < ActiveRecord::Migration
  def up
  end

  def down
  end

  def change

      add_column :tasks, :status , :string
      add_column :tasks, :Approved , :boolean
  end
end
