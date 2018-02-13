class RequestsController < ApplicationController
  def create
    @request = Request.new(new_request_params)
    @request.save
    200
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
