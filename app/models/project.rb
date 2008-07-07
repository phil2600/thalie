class Project < ActiveRecord::Base
  belongs_to :group
  has_many :task
  
  def before_save
    self.create_group(:name => self.name)
  end
end
