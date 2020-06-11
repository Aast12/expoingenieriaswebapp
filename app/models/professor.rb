class Professor < ApplicationRecord
    has_one :user, as: :userable
end
