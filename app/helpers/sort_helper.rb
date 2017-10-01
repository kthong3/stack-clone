module SortHelper
  def sort_by_recent(questions)
    questions.sort_by { |question| question.updated_at }
    questions.reverse
  end

  def sort_by_votes(questions)
    question_array_with_votes = []
    questions.each { |question| question_array_with_votes << [question, question.total_vote_count] }
    question_array_with_votes.sort_by!(&:last)
    output_array = []
    question_array_with_votes.reverse.each { |question_array| output_array << question_array[0]}
    output_array
  end

  def sort_by_trending(questions)
    question_array_with_trends = []
    questions.each { |question| question_array_with_trends << [question, question.answers.count + question.comments.count] }
    question_array_with_trends.sort_by!(&:last)
    output_array = []
    question_array_with_trends.reverse.each { |question_array| output_array << question_array[0]}
    output_array
  end
end

helpers SortHelper