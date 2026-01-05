class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end

  def search
    if params[:mysearch] == "video"
    @results=`ruby searchlinkbing.rb "#{params[:composer]}" "#{params[:q]}" `
    elsif params[:mysearch] == "scores"
    @results=`ruby searchlinkbing.rb "#{params[:q]}" `
     end
  end
end
