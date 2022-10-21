module UsersHelper
  def userable_type_options
    [["Estudiante", "Student"],["Profesor","Professor"],["Miembro del Comité","CommitteeMember"], ["Miembro de Staff","StaffMember"],["Evaluador", "Judge"],["Administrador", "Administrator"], ["Visitante", "Visitor"]]
  end
end
