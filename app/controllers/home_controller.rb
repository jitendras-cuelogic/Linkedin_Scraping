class HomeController < ApplicationController

  def index
  require 'nokogiri'
  require 'open-uri'
  url = "https://www.google.co.in/search?q=%27current+Marketing+Manager%27+%27Marketing+Agencies%27+%27San+Francisco+Bay+Area%27+site%3Awww.linkedin.com%2Fin%2F+OR+site%3Awww.linkedin.com%2Fpub%2F+-site%3Awww.linkedin.com%2Fpub%2Fdir%2F&oq=%27current+Marketing+Manager%27+%27Marketing+Agencies%27+%27San+Francisco+Bay+Area%27+site%3Awww.linkedin.com%2Fin%2F+OR+site%3Awww.linkedin.com%2Fpub%2F+-site%3Awww.linkedin.com%2Fpub%2Fdir%2F&aqs=chrome..69i57.583j0j7&sourceid=chrome&es_sm=0&ie=UTF-8"
  data = Nokogiri::HTML(open(url))
  @profile = []
  @info = []
  @url = []
  data.css('#search').css('.g').each do |list|
    @profile << list.css('.r').text()
    @info << list.css('.s').text()
    @url << list.css('.s').css('cite').text()
  end
  end


  def index6
    require 'rubygems'
    require 'linkedin'
    client = LinkedIn::Client.new('789ssesc73vbn9', 'QxVSGN8KcN14N1K6')
    request_token = client.request_token({}, :scope => "r_basicprofile")
    raise request_token.inspect
    rtoken = request_token.token
    rsecret = request_token.secret
    request_token.authorize_url
    client.authorize_from_request(rtoken, rsecret, pin)
    client.authorize_from_access("OU812", "8675309")
  end

  def index5
    require 'ruby-web-search'
    data = RubyWebSearch::Google.search(:query => "'current   Marketing Manager' 'Marketing Agencies' 'San Francisco Bay Area' site:www.linkedin.com/in/ OR site:www.linkedin.com/pub/ -site:www.linkedin.com/pub/dir/")
    #data = JSON.parse(response.to_json.gsub '=>', ':')
    raise data.results.first[:title].inspect
  end

  def index2
    require 'rubygems'
    require 'rexml/document'
    result = Google::Search::Item::Book.new(:query => 'Java')
    raise result.inspect
  end



  def index3
    require 'google/api_client'
    require 'rubygems'
    require 'rexml/document'
    require 'google_custom_search'
    #results = GoogleCustomSearch.search("Jitendra Samant")
    # results = client.discovered_api('urlshortener')

    client = Google::APIClient.new
    file = 'FOUNDLY-df4b739dbb02.json'
    doc = File.read("#{Rails.root}/public/#{file}")
    client.register_discovery_document('myapi', 'v1', doc)
    my_api = client.discovered_api('myapi', 'v1')
    #result = client.execute(:api_method => my_api, :parameters => {'cx' => '198295937365-qp6cqasqcq3bnrvm8ekibh0aulodvdsf.apps.googleusercontent.com', 'q'=> 'Hello+World'})

    #raise result.inspect
  end

  def index4
    # require 'hpricot'
    # require 'open-uri'
    #
    # site = "douglasfshearer.com -'tagged with' -'posts by date' -page"
    # @query = params[:id]
    # @start = params[:start] if params[:start]
    # @start ||= '0'
    # uri = "http://www.google.com/search?q=#{URI.escape(site+' '+ @query+'&start='+@page.to_s)}"
    # raise uri.inspect
    # html_result = open(uri)
    # parsed = Hpricot(html_result)
    # @no_results = parsed.to_s[/<\/b> of about (\d*)<\/b> from/,1]
    #
    # @results = (parsed/'div.g').map do |ele|
    #   {:title => ele.at('a').inner_text,
    #   :link => ele.at('a')['href'],
    #   }
    #
    # end

  end

end
