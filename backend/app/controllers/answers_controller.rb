class AnswersController < ApplicationController
  before_action :find_answer, only: [:edit, :show, :destroy]
  before_action :authenticate_user_from_token!, only: [:edit, :destroy]

  def index
    answer = Answer.order('created_at DESC').all
    render json: answer
  end

  def new
    answer = Answer.new
    render json: answer
  end

  def create
    answer = Answer.new(answer_params)
    answer.question_id = params[:question_id]
    # answer.user_id = params[:question_id]
    answer.save
    render json: answer
  end

  def edit

    return render json: @answer if compare_user?
    render json: {errors: 'Unauthorized request'}, status: 401

  end

  def show
    render json: @answer
  end

  def update
    answer = Answer.update_attributes(answer_params)
    render json: @answer
  end

  def destroy
    if @answer
      if compare_user?
        @answer.destroy
      else
        render json: {errors: 'Unauthorized request'}, status: 401
      end
    else
      render json: {errors: 'Bad Request'}, status: 400
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def compare_user?
    answer = Answer.find(params[:id])
    creator_id = answer.user_id
    auth_token = request.headers['Authorization']
    creator_id == auth_token[0].to_i
  end

end
