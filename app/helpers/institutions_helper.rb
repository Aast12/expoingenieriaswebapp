module InstitutionsHelper
  def institution_options
    Institution.all.collect { |institution| [ institution.name, institution.id ] }
  end
end
