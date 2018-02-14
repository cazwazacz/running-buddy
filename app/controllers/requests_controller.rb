class RequestsController < ApplicationController

  def index
    if session[:user_id]
      @requests = User.find(session[:user_id]).requests
    else
      redirect_to root_url, notice: 'You must be signed in to view this page.'
    end
  end

  def create
    @request = Request.new(new_request_params)
    @request.save
    200
  end

  def update
  end

  private

  def user_1
    params['id'].split("-")[0].to_i
  end

  def user_2
    params['id'].split("-")[1].to_i
  end

  def new_request_params
    { user_1: user_1, user_2: user_2, status: 'pending' }
  end
end
