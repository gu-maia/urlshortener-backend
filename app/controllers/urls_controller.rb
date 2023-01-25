class UrlsController < ApplicationController

  def index
    urls = Url.all.select(:id, :address, :key)
    render json: urls
  end

  def create
    url = Url.create(address: params[:address])
    
    if url.save
      render json: url
    else
      render json: url.errors.full_messages
    end
  end

  def show
    url = Url.find_by_key(params[:key])
    
    render json: url
  end

  def url_params
    params.permit(:address)
  end
end
