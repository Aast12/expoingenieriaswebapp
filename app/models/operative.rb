class Operative < ApplicationRecord
    has_one :user, as: :userable
end
