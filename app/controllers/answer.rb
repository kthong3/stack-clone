post '/answers/new' do
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
