class Api::V1::AssetsController < ApplicationController
  def index
    @assets = Asset.by_site(params[:site_id])
    render json: AssetSerializer.new(@assets).serializable_hash
  end

  def show
    @asset = Asset.find(params[:id])
    render json: AssetSerializer.new(@asset).serializable_hash
  end

  def create
    type = create_params[:type]
    @asset = if type =~ /video/i
               VideoAsset.new(create_params.except(:type))
             elsif type =~ /image/i
               VideoAsset.new(create_params.except(:type))
             end

    if @asset
      if @asset.save
        render json: AssetSerializer.new(@asset).serializable_hash
      else
        render json: { errors: @asset.errors }, status: :unprocessable_entity
      end
    else
      render json: { errors: ['unknown type'] }, status: :unprocessable_entity
    end
  end

  def update
    @asset = Asset.find(params[:id])
    if @asset.update(update_params)
      render json: AssetSerializer.new(@asset).serializable_hash
    else
      render json: { errors: @asset.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy
    render :ok
  end

  private

  def create_params
    params.from_jsonapi.require(:asset).permit(:site_id, :type, :alt, :filename, :rel_order)
  end

  def update_params
    params.from_jsonapi.require(:asset).permit(:alt, :filename, :rel_order)
  end
end
