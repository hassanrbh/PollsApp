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

    def completed_polls
        # returm polls where the user has not answered all of the question in the poll
        
    end
end
