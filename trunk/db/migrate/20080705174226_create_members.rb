class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :last_name, :null => false
      t.string :first_name, :null => false
      t.string :email, :null => false
      t.string :password
      t.string :phone
      t.date :birthday
      t.string :gender, :limit => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
