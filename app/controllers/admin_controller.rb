class AdminController < ApplicationController
  before_action only: %i[show new] do
    require_permissions
  end

  def show
    @reviews = Review.all
    render 'admin/show'
  end

  def new
    # @review = Review.new
    render 'admin/new'
  end

  def create
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

  def edit
    @review = Review.find(params[:id])
    render 'admin/edit'
  end

  def delete
    @review = Review.find(params[:id])
    render 'admin/delete'
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

  def require_permissions
    current_user

    return if @current_user != nil

    redirect_to login_path
    flash[:danger] = "You do not have the correct permissions for this action"
  end
end
