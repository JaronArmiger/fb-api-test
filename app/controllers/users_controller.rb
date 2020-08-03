class UsersController < ApplicationController
  def index
  end

  def login
  	@image_urls = User.koala(request.env['omniauth.auth']['credentials'])
  end
end
