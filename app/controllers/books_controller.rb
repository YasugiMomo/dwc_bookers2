class BooksController < ApplicationController

  def index
    @books = Book.all
    @new = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @new = Book.new
    # 投稿内容に紐づいたuser情報を持ってくる
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to '/books'
    end
  end


  def create
    # データを受け取り新規登録するためのインスタンス作成
    @new = Book.new(book_params)
    # 投稿したデータにログイン中のユーザーのIDを持たせる
    @new.user_id = current_user.id
    # データをデータベースに保存するためのsaveメソッド実行
    if @new.save
    # booksのshow画面へリダイレクト
       redirect_to book_path(@new.id), notice: 'Book was successfully created.'
    else
       @books = Book.all
       @user = current_user
       render :index
    end
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
    redirect_to books_path
  end


  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end


end
