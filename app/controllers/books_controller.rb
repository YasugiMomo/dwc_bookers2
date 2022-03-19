class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    # データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params) 
    # データをデータベースに保存するためのsaveメソッド実行
    book.save
    # booksのindex画面へリダイレクト
    redirect_to '/books'
  end
  
  def show
  end

  def index
  end

  def edit
  end
  
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
