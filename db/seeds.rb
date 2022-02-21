# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ! User Model :
hassan = User.create(:username => "hassan")
aya = User.create(:username => "aya")
salman = User.create(:username => "salman")
marwa = User.create(:username => "marwa")
hidaya = User.create(:username => "hidaya")
hind = User.create(:username => "hind")
# ! Poll : 
poll_1 = Poll.create(:author_id => hassan.id, title: 'Poll one')
poll_2 = Poll.create(:author_id => aya.id, title: 'Poll two')
poll_3 = Poll.create(:author_id => salman.id, title: 'Poll three')
poll_4 = Poll.create(:author_id => marwa.id, title: 'Poll four')
poll_5 = Poll.create(:author_id => hidaya.id, title: 'Poll five')
poll_6 = Poll.create(:author_id => hind.id,title: 'Poll six')
# ! Question :
question_1 = Question.create(:poll_id => poll_1.id,:text => 'Who is the best programming language')
question_2 = Question.create(:poll_id => poll_2.id,:text => 'who is the worst programming language')
question_3 = Question.create(:poll_id => poll_3.id,:text => 'Who is the fastest protocol')
question_4 = Question.create(:poll_id => poll_4.id,:text => 'who is finnest me or your mom :)')
question_5 = Question.create(:poll_id => poll_5.id,:text => 'who you love the most')
question_6 = Question.create(:poll_id => poll_6.id,:text => 'Who is the world leader')
# ! AnswerChoice :
answer_1 = AnswerChoice.create(:question_id => question_1.id,:text => 'python or ruby')
answer_2 = AnswerChoice.create(:question_id => question_2.id,:text => 'pythor or c or c++ or ruby')
answer_3 = AnswerChoice.create(:question_id => question_3.id,:text => 'TCP or UDP')
answer_4 = AnswerChoice.create(:question_id => question_4.id,:text => 'me , your mom')
answer_5 = AnswerChoice.create(:question_id => question_5.id,:text => 'me or your grandpa')
answer_6 = AnswerChoice.create(:question_id => question_6.id,:text => 'VPN or Network Attacks')
# ! Response :
response_1 = Response.create(:user_id => hassan.id , :answer_choice_id=> answer_1.id)
response_2 = Response.create(:user_id => aya.id, :answer_choice_id=> answer_2.id)
response_3 = Response.create(:user_id => salman.id, :answer_choice_id=> answer_3.id)
response_4 = Response.create(:user_id => marwa.id, :answer_choice_id=> answer_4.id)
response_5 = Response.create(:user_id => hidaya.id, :answer_choice_id=> answer_5.id)
response_6 = Response.create(:user_id => hind.id, :answer_choice_id=> answer_6.id)