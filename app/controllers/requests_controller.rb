class RequestsController < ApplicationController
  def create
    p params["id"]
  end
end
