require "sinatra"
require 'data_mapper'
require 'rack-flash'
require 'byebug'
require 'sinatra/base'

require_relative 'data_mapper_setup'

class TwentyQuestions < Sinatra::Base

  use Rack::Flash
  enable :sessions

  #This will allow us to use a new method in our server file, 'delete'
  use Rack::MethodOverride

  #tells you where your views are..
  set :views, Proc.new { File.join(root, "", "views") }

  #tells application where the public folder is
  set :public_folder, './app/public'

  #line below allows you to encypt a cookie
  set :session_secret, 'super secret'




  get '/' do
    @questionaires = Questionaire.all
    erb :index
  end

  get '/questionaire/new' do
    @questionaires = Questionaire.all
    erb :'questionaire/new'
  end

  post '/questionaire' do
    @questionaires = Questionaire.all
    Questionaire.create(name: params['questionaireName'])
    erb :'questionaire/new'
  end

   get '/questionaire/delete' do
    Questionaire.destroy
    redirect to('/questionaire/new')
  end

  get '/questions/new' do
    @questionaires = Questionaire.all
    erb :'questions/new'
  end

  post '/questions/setup' do
    #if @chosenQuestionaire has a space word gets truncated
    session['questionaireID'] = params['questionaireID']
    @chosenQuestionaire = Questionaire.get(session['questionaireID']).name
    @questions = Question.all
    erb :'questions/new'
  end

  post '/questions' do
    params['mandatory'] == "Yes" ? mandatory = true : mandatory = false
    #if default is not populated we have issues
    params['default'] == "" ? default = " " : default = params['default']
    byebug
    Question.create(
      text: params['questionText'],
      answerType: params['answerType'],
      default: default,
      mandatory: mandatory,
      questionaire_id: session['questionaireID'])
    @questions = Question.all
    @chosenQuestionaire = Questionaire.get(session['questionaireID']).name
    erb :'questions/new'
  end

  post '/answers/new' do
    erb :'answers/new'
  end

  get '/answers/view' do
    erb :'answers/view'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

