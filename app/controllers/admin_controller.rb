class AdminController < ApplicationController
  def show
    render 'show'
  end

  def new
    # @review = Review.new
    render 'admin/new'
  end

  def create
    # debugger

    @review = Review.new(review_params) # Not the final implementation!

    @review.thumbnail_image.attach(params[:thumbnail_image])
    @review.main_image.attach(params[:main_image])

    if @review.save
      # Handle a successful save.
      render 'show'
    else
      render 'show', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.permit(
      :title,
      :medium,
      :author,
      :publisher,
      :director,
      :actors,
      :country,
      :venue,
      :writer,
      :artist,
      :label,
      :text,
      :running_time,
      :date_publication,
      :date_release,
      :date_opening,
      :date_closing,
      :date_event,
      :caption,
      :thumbnail_image,
      :main_image
    )
  end
end
