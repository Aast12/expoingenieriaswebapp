module EditionsHelper

  def edition_options
    get_current_editions.collect do |edition|
      [edition.name, edition.id]
    end
  end

end
