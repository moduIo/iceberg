require 'rails_helper'

def login_user
	user = create(:user)
	sign_in user

end # end def
