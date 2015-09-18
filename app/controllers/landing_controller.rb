class LandingController < ApplicationController

  layout false

  def index
    redirect_to books_path( current_user ) if current_user
  end
end