# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#
class Response < ApplicationRecord
    # ? Validations
    validates :user_id, presence: true
    validates :answer_choice_id, presence: true
    #validate(:not_duplicate_response)

    # ! Association :> User::user
    belongs_to :user,
        class_name: 'User',
        primary_key: :id,
        foreign_key: :user_id
    # ! Association :> AnswerChoice::answer_choice
    belongs_to :answer_choice,
        class_name: 'AnswerChoice',
        primary_key: :id,
        foreign_key: :answer_choice_id
    # ! Association :> Question::question
    has_one :question,
        through: :answer_choice,
        source: :question

    def sibling_responses
        self.question.responses.where.not(id: self.id)
    end
    def respondent_already_responses
        sibling_responses.exists?(user_id: self.user_id)
    end

    # * Author Can't Respond to own Poll
    def not_duplicate_response
        poll_author_id = Poll
            .joins(questions: :answer_choices)
            .where("answer_choices.id = ?", self.answer_choice_id)
            .pluck("polls.author_id")
            .first

        if poll_author_id == self.user_id
            errors[:user_id] << 'Sir your are not allowed to respond to your own poll'
        end
    end
end
