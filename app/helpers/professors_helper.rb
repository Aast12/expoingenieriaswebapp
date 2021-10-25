module ProfessorsHelper
  def professor_options

    Professor.all.collect { |professor| [ professor.user.full_name, professor.id ] }

  end
end
