class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  #belongs_to :userable, polymorphic: true
  belongs_to :institution, optional: true
  has_many :comments
  has_many :students
  has_many :professors
  has_many :committee_members
  has_many :judges
  has_many :administrators
  has_many :visitors
  has_many :staff_members

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

  def visitor?
    self.is_visitor
  end

  def staff?
    self.is_staff_member
  end

  def committee_member_pending_approval?
    professor? or judge? and !committee_member?
  end

  def judge_or_professor_pending_approval?
    if professor?
      professor = self.professors.first
      return (professor and not professor.approved)
    elsif judge?
      judge = self.judges.first
      return (judge and not professor.approved)
    end
    false
  end

  def pending_approval?
    return committee_member_pending_approval? or judge_or_professor_pending_approval?
  end

  def role
    roles = []

    roles.append("Estudiante") if student?
    roles.append("Miembro del Comité") if committee_member?
    roles.append("Professor") if professor?
    roles.append("Juez") if judge?
    roles.append("Administrador") if administrator?
    roles.append("Visitante") if visitor?
    roles.append("Staff") if staff?

    roles.join(', ')
  end
end
