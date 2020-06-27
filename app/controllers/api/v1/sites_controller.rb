class Api::V1::SitesController < ApplicationController
  def index
    @sites = Site.all
    render json: SiteSerializer.new(@sites).serializable_hash
  end

  def show
    @site = Site.find(params[:id])
    render json: SiteSerializer.new(@site).serializable_hash
  end

  def create
    @site = Site.new(create_params)
    if @site.save
      render json: SiteSerializer.new(@site).serializable_hash
    else
      render json: { errors: @site.errors }, status: :unprocessable_entity
    end
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(update_params)
      render json: SiteSerializer.new(@site).serializable_hash
    else
      render json: { errors: @site.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    render :ok
  end

  private

  def create_params
    params.from_jsonapi.require(:site).permit(:title, :subtitle, :descr, :background)
  end

  def update_params
    params.from_jsonapi.require(:site).permit(:title, :subtitle, :descr, :background)
  end
end
