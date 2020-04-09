require 'typhoeus'

module Instant

  BASE_URL = 'http://suggestqueries.google.com/complete/search?client=firefox&q='
  #BASE_URL = ''

  class Request

    def initialize(query)
      @query = query.gsub! ' ', '%20'
    end

    def get
      options = {
        proxy: 'zproxy.lum-superproxy.io:22225',
        proxyuserpwd: ENV['LUMEN_USER'] + ":" + ENV['LUMEN_PASS'],
        :headers => {"User-Agent" => 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0'}
      }
      #http_proxyaddr: 'zproxy.lum-superproxy.io',
      #http_proxyport: '22225',
      request = Typhoeus::Request.new(
        BASE_URL + @query,
        options
      ).run

      JSON.parse(request.response_body)[1].uniq

    end

  end
end
#Typhoeus.get('http://suggestqueries.google.com/complete/search?client=firefox&q=best%20glock')
