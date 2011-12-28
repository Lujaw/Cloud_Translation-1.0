class AddCreditToWorkernclients < ActiveRecord::Migration
  def change
    add_column :workers, :credit , :integer  , :default => 0
    add_column :clients, :budget  , :integer
    add_column :workers, :works_completed , :integer  , :default => 0
    add_column :clients, :works_submitted , :integer  , :default => 0
  end
end
