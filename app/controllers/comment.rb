post '/comments/new' do
  authenticate!
  @answer = Answer.find(params[:answer_id])
  p "Answer is #{@answer}"
  @comment = Comment.new(comment_text: params["comment_text"], poster_id: current_user.id)
  p "Comment is #{@comment}"
  p "Text is comment_text"
  if request.xhr?
   if @comment.save
    @answer.comments << @comment
    erb :'questions/_display_comment',  locals: {answer: @answer}, layout: false
    end
  else
    if @comment.save
      redirect "/questions/#{@answer.question_id}"
    end
  end
end
