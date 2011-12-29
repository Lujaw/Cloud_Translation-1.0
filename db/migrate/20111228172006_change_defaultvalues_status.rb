class ChangeDefaultvaluesStatus < ActiveRecord::Migration
  def up
  end
  def change
   change_column_default(:tasks, :status, 'Untranslated')
  end
  def down
  end
end
