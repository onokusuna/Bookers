class BooksController < ApplicationController
  def top

  end
  def index
      # 記事を全件取得(複数形)
      # モデル名で書く（他人もわかりやすくするため）
      @books = Book.all
      # Viewへ渡すためのインスタンス変数(@list)に空のモデルオブジェクト(List)を生成する。
      @book = Book.new
  end

  def show
  	  @book = Book.find(params[:id])# 記事のid取得 投稿データのIDはURLに含まれているので、params[:id]で取得できます。
  end
# newは使わない？
  def new
  end

  def edit
  	  @book = Book.find(params[:id])# 記事のid取得なのでパスの引数に.idが必要ない
  end

# cteate以下はviewに関係ないためインスタンス変数に@がつかない（ローカル）
  def create # 5
  	  @book = Book.new(book_params)# renderが全記事情報を取得してindexに飛ぶために@をつける？@は表示するやつにつける
  	  if @book.save
  	  # showへ移動 パスの引数はcreateは@を使っていないので(book) ルートはターミナルで都度確認rails routes
  	  	 flash[:notice] = 'Book was successfully created.'# notice=通知
      	 redirect_to book_path(@book)
      else# 失敗した時
      	 @books = Book.all
      	 render :index# render=(…に)する、与える
      end
  end

  def update # 6
  	  @book = Book.find(params[:id])
  	  if @book.update(book_params)
         flash[:notice] = 'Book was successfully created.'# notice=通知
  	     redirect_to book_path(@book)# showパスの(book)はupdeteで定義したメソッド内のbookが、記事idを持ったインスタンス変数なのでshowに飛んだ時該当記事に飛べる
      else# 失敗した時
         @books = Book.all
         render :index# render=(…に)する、与える
      end
  end

  def destroy # 7
  	  book = Book.find(params[:id])
  	  book.destroy
  	  redirect_to books_path# indexへリダイレクト
  end


  private
  def book_params
  	  params.require(:book).permit(:title, :body)
  end
end
