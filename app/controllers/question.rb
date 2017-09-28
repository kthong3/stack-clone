get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

post '/questions/new' do
  p params["question_text"]
  @questions = Question.all
  @question = Question.new(question_text: params["question_text"])
  p @question
  if request.xhr?
    erb :index, layout: false
  else
    p "It didn't work at all"
    erb :index
  end
end
