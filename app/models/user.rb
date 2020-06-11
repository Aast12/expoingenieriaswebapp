class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :userable, polymorphic: true
  belongs_to :institution
  belongs_to :edition

  def full_name
    self.first_name + " " + self.last_name
  end

  def student?
    self.userable_type == "Student"
  end

  def professor?
    self.userable_type == "Professor"
  end

  def committee_member?
    self.userable_type == "CommitteeMember"
  end

  def operative?
    self.userable_type == "Operative"
  end

  def judge?
    self.userable_type == "Judge"
  end

  def administrator?
    self.userable_type == "Administrator"
  end
end
