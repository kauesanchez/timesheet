class Notifications < ActiveRecord::Base

    def forgot_password(to, login, pass, sent_at = Time.now)
      @subject    = "[healthymouth.generalquestions.info] Your new password is ..."
      @body['login']=login
      @body['pass']=pass
      @recipients = to
      @from       = 'al@disperseinteractive.com'
      @sent_on    = sent_at
      @headers    = {}
    end  
end
