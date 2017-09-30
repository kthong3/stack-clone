post '/questions/:id/votes' do
  authenticate!

  @question = Question.find(params[:id])

  if params[:vote_value] == "1"
    @question.up_vote(current_user.id)
  else
     @question.down_vote(current_user.id)
  end

  if request.xhr?
    erb :'questions/_display_question_vote_count',  locals: {question: @question}, layout: false
  else
    redirect "/questions/#{params[:id]}"
  end
end

post '/answers/:id/votes' do
  authenticate!

  @answer = Answer.find(params[:id])

  if params[:vote_value] == "1"
    @answer.up_vote(current_user.id)
  else
    @answer.down_vote(current_user.id)
  end

  if request.xhr?
    erb :'questions/_display_answer_vote_count',  locals: {answer: @answer}, layout: false
  else
    redirect "/questions/#{@answer.question_id}"
  end
end
