class ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @review = Review.new()
  end

  def create
    @review = Review.new(params.require(:review).permit(:member_id, :route_id, :starRating, :textReview))
    if @review.save
      redirect_to route_path(@review.route_id)
    else
      render('new')
    end
  end

  def update
  end

  def edit
  end
end
