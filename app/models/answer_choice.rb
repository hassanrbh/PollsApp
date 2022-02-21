# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  question_id :integer          not null
#  text        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class AnswerChoice < ApplicationRecord
    # ? Validations
    validates :question_id, presence: true
    validates :text, presence: true

    # ! Association :> Question::question
    belongs_to :question,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: 'Question'
    # ! Association :> Response:responses
    has_many :responses,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name: 'Response'
end
