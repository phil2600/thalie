class WelcomeController < ApplicationController
  before_filter :authentificate
  
  def index
     # 5 Last authors
    @click=false
    @members = Member.find(:all, :limit => 5, :order => 'created_at DESC')
    @events = Event.find(:all, :limit => 5, :order => 'created_at DESC')
  end
end
