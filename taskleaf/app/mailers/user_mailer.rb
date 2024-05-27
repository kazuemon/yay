class UserMailer < ApplicationMailer
  def creation_email(user)
    @user = user
    mail(
      subject: 'ユーザー作成完了メール',
      to: 'user@example.com',
      from: 'taskleaf@example.com'
    )
  end
end
