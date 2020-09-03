class PasswordResetsController < ApplicationController
  skip_before_filter :require_login
  
  def new
  end
  
  # パスワードリセットをリクエストする
  # ユーザーがパスワードのリセットフォームにemailを入力し、送信したときにこのアクションが実行される
  def create
    # form_withで送られてきたemailをparamsで受け取る
    @user = User.find_by_email(params[:email])
    # DBからデータを受け取れていれば、パスワードリセットの方法を記載したメールをユーザーに送信する（ランダムトークン付きのURL/有効期限付き）
    @user.deliver_reset_password_instructions! if @user
    # 上記は、@user.deliver_reset_password_instructions! if @user と同じ
    
    # フォームに入力したemailがアプリ(DB)内に存在するか否かを問わず、リダイレクトして成功メッセージを表示させる。
    # DBに存在した時だけ成功メッセージを表示させると、DB内にそのemailが存在するかどうかを悪意ある第三者でさえも確認できてしまう。
    flash[:success] = "パスワードの再設定メールが送信されました"
    redirect_to login_path
  end

  # パスワードリセットフォームページへ遷移
  def edit
    set_token_user_from_params?
  end

  # ユーザーがパスワードのリセットフォームを送信(新しいパスワードの入力)したときに実行
  def update
    return if !set_token_user_from_params?
    
    # password_confirmation属性の有効性を確認
    @user.password_confirmation = params[:user][:password_confirmation]
    # change_passwordメソッドで、パスワードリセットに使用したトークンを削除し、パスワードを更新する
    if @user.change_password!(params[:user][:password])
      flash[:success] = "パスワードのリセットが完了しました"
      redirect_to login_url
    else
      render :edit
    end
  end
  
  private
  
  def set_token_user_from_params?
    # postされてきた値を取得
    @token = params[:id]
    # リクエストで送信されてきたトークンを使って、ユーザーの検索を行い, 有効期限のチェックも行う。
    # トークンが見つかり、有効であればそのユーザーオブジェクトを@userに格納する
    @user = User.load_from_reset_password_token(params[:id])
    # @userがnilまたは空の場合、not_authenticatedメソッドを実行する
    if @user.blank?
      not_authenticated
      return false
    else
      return true
    end
  end
end
