class WorksController < ApplicationController
  # GET /works
  # GET /works.json
  def index
    @works =Work.where(:client_id => current_client.id).paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @works }
    end
  end

  # GET /works/1
  # GET /works/1.json
  def show
    @work = current_client.works.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work }
    end
  end

  # GET /works/new
  # GET /works/new.json
  def new
    @work = current_client.works.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @work }
    end
  end
  # GET /works/1/edit
  def edit
    @work = Work.find(params[:id])
  end
  # POST /works
  # POST /works.json
  def create
    @work = current_client.works.new(params[:work])
    respond_to do |format|
      if (current_client.budget >= @work.reward)
        if @work.save
          current_client.budget = current_client.budget - @work.reward
          current_client.works_submitted = current_client.works_submitted + 1
          current_client.save
          format.html { redirect_to @work, notice: 'Work was successfully created.' }
          format.json { render json: @work, status: :created, location: @work }
        else
          format.html { render action: "new" }
          format.json { render json: @work.errors, status: :unprocessable_entity }
        end
      else
        # flash[:notice] = "You do not have enough budget"
        format.html { redirect_to @work, notice: 'You do not have enough budget  .' }

      end
   end
end
  # PUT /works/1
  # PUT /works/1.json
  def update
    @work = Works.find(params[:id])
    respond_to do |format|
      if @work.update_attributes(params[:work])
        format.html { redirect_to @work, notice: 'Work was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url }
      format.json { head :ok }
    end
  end
end
