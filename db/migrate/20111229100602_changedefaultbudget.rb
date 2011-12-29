class Changedefaultbudget < ActiveRecord::Migration
  def up
  end

  def down
  end


  def change
     change_column_default(:clients, :budget, 1000)
  end



end
