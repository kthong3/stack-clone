post '/questions/:id/votes' do
  @question = Question.find(params[:id])

  if params[:vote_value] == "1"
    @question.up_vote(current_user.id)

    if request.xhr?
      # content_type :json
      # {count: @question.total_vote_count}.to_json
      erb :'questions/_display_vote_count',  locals: {question: @question}, layout: false
    else
      redirect "/questions/#{params[:id]}"
    end

  else
    @question.down_vote(current_user.id)

    if request.xhr?
      erb :'questions/_display_vote_count',  locals: {question: @question}, layout: false
    else
      redirect "/questions/#{params[:id]}"
    end
  end
end

post '/answers/:id/votes' do
  @answer = Answer.find(params[:id])

  if params[:vote_value] == "1"
    @answer.up_vote(current_user.id)

    if request.xhr?
      erb :'questions/_display_answer_vote_count',  locals: {answer: @answer}, layout: false
    else
      redirect "/questions/#{@answer.question_id}"
    end

  else
    @answer.down_vote(current_user.id)

    if request.xhr?
      erb :'questions/_display_answer_vote_count',  locals: {answer: @answer}, layout: false
    else
      redirect "/questions/#{@answer.question_id}"
    end
  end
end
