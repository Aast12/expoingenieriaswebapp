class Student < ApplicationRecord
    has_one :user, as: :userable
end
