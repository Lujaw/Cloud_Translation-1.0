class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
helper_method :sort_column , :sort_direction

  def index
 #  @tasks                     = Task.where(:status =>"Untranslated" ).paginate(:page => params[:page], :per_page => 10)
    @tasks                     = Task.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end
  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @tasks                     = Task.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tasks }
    end
  end
  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task                      = Task.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end
  # GET /tasks/1/edit
  def edit
    @task                      = Task.find(params[:id])
  end
  # POST /tasks
  # POST /tasks.json
  def create
    @task                      = Task.new(params[:task])
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Translation was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task                      = Task.find(params[:id])
    respond_to do |format|
      @task.worker_id          = current_worker.id
      @task.status             = "Pending"
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Your Translation has been submitted' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task                      = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :ok }
    end
  end
  def change_status
    @task                      = Task.find(params[:id])
     if params[:status] == "Approved"
      @task.Approved           = true
      @task.status             = "Translated"
      @task.save
      @workers                 = Worker.find(@task.worker_id)
      @workers.credit          = @workers.credit  + @task.reward
      @workers.works_completed = @workers.works_completed + 1
      @workers.save
       end
      redirect_to work_path(@task.work_id)
       if params[:status] == "Rejected"
        @task.Approved         = false
        @task.status           = "Untranslated"
        @task.save
        redirect_to work_path(@task.work_id)
    end
  end

private
  def sort_column
   Task.column_names.include?(params[:sort]) ? params[:sort] : "content"
  end

def sort_direction
   %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end










