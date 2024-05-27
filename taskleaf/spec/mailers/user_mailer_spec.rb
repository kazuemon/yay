require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  
  let(:user) { FactoryBot.create(:user, name: 'テストユーザー', email: 'test@example.com', admin: 0, password: 'password', password_confirmation: 'password') }

  let(:text_body) do
    part = mail.body.parts.detect { |part| part.content_type == 'text/plain; charset=UTF-8' }
    part.body.raw_source
  end

  let(:html_body) do
    part = mail.body.parts.detect { |part| part.content_type == 'text/html; charset=UTF-8' }
    part.body.raw_source
  end

  describe '#creation_email' do
    let (:mail) { UserMailer.creation_email(user) }

    it '想定通りのメールが生成されている' do
      expect(mail.subject).to eq("ユーザー作成完了メール")
      expect(mail.to).to eq(['user@example.com'])
      expect(mail.from).to eq(['taskleaf@example.com'])

      expect(text_body).to match('以下のユーザーを作成しました')
      expect(text_body).to match('テストユーザー')
      expect(text_body).to match('test@example.com')
      expect(text_body).to match('なし')

      expect(html_body).to match('以下のユーザーを作成しました')
      expect(html_body).to match('テストユーザー')
      expect(html_body).to match('test@example.com')
      expect(html_body).to match('なし')
    end
  end
end
