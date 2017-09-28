User.create(username: "byzantinist", email: "red_panda@gmail.com", first_name: "Eric", last_name: "Chiang", hashed_password: "byzantinist")
User.create(username: "victoriajeniluc", email: "vikky@gmail.com", first_name: "Vikky", last_name: "Luc", hashed_password: "victoriajeniluc")
User.create(username: "kkelley", email: "kara@kelley.com", first_name: "Kara", last_name: "Kelley", hashed_password: "kkelley")
User.create(username: "kthong3", email: "kthong4@gmail.com", first_name: "Kathiee", last_name: "Thongsakounh", hashed_password: "kthong3")

Question.create(question_text: "How old is Santa Claus?", poster_id: 2)
Question.create(question_text: "What is the cutest animal?", poster_id: 1)
Question.create(question_text: "Did I remember to feed Eleanor today?", poster_id: 3)
Question.create(question_text: "What are we having for lunch today?", poster_id: 4)

Answer.create(answer_text: "Santa Claus is 500 years old", question_id: 1, poster_id: 1)
Answer.create(answer_text: "Of course! That's your only responsibility!", question_id: 3, poster_id: 1)
Answer.create(answer_text: "We are not eating lunch!", question_id: 4, poster_id: 1)


Answer.create(answer_text: "I'm going to say no.", question_id: 3, poster_id: 2)
Answer.create(answer_text: "I Dream of Falafel", question_id: 4, poster_id: 2)
Answer.create(answer_text: "Bunnies", question_id: 2, poster_id: 2)

Comment.create(comment_text: "Santa Claus is totally 30 years old", poster_id: 3)
Comment.create(comment_text:"Who is Eleanor?", poster_id: 4)

Vote.create(up_down_vote: -1, poster_id: 2)
Vote.create(up_down_vote: 1, poster_id: 1)
