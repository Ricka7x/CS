class WelcomeController < ApplicationController
  def index
  	@users = User.count
  end
end
