class Post < ApplicationRecord
    belongs_to :topic, required: true
    belongs_to :user, required: true
    has_many :comments, dependent: :destroy

    default_scope { order('created_At DESC') }

    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true
end
