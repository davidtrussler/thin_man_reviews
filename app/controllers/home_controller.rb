class HomeController < ApplicationController
  def show
    @reviews = Review.all
  end
end
