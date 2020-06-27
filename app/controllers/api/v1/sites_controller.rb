class Api::V1::SitesController < ApplicationController
  def index
    @sites = Site.all
    render json: @sites
  end

  def show
    @site = Site.find(params[:id])
    render json: @site
  end

  def create
  end

  def update
  end

  def destroy
  end
end
