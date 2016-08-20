class SearchController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.js
    end
  end

  def search
    @tags = params[:search].nil? ?
              ActsAsTaggableOn::Tag.all :
              ActsAsTaggableOn::Tag.where("name like ?", "%#{params[:search]}%")
  end
end
