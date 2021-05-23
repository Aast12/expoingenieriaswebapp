class Comment < ApplicationRecord
    belongs_to :virtual_sample
    belongs_to :user
    validates :body, presence: true, allow_blank: false
end
