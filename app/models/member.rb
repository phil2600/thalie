class Member < ActiveRecord::Base
  has_and_belongs_to_many :group
  GENDERS = [['Male', 'M'],
  ['Female', 'F']]
  
  def after_save
    self.password = nil
  end
  
  alias_method :after_find, :after_save
  
  def self.auth(lastname, pass)
    find(:first, :conditions => { :email => lastname, :password => pass })
  end
  
end
