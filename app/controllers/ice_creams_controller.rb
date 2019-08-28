class IceCreamsController < ApplicationController
  before_action :set_ice_cream, only:[:show, :edit, :update]
  before_action :redirect_if_not_logged_in

  def new
    @ice_cream = IceCream.new
    @ice_cream.build_brand
  end

  def create
     @ice_cream = IceCream.new(ice_cream_params)
     @ice_cream.user_id = session[:user_id]

    if @ice_cream.save #this is where validations happen
      @ice_cream.image.purge
      @ice_cream.image.attach(params[:ice_cream][:image])
      redirect_to ice_cream_path(@ice_cream)
    else
      @ice_cream.build_brand
      render :new
    end
  end

  def index
    @ice_creams = IceCream.order_by_rating.includes(:brand)
  end

  def show
  end

  def edit
  end

  def update
    if @ice_cream.update(ice_cream_params)
      redirect_to ice_cream_path(@ice_cream)
    else
      render :edit
    end
  end

  private

  def ice_cream_params
    params.require(:ice_cream).permit(:flavor, :description, :brand_id, brand_attributes: [:name])
  end

  def set_ice_cream
     @ice_cream = IceCream.find_by_id(params[:id])
     redirect_to ice_creams_path if !@ice_cream
  end

end
