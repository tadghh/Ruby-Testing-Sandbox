class SubmissionsController < ApplicationController
  before_action :set_submission, only: %i[edit show update destroy]
  def index
    @submissions = Submission.all
  end

  def new
    @submission = Submission.new
  end

  def edit
    @submission = submis
  end

  def show; end

  def create
    @submission = Submission.new(submission_params)
    respond_to do |format|
      if @submission.save
        format.html { redirect_to @submission, notice: 'Submission was created' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @submission.destroy
    respond_to do |format|
      format.html(redirect_to(submissions_url, notice: 'Submission was deleted'))
    end
  end

  private

  def set_submission
    @submission = Submission.find(params[:id])
  end

  def submission_params
    params.require(:submission).permit(:title, :body)
  end
end
