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
end
