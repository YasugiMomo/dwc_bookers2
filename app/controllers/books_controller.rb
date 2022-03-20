class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end


  def create
    # データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # 投稿したデータにログイン中のユーザーのIDを持たせる
    @book.user_id = current_user.id
    # データをデータベースに保存するためのsaveメソッド実行
    @book.save
    # booksのshow画面へリダイレクト
    redirect_to book_path(@book.user_id)
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end


  def destroy
     # データ（レコード）を1件取得
    book = Book.find(params[:id])
    # データ（レコード）を削除
    book.destroy
    # 投稿一覧画面へリダイレクト
    flash[:notice] = 'Book was successfully destroyed.'
    redirect_to '/books'
  end


  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
