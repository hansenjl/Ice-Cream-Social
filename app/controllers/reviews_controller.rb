class ReviewsController < ApplicationController

  def new
    if @ice_cream = IceCream.find_by_id(params[:ice_cream_id])
      @review = @ice_cream.reviews.build
    else
      @review = Review.new
    end
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
    @review = Review.find_by_id(params[:id])
  end

  def index
    #how do i check if it's nested & a valid id
    if @ice_cream = IceCream.find_by_id(params[:ice_cream_id])
      #nested
      @reviews = @ice_cream.reviews
    else
      #it's not nested
      @reviews = Review.all
    end
  end

  private

  def review_params
      params.require(:review).permit(:ice_cream_id, :content, :stars, :title)
  end




end
