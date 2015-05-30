class QuestionsController < ApplicationController
  before_action :find_question, only: [:edit, :show, :destroy]
  before_action :authenticate_user_from_token!, only: [:edit, :destroy]

  def index
    questions = Question.order('created_at DESC').all
    # headers = { "User-Agent" => "StacksOnStacks",
    #             "Authorization" => ENV['GITHUB_KEY']}
    render json: questions
  end

  def create
    question = Question.new(question_params)
    question.hobby_id = params[:hobby_id]
    # question.user_id = something
    question.save
    render json: question
  end

  def new
    question = Question.new
    render json: question
  end

  def edit
    if compare_user?
      render json: @question
    else
      render json: {errors: 'Unauthorized request'}, status: 401
    end
  end

  def show
    answers = @question.answers.order('created_at DESC').all
    render json: answers
  end

  def update
    @question.update_attributes(question_params)
    render json: @question
  end

  def destroy
    if @question
      if compare_user?
        @question.destroy
      else
        render json: {errors: 'Unauthorized request'}, status: 401
      end
    else
      render json: {errors: 'Bad Request'}, status: 400
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end

  def find_question
    @question = Question.where(id: params[:id]).first
  end

  def compare_user?
    question = Question.find(params[:id])
    creator_id = question.user_id
    auth_token = request.headers['Authorization']
    creator_id == auth_token[0].to_i
  end
end
