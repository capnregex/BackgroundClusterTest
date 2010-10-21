class BgProcessesController < ApplicationController
  # GET /bg_processes
  # GET /bg_processes.xml
  def index
    @bg_processes = BgProcess.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bg_processes }
    end
  end

  # GET /bg_processes/1
  # GET /bg_processes/1.xml
  def show
    @bg_process = BgProcess.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bg_process }
    end
  end

  # GET /bg_processes/new
  # GET /bg_processes/new.xml
  def new
    @bg_process = BgProcess.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bg_process }
    end
  end

  # GET /bg_processes/1/edit
  def edit
    @bg_process = BgProcess.find(params[:id])
  end

  # POST /bg_processes
  # POST /bg_processes.xml
  def create
    @bg_process = BgProcess.new(params[:bg_process])

    respond_to do |format|
      if @bg_process.save
        format.html { redirect_to(@bg_process, :notice => 'Bg process was successfully created.') }
        format.xml  { render :xml => @bg_process, :status => :created, :location => @bg_process }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bg_process.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bg_processes/1
  # PUT /bg_processes/1.xml
  def update
    @bg_process = BgProcess.find(params[:id])

    respond_to do |format|
      if @bg_process.update_attributes(params[:bg_process])
        format.html { redirect_to(@bg_process, :notice => 'Bg process was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bg_process.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bg_processes/1
  # DELETE /bg_processes/1.xml
  def destroy
    @bg_process = BgProcess.find(params[:id])
    @bg_process.destroy

    respond_to do |format|
      format.html { redirect_to(bg_processes_url) }
      format.xml  { head :ok }
    end
  end
end
