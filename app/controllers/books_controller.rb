class BooksController < ApplicationController


  def create
    @list = Book.new(book_params)
     if @list.save
       flash[:notice] = "Book was successfully created."
       redirect_to book_path (@list.id)
     else
       @books=Book.all
       render :index

     end
  end

  def index
    @list=Book.new
    @books = Book.all
  end


  def show
    @list= Book.find(params[:id])
     @list.save
      

  end



  def edit
    @list= Book.find(params[:id])
    @list.save
  end




  def update
        @list = Book.find(params[:id])
        @list.update(book_params)
    if  @list. save
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(@list.id)
    else
        render :edit
    end
  end



  def destroy
    list = Book.find(params[:id])
    list.destroy
    redirect_to books_path
  end



  private
  # ストロングパラメータ
   def book_params
    params.require(:book).permit(:title, :body)
   end
   end
