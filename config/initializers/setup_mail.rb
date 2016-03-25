ActionMailer::Base.smtp_settings = {
  :address   => "smtp.mandrillapp.com",
  :port      => 587,
  :user_name => "MANDRILL_USERNAME",
  :password  => "MANDRILL_SMTP_PASS"
}
