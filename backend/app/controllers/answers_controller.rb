class AnswersController < ApplicationController
  before_action :find_answer, only: [:edit, :show, :destroy]

  def index
    answer = Answer.order('created_at DESC').all
    render json: answer.to_json
  end

  def new
    answer = Answer.new
    render json: answer.to_json
  end

  def create
    answer = Answer.new(answer_params)
    answer.question_id = params[:question_id]
    # answer.user_id = params[:question_id]
    answer.save
    render json: answer.to_json
  end

  def edit
    render json: answer.to_json
  end

  def show
    render json: answer.to_json
  end

  def update
    answer = Answer.update_attributes(answer_params)
    render json: answer.to_json
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

end
