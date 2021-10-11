class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #belongs_to :userable, polymorphic: true
  belongs_to :institution
  has_many :comments
  has_many :students

  def full_name
    self.first_name + " " + self.last_name
  end

  def student?
    self.is_student
  end

  def professor?
    self.is_professor
  end

  def committee_member?
    self.is_committee_member
  end

  def judge?
    self.is_judge
  end

  def administrator?
    self.is_admin
  end

end
