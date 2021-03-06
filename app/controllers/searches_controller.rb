class SearchesController < ApplicationController
  before_action :authenticate_user!
  def search
    @usera = current_user
    @model = params["model"]
    @content = params["content"]
    @records = search_for(@model, @content)
  end

  private
  def search_for(model, content)
    if model == 'user'
        User.where('name LIKE ?', '%'+content+'%')
    elsif model == 'menu'
        Menu.where('title LIKE ?', '%'+content+'%')
    end
  end
end
