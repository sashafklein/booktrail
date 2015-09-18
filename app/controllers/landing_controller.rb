class LandingController < ApplicationController

  layout false

  def index
    redirect_to user_books_path( current_user ) if current_user
  end
end