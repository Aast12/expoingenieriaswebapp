class Visitor < ApplicationRecord
    has_one :user, as: :userable
end
