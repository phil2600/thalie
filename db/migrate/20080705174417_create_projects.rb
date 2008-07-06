class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name, :null => false
      t.text :description
      t.references :group
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
