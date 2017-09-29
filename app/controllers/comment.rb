post '/comments/new' do
  @answer = Answer.find(params[:answer_id])
  p "Answer is #{@answer}"
  @comment = @answer.comments << Comment.new(comment_text: params["comment_text"], poster_id: current_user.id)
  p "Comment is #{@comment}"
  p "Text is comment_text"
  if request.xhr?
   if @comment.save
      erb :'questions/_display_answer',  locals: {answer: @answer}, layout: false
    end
  else
    if @comment.save
      redirect "/questions/#{@answer.question_id}"
    end
  end
end
