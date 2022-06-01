class SecondaryProfessor < ApplicationRecord
    belongs_to :professor
    belongs_to :project
  
end
