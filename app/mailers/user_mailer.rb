class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  default form: "form@example.com"
  
  def reset_password_email(user)
    @user = User.find(user.id)
    @url = edit_password_reset_url(@user.reset_password_token)
    mail(to: user.email,
         subject: "パスワードリセット")
  end
  
  def activation_needed_email(user)
    @user = user
    @url = "http://localhost:3000/users/#{user.activation_token}/activate"
    mail(to:user.email, subject: "【Staff-Manager】アカウント登録確認")
  end
  
  def activation_success_email(user)
    @user = user
    @url = "http://localhost:3000/login"
    mail(to: user.email, subject: "【Staff-Manager】アカウント登録完了")
  end

end
