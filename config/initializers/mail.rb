ActionMailer::Base.smtp_settings = {
  port:              587,
  address:           'smtp.mailgun.org',
  user_name:         'postmaster@sandbox871f2412edab47d1a73e7f7543abbc6f.mailgun.org',
  password:          'football2005',
  domain:            'sandbox871f2412edab47d1a73e7f7543abbc6f.mailgun.org',
  authentication:    :plain
}
ActionMailer::Base.delivery_method = :smtp

# Makes debugging *way* easier.
ActionMailer::Base.raise_delivery_errors = true

# This interceptor just makes sure that local mail
# only emails you.
# http://edgeguides.rubyonrails.org/action_mailer_basics.html#intercepting-emails
class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to =  'chasemassey@gmail.com'
    message.cc = nil
    message.bcc = nil
  end
end

# Locally, outgoing mail will be 'intercepted' by the
# above DevelopmentMailInterceptor before going out
if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end
