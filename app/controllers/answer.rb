post '/answers/new' do
  authenticate!

  @answer = Answer.new(answer_text: params["answer_text"], poster_id: current_user.id, question_id: params[:question_id])
  if request.xhr?
   if @answer.save
      erb :'questions/_display_answer',  locals: {answer: @answer}, layout: false
    end
  else
    if @answer.save
      redirect "/questions/#{params[:question_id]}"
    end
  end
end

post '/answers/:id/comments/new' do
  authenticate!
  @answer = Answer.find(params[:answer_id])
  @comment = Comment.new(comment_text: params["comment_text"], poster_id: current_user.id)
  if request.xhr?
   if @comment.save
    @answer.comments << @comment
    erb :'questions/_display_new_comment',  locals: {comment: @comment}, layout: false
    end
  else
    if @comment.save
      @answer.comments << @comment
      redirect "/questions/#{@answer.question_id}"
    end
  end
end

### ADD AN AUTHORIZATION FOR GET & PUT& DELETE VERBS
get '/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  erb :'answers/edit'
end

put '/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.assign_attributes(answer_text: params[:answer_text])

  if @answer.save
    redirect "questions/#{@answer.question_id}"
  end
end

delete '/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect "questions/#{@answer.question_id}"
end
