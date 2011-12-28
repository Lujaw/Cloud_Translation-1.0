class AddColumnToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :worker_id, :integer
  end
end
