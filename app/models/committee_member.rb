class CommitteeMember < ApplicationRecord
    has_one :user, as: :userable
    
    def has_user?
        User.first.present?
    end

    def get_user
        User.find(self.user_id)
    end

end
