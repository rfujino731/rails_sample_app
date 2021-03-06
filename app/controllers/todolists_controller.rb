class TodolistsController < ApplicationController
  def new
  	#Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
  	@list = List.new
  end

  def create
  	#ストロングパラメーターを使用
  	list = List.new(list_params)
  	#DBへ保存する
  	list.save
  	#詳細画面へリダイレクト
  	redirect_to todolist_path(list.id)
  end

  def index
  	  #インスタンス変数には、すべての投稿履歴(list)が入るので、複数形(@lists)にする
  	  @lists = List.all

  end

  def show
  	  #詳細ページを表示する
  	  #取得するレコードは1件なので、@listと単数形
  	  @list = List.find(params[:id])

  end

  def edit
  	  @list = List.find(params[:id])
  end

  def update
  	 list = List.find(params[:id])
  	 list.update(list_params)
  	 redirect_to todolist_path(list.id)
  end

  def destroy
  	 list = List.find(params[:id])#データを1件取得
  	 list.destroy #データを削除
  	 redirect_to todolists_path #List一覧画面へリダイレクト
  end

  private
  def list_params
  	params.require(:list).permit(:title, :body, :image)
  end
end
