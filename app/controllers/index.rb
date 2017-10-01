get '/' do
  @questions = Question.all

  case params[:sort]
  when "recent"
    @questions = sort_by_recent(@questions)
    @sort = "recent"
  when "votes"
    @questions = sort_by_votes(@questions)
    @sort = "votes"
  when "trending"
    @questions = sort_by_trending(@questions)
    @sort = "trending"
  else
  end

  erb :'index'
end


