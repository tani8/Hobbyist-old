class AnswersController < ApplicationController
  before_action :find_answer, only: [:edit, :show, :destroy]
  before_action :restrict_access, except: :index

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
    render json: answer
  end

  def show
    render json: answer
  end

  def update
    answer = Answer.update_attributes(answer_params)
    render json: answer
  end

  def destroy
    answer.destroy
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end

  def find_answer
    answer = Answer.find(params[:id])
  end

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end

end
