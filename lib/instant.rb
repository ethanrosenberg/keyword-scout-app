require 'typhoeus'

module Instant



  BASE_URL = 'http://suggestqueries.google.com/complete/search?client=firefox&q='
  #BASE_URL = ''

  class Request

    def initialize(query)

      query_has_spaces = query.match(/\s/) ? true : false
      if query_has_spaces
        @query = query.gsub! ' ', '%20'
      else
        @query = query
      end

    end

    def get

      Typhoeus::Config.user_agent = 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0'
      Typhoeus::Config.verbose = false
      
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

    def test_request

      options = {
        proxy: 'zproxy.lum-superproxy.io:22225',
        proxyuserpwd: ENV['LUMEN_USER'] + ":" + ENV['LUMEN_PASS'],
        :headers => {"User-Agent" => 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0'}
      }
      #http_proxyaddr: 'zproxy.lum-superproxy.io',
      #http_proxyport: '22225',
      request = Typhoeus::Request.new(
        @query,
        options
      ).run

      byebug

      request.response_body
    end

  end
end
#Typhoeus.get('http://suggestqueries.google.com/complete/search?client=firefox&q=best%20glock')
