class AddDefaultMember < ActiveRecord::Migration
  def self.up
    Member.create (:first_name => "root", :last_name => "root", :password => "root", :email => "root@localhost.com")
  end
  
  def self.down
  end
end
