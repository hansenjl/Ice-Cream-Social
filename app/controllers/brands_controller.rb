class BrandsController < ApplicationController

  def index
    @brands = Brand.all
  end

end
