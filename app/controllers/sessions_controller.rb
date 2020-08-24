class SessionsController < ApplicationController
  def new; end

  def create
    render :new if params[:nickname].blank? || params[:nickname].length > 20

    session[:nickname] = params[:nickname]
    redirect_to books_path
  end
end
