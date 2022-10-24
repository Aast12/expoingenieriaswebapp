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
    roles = []

    if committee_member?
      roles.append("Miembro del Comité")
    elsif student?
      roles.append("Estudiante")
    elsif professor?
      roles.append("Professor")
    elsif judge?
      roles.append("Juez")
    elsif administrator?
      roles.append("Administrador")
    elsif visitor?
      roles.append("Visitante")
    elsif staff?
      roles.append("Staff")
    end
    
    roles.join(', ')
  end
end
