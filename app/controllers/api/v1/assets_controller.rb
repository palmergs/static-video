class Api::V1::AssetsController < ApplicationController
  def index
    @assets = Asset.all
    render json: @assets
  end

  def show
    @asset = Asset.find(params[:id])
    render json: @asset
  end

  def create
  end

  def update
  end

  def destroy
  end
end
