module ReviewsHelper

  def display_header(review)
    if params[:ice_cream_id]
        content_tag(:h1, "Add a Review for #{review.ice_cream.flavor} -  #{review.ice_cream.brand.name}")
    else
      content_tag(:h1, "Create a review")
    end
  end
end
