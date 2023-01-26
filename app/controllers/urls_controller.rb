class UrlsController < ApplicationController
  include ApiKeyAuthenticable

  prepend_before_action :authenticate_with_api_key!

  def index
    urls = Url.all.select(:id, :address, :key)
    render json: urls, status: :ok
  end

  def create
    url = Url.create(address: params[:address])
    
    if url.save
      render json: url, status: :created
    else
      render json: url.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    url = Url.find_by_key(params[:key])
    
    if url
      render json: url, status: :ok
    else
      render json: url, status: :not_found
    end
  end

  def url_params
    params.permit(:address)
  end
end
