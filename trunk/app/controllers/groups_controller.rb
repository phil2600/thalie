class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.xml
  def index
    if params[:member_id].nil?
      @groups = Group.find(:all)
    else
      @member = Member.find(params[:member_id])
      @groups = @member.group
      # Modifier la requete pour enlever les groups auquel appartient le membre.
      if @member.group.empty?
        @other_groups = Group.find(:all, :select => "name, id").map{ |x|
          [x.name, x.id.to_s]
        }
      else
        group_ids = Group.find(:all, :select => "id", :conditions => ["id NOT IN (?)", @member.group_ids] ).map {|x| x.id}
        @other_groups = Group.find(group_ids, :select => "name, id").map{ |x|
          [x.name, x.id.to_s]
        }
      end
      @member_id = params[:member_id];
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groups }
    end
  end
  
  # GET /groups/1
  # GET /groups/1.xml
  def show
    @group = Group.find(params[:id])
    @members = @group.member
    @project = @group.project
    @events = @group.event
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group }
    end
  end
  
  # GET /groups/new
  # GET /groups/new.xml
  def new
    @group = Group.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end
  
  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end
  
  # POST /groups
  # POST /groups.xml
  # POST /members/:member_id/groups
  def create
    if params[:member_id].nil?
      @group = Group.new(params[:group])
      respond_to do |format|
        if @group.save
          flash[:notice] = 'Group was successfully created.'
          format.html { redirect_to(@group) }
          format.xml  { render :xml => @group, :status => :created, :location => @group }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
        end
      end
    else
      # Add member to an group.
      # POST /members/:member_id/groups
      RAILS_DEFAULT_LOGGER.debug("Add member #{params[:member_id]} to group #{params[:post][:group_id]}.")
      @member = Member.find(params[:member_id])
      @member.group << Group.find(params[:post][:group_id])

      respond_to do |format|
        flash[:notice] = 'Group was successfully added.'
        format.html { redirect_to(@member) }
        format.xml  { render :xml => @member, :status => :created, :location => @member }
      end
    end
  end
  
  # PUT /groups/1
  # PUT /groups/1.xml
  def update
    @group = Group.find(params[:id])
    
    respond_to do |format|
      if @group.update_attributes(params[:group])
        flash[:notice] = 'Group was successfully updated.'
        format.html { redirect_to(@group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /groups/1
  # DELETE /groups/1.xml
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    
    respond_to do |format|
      format.html { redirect_to(groups_url) }
      format.xml  { head :ok }
    end
  end
end
