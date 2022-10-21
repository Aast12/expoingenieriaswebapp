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

  def role
    if committee_member?
      "Miembro del Comité"
    elsif student?
      "Estudiante"
    elsif professor?
      "Professor"
    elsif judge?
      "Juez"
    elsif administrator?
      "Administrador"
    elsif visitor?
      "Visitante"
    elsif staff?
      "Staff"
    else
      "Sin rol"
    end
  end
end
