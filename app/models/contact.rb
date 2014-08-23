class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :subject,   :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Website Inquiry",
      :to => "ucf.ewb.president@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end