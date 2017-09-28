get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

post '/questions/new' do
  @questions = Question.all
  @question = Question.new(question_text: params["question_text"], poster_id: current_user.id)
  if request.xhr?
   if @question.save
      erb :'questions/_display_form',  locals: {question: @question}, layout: false
    end
  else
    if @question.save
      erb :index
    end
  end
end
