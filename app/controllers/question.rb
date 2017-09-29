get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

post '/questions/new' do
  authenticate!

  @questions = Question.all
  @question = Question.new(question_text: params["question_text"], poster_id: current_user.id)
  if request.xhr?
   if @question.save
      erb :'questions/_display_question',  locals: {question: @question}, layout: false
    end
  else
    if @question.save
      erb :index
    end
  end
end

post '/questions/:id/comments/new' do
  authenticate!
  @question = Question.find(params[:question_id])
  @comment = Comment.new(comment_text: params["comment_text"], poster_id: current_user.id)
  if request.xhr?
   if @comment.save
    @question.comments << @comment
    erb :'questions/_display_new_comment',  locals: {comment: @comment}, layout: false
    end
  else
    if @comment.save
      @question.comments << @comment
      redirect "/questions/#{@question.id}"
    end
  end
end
