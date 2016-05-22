class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def create
    @user = User.find(params[:user_id])
    @subjects = @user.subjects

    @subject = current_user.subjects.build(subject_params)
    @subject.user = @user
    @new_subject = Subject.new

    if @subject.save
      flash[:notice] = "Subject was saved."
    else
      flash[:error] = "There was an error. Try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @subject = @user.subjects.find(params[:id])

    if @subject.destroy
      flash[:notice] = "Subject was removed successfully."
    else
      flash[:error] = "Subject couldn't be deleted. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:title)
  end
end
