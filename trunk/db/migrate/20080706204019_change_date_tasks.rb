class ChangeDateTasks < ActiveRecord::Migration
  def self.up
    change_column :tasks, :date, :datetime, :null => false
  end

  def self.down
    change_column :tasks, :date, :date, :null => false
  end
end
