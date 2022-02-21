# == Schema Information
#
# Table name: polls
#
#  id         :bigint           not null, primary key
#  author_id  :integer          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Poll < ApplicationRecord
    # ? Validations
    validates :author_id, presence: true
    validates :title, presence: true

    # ! Association :> User::author
    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: 'User'
    # ! Association :> Question::questions
    has_many :questions,
        primary_key: :id,
        foreign_key: :poll_id,
        class_name: 'Question'
    
    
end
