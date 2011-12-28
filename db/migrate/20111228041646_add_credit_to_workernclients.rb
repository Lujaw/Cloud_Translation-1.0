class AddCreditToWorkernclients < ActiveRecord::Migration
  def change
    add_column :workers, :budget , :integer
    add_column :clients, :credit , :integer  , :default => 0
    add_column :workers, :works_submitted , :integer  , :default => 0
    add_column :clients, :works_completed , :integer  , :default => 0
  end
end
