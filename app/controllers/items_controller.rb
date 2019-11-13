class ItemsController < ApplicationController  
  # GET /items/new
  def new
    @subject = Subject.find(params[:id])
    @image = ImageUrl.new
  end

  # POST /items
  # POST /items.json
  def create
    require 'aws-sdk'
    @image = ImageUrl.new

    data_type = params[:image_url][:image].original_filename.split(",")[-1]
    puts(data_type)
    s3 = Aws::S3::Client.new(region: 'ap-northeast-1')
    bucket_name = ENV.fetch("S3_BUCKET")
    name = "img/" + ImageUrl.count.to_s + ".png" 
    @image.attributes={url: "https://"+ENV.fetch("DOMAIN")+"/"+name, subject_id: params[:image_url][:subject_id]}
    s3.put_object(bucket: bucket_name, key: name, body: params[:image_url][:image].read)
    respond_to do |format|
      if @image.save
        format.html { redirect_to controller: :subjects, action: :showImages, id: params[:image_url][:subject_id], notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def item_params
      params.require(:image_url).permit(:subject_id, :image)
    end
end
#
