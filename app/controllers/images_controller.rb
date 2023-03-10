class ImagesController < ApplicationController
  def index
    image = Image.all
    render json: image.as_json
  end
end
