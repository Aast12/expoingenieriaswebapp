class CommitteeMember < ApplicationRecord
    has_one :user, as: :userable
end
