class CommitteeMember < ApplicationRecord
    has_one :user, as: :userable
    
    def has_user?
        User.first.present?
    end

    def get_user
        User.find(self.user_id)
    end

    def professor_or_judge_or_committee_member? 
        self.get_user.professor? or self.get_user.judge? or self.get_user.committee_member?
    end
end
