class ConfigsController < ApplicationController

  def update
    redirect_to request.referer
  end
end
