class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all 
  end

  def show
    tag_id = ActsAsTaggableOn::Tag.find_by(name: params[:tag_name]).id
    @taggings = ActsAsTaggableOn::Tagging.where(tag_id: tag_id)
  end
end
