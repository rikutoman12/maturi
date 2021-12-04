class HomesController < ApplicationController
  def top
    @usera = current_user
  end
end
