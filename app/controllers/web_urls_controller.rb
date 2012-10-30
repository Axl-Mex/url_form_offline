class WebUrlsController < ApplicationController

  def new
    @web_urls = WebUrl.all(:order =>"created_at desc")
  end

  # POST /web_urls
  # POST /web_urls.xml
  def create
    params[:url_list].each do |url|
      WebUrl.new(:url => url).save
    end
    render :json=>params[:url_list].to_json
  end

  # GET /web_urls/realtime
  # GET /web_urls/realtime.xml
  def realtime
    render :json=>WebUrl.all.map(&:url).to_json
  end

end
