class JobsController < ApplicationController

  def index
    @jobs = Job.search(params[:search])
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.save

    redirect_to @job
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    @job.update(job_params)
    redirect_to @job
  end

   def destroy
    @job = Job.find(params[:id])

    @job.destroy

    redirect_to jobs_path
  end


private
  def job_params
    params.require(:job).permit(:title, :description, :company_id)
  end

end
