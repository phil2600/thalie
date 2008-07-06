class WelcomeController < ApplicationController

  def index
     # 5 Last authors
    @click=false
    @members = Member.find(:all, :limit => 5, :order => 'created_at DESC')
  end
end
