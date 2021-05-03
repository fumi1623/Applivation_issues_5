class FavoritesController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.new(user_id: current_user.id) #←非同期通信用の記述
    # favorite = current_user.favorites.new(book_id: book.id) #元の記述
    favorite.save
    # redirect_back fallback_location: @book
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.find_by(user_id: current_user.id) #←非同期通信用の記述
    # favorite = current_user.favorites.find_by(book_id: book.id)  #元の記述
    favorite.destroy
    # redirect_back fallback_location: @book
  end

end
