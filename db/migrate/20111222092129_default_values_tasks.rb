class DefaultValuesTasks < ActiveRecord::Migration
  def up
  end

  def down
  end
  def change
  change_column :tasks, :status, :string, :default => "Pending"
  change_column :tasks, :Approved, :boolean, :default => 0
  end
end
