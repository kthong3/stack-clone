post '/questions/:id/votes' do
  @question = Question.find(params[:id])
  if params[:vote_value] == "1"
    @question.up_vote(current_user.id)
    redirect "/questions/#{params[:id]}"
  else
    @question.down_vote(current_user.id)
    redirect "/questions/#{params[:id]}"
  end
end
