class FilterController < ApplicationController
  def filter_options
    filter_type = params[:filter_type]
    filter_options = FilterOptions.new
    options = filter_options.get_options(filter_type)
    render :json => options
  end
end