class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # 投稿したデータにログイン中のユーザーのIDを持たせる
    @book.user_id = current_user.id
    # データをデータベースに保存するためのsaveメソッド実行
    @book.save
    # booksのindex画面へリダイレクト
    redirect_to books_path
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
