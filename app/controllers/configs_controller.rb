class ConfigsController < ApplicationController

  def update
    params[:settings].each do |key, value|
      update_setting key, value
    end
    redirect_to request.referer
  end

  private

  def update_setting(key, value)
    Config.where(var: key).first.update(value: value)
    (ComicVine::API.key = value.squish) if key == "api_key"
  end

end
