class RunnersController < ApplicationController
  def index
    @users = User.all
  end
end
