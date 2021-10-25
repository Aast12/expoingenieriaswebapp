class Professor < ApplicationRecord
    #validates :department, presence: true
    belongs_to :user
end
