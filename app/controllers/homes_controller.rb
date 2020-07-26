class HomesController < ApplicationController

  def top
  end

  def index
  	  @book = Book.new
  	  @books = Book.all
  end

  def show
  	@book = Book.find(params[:id])
  end

  def create
		@book = Book.new(book_params)
		@books = Book.all
		if @book.save
		redirect_to home_path(@book.id), notice:"Book was successfully created."
		else
        render homes_index_path
        end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	  @book = Book.find(params[:id])
  	  if @book.update(book_params)
  	  redirect_to home_path(@book.id), notice:"Book was successfully updated."
     else
      render :edit
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to homes_index_path
  	end


	private
	def book_params
		params.require(:book).permit(:title, :body)
	end

end
