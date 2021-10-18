class Professor < ApplicationRecord
    #validates :department, presence: true
    has_one :user, as: :userable
end
