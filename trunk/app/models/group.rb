class Group < ActiveRecord::Base
  has_and_belongs_to_many :member
  has_one :project
  has_many :event
end
