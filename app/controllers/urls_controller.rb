class UrlsController < ApplicationController

  def index
    urls = Url.all.select(:id, :address, :key)
    render json: urls
  end

  def create
    url = Url.create(address: params[:address])
    
    render json: url
  end

  def url_params
    params.permit(:address)
  end
end
