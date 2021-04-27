module VirtualSamplesHelper
  def virtual_sample_filter_options
    [
      ['Nombre', :name],
      ['Categoria', :category],
      ['Area Temática', :area],
      ['Profesor', :professor],
      ['Campus', :institution],
      ['Sevicio Social', :social_service],
    ]
  end

  def index_image
    image_tag('NoPicture.png', width: '100%', height: '200px')
  end

  def show_image
    image_tag('NoPicture.png', width: '100%')
  end
end
