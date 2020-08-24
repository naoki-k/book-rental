class BooksController < ApplicationController
  rescue_from Commands::ValidationError, with: :redirect_to_index

  before_action :require_nickname
  before_action :set_book, only: %i(show edit update rent return destory)

  include Commands::Execute
  include StreamHelper

  def index
    @books = ::Book.alive.page(params[:page])
  end

  def show
    @events = read_stream("Domain::Book#{@book.uid}")
  end

  def new
    @book = ::Book.new
  end

  def edit; end

  def create
    data = book_params
    data[:uid] = Services::UniqueIdGenerator.generate
    data[:nickname] = session[:nickname]
    cmd = Commands::Books::CreateBook.new(data)
    execute(cmd)
    redirect_to books_url
  end

  def update
    data = book_params
    data[:status] = @book.status
    data[:uid] = @book.uid
    data[:nickname] = session[:nickname]
    cmd = Commands::Books::EditBook.new(data)
    execute(cmd)
    redirect_to books_url
  end

  def rent
    data = @book.attributes.with_indifferent_access.slice(:uid, :title, :author, :summary, :status)
    data[:nickname] = session[:nickname]
    cmd = Commands::Books::RentBook.new(data)
    execute(cmd)
    redirect_to books_url
  end

  def return
    data = @book.attributes.with_indifferent_access.slice(:uid, :title, :author, :summary, :status)
    data[:nickname] = session[:nickname]
    cmd = Commands::Books::ReturnBook.new(data)
    execute(cmd)
    redirect_to books_url
  end

  def destroy
    cmd = Commands::Books::DeleteBook.new(uid: @book.uid)
    execute(cmd)
    redirect_to books_url
  end

  private

  def set_book
    @book = ::Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :summary)
  end

  def error_messages(error)
    error&.message&.full_messages&.join("\n")
  end

  def redirect_to_index
    redirect_to books_path
  end

  def require_nickname
    redirect_to root_path if session[:nickname].blank?
  end
end
