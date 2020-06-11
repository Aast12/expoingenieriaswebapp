class StaffMember < ApplicationRecord
    has_one :user, as: :userable
end
