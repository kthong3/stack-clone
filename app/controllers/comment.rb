post '/comments/new' do
  authenticate!
  @answer = Answer.find(params[:answer_id])
  p "Answer is #{@answer}"
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
