class AdminController < ApplicationController
  before_action only: %i[show new] do
    require_permissions
  end

  def show
    @reviews = Review.all
    render 'admin/show'
  end

  def new
    render 'admin/new'
  end

  def create
    # This is not the final implementation -
    # Refer to 'RUBY ON RAILS TUTORIAL' for further details (search for text)
    @review = Review.new(review_params)

    @review.thumbnail_image.attach(params[:thumbnail_image])
    @review.main_image.attach(params[:main_image])

    if @review.save
      # Handle a successful save.
      flash[:success] = "Review created"
      @reviews = Review.all
      render 'admin/show'
    else
      render 'show', status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
    render 'admin/edit'
  end

  def edit_review
    review = Review.find(params[:id])
    review.update(
      title: params[:review][:title],
      medium: params[:review][:medium],
      author: params[:review][:author],
      publisher: params[:review][:publisher],
      director: params[:review][:director],
      actors: params[:review][:actors],
      country: params[:review][:country],
      venue: params[:review][:venue],
      writer: params[:review][:writer],
      artist: params[:review][:artist],
      label: params[:review][:label],
      text: params[:review][:text],
      running_time: params[:review][:running_time],
      date_publication: params[:review][:date_publication],
      date_release: params[:review][:date_release],
      date_opening: params[:review][:date_opening],
      date_closing: params[:review][:date_closing],
      date_event: params[:review][:date_event],
      caption: params[:review][:caption],
      thumbnail_image: params[:review][:thumbnail_image],
      main_image: params[:review][:main_image]
    )

    flash[:success] = "Review edited"
    @reviews = Review.all
    render 'admin/show'
  end

  def delete
    @review = Review.find(params[:id])
    render 'admin/delete'
  end

  def destroy
    Review.find(params[:id]).destroy!
    flash[:success] = "Review deleted"
    redirect_to admin_url
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
