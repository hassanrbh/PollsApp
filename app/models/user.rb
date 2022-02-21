# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    # ? Validations
    validates :username, presence: true, uniqueness: true

    # ! Association :> Polls::authored_polls
    has_many :authored_polls,
        class_name: 'Poll',
        primary_key: :id,
        foreign_key: :author_id
    # ! Association :> Responses::responses
    has_many :responses,
        class_name: 'Response',
        primary_key: :id,
        foreign_key: :user_id
        
    # Bonus: More methods

    # returm polls where the user has not answered all of the question in the poll
    def completed_polls
        query = Poll.find_by_sql([<<-SQL, id])
        SELECT 
            polls.*
        FROM
            polls
        INNER JOIN questions
            ON polls.id = questions.poll_id
        INNER JOIN answer_choices
            ON answer_choices.question_id = questions.id 
        LEFT OUTER JOIN (
            SELECT
                * 
            FROM 
                responses
            WHERE
                responses.user_id = ?
        ) AS responses ON responses.answer_choice_id = answer_choices.id
        GROUP BY polls.id
        HAVING 
            COUNT(DISTINCT questions.id) = COUNT(responses.*) 
        SQL
        query
    end
    def completed_polls_active_record
        joins = <<-SQL
        LEFT OUTER JOIN (
            SELECT
                *
            FROM 
                responses
            WHERE 
                responses = #{self.id}
        ) AS responses ON responses.answer_choice_id = answer_choices.id
        SQL
        active_record_query = Poll
            .joins(questions: :answer_choices)
            .joins(joins)
            .group("polls.id")
            .having("COUNT(DISTINCT questions.id) = COUNT(responses.*)")
    end
end