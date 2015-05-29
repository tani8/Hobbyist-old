class QuestionsController < ApplicationController
  before_action :find_question, only: [:edit, :show, :destroy]
  before_action :restrict_access, except: [:index, :show]

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
    render json: @question
  end

  def show
    answer = Answer.new
    answers = @question.answers.order('created_at DESC').all
    render json: answers
  end

  def update
    # if
    @question.update_attributes(question_params)
    #   redirect_to '/'
    # else
      # render 'edit'
    # end
    render json: @question
  end

  def destroy
    @question.destroy
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end
end
