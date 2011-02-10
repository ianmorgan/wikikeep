class TagDatasController < ApplicationController
  # GET /tag_datas
  # GET /tag_datas.xml
  def index
    @tag_datas = TagData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tag_datas }
    end
  end

  # GET /tag_datas/1
  # GET /tag_datas/1.xml
  def show
    @tag_data = TagData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tag_data }
    end
  end

  # GET /tag_datas/new
  # GET /tag_datas/new.xml
  def new
    @tag_data = TagData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tag_data }
    end
  end

  # GET /tag_datas/1/edit
  def edit
    @tag_data = TagData.find(params[:id])
  end

  # POST /tag_datas
  # POST /tag_datas.xml
  def create
    @tag_data = TagData.new(params[:tag_data])

    respond_to do |format|
      if @tag_data.save
        format.html { redirect_to(@tag_data, :notice => 'Tag data was successfully created.') }
        format.xml  { render :xml => @tag_data, :status => :created, :location => @tag_data }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tag_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tag_datas/1
  # PUT /tag_datas/1.xml
  def update
    @tag_data = TagData.find(params[:id])

    respond_to do |format|
      if @tag_data.update_attributes(params[:tag_data])
        format.html { redirect_to(@tag_data, :notice => 'Tag data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_datas/1
  # DELETE /tag_datas/1.xml
  def destroy
    @tag_data = TagData.find(params[:id])
    @tag_data.destroy

    respond_to do |format|
      format.html { redirect_to(tag_datas_url) }
      format.xml  { head :ok }
    end
  end
end
