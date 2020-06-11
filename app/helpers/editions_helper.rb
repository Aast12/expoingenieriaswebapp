module EditionsHelper

  def edition_options
    Edition.all.collect{|edition|[edition.name, edition.id]}
  end

end
