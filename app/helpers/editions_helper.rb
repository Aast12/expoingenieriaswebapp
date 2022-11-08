module EditionsHelper

  def edition_options
    get_current_editions.collect do |edition|
      [edition.name, edition.id]
    end
  end

  def all_edition_options
    Edition.all.collect do |edition|
      [edition.name, edition.id]
    end
  end
end
