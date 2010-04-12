class TagsController < ApplicationController
  
  def show
    @tag = Tag.find_by_name!(params[:id])
    redirect_to tag_movies_path(@tag)
  end
  
end
