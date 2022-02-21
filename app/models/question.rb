# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  poll_id    :integer          not null
#  text       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord
    # ? Validations
    validates :poll_id, presence: true
    validates :text, presence: true, uniqueness: true

    # ! Association :> Poll::poll
    belongs_to :poll,
        class_name: 'Poll',
        primary_key: :id,
        foreign_key: :poll_id
    # ! Association :> AnswerChoices::answer_choices
    has_many :answer_choices,
        class_name: 'AnswerChoice',
        primary_key: :id,
        foreign_key: :question_id
    # ! Association :> Response::responses
    has_many :responses,
        through: :answer_choices,
        source: :responses
    
    # * Poll Results
    def results_n_one_query
        # A N+1 query
        cashed_query = self.answer_choices

        finished = {}

        cashed_query.each do |result|
            finished[result.text] = result.responses.count
        end
        finished
    end

    def results
        # A no N+1 query
        results = self.answer_choices.includes(:responses)

        finished = {}
        results.each do |result|
            finished[result.text] = result.responses.length
        end
        finished
    end

    def results_query
        query = AnswerChoice.find_by_sql([<<-SQL, id])
        SELECT
            answer_choices.*, COUNT(responses.id) as num_responses
        FROM 
            answer_choices
        WHERE
            answer_choices.question_id = ?
        LEFT OUTER JOIN responses
            ON answer_choices.id = responses.answer_choice_id
        GROUP BY answer_choices.id
        SQL

        query.inject({}).each do |results, item|
            results[item.text] = item.num_responses; results 
        end
    end

    def results_query_active_record
        query = self.answer_choices
            .select("answer_choices.*, COUNT(responses.id) as number_responses")
            .left_outer_joins(:responses)
            .group('answer_choices.id')
            
        query.inject({}).each do |results,item|
            results[item.text] = item.number_responses; results
        end
    end
end
