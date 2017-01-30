require 'net/http'
require 'net/https'
require 'uri'

module Utils

  class Http

    # request_type
    GET = 0
    POST = 1

    def self.request(url, params, request_type = GET)
      case(request_type)
        when GET
          return getRequest(url, params)
        when POST
          return postRequest(url, params)
      end
    end

    def self.urlEncode(string)
      string.gsub( /([^a-zA-Z0-9_.~-]+)/ ) do
        '%' + $1.unpack( 'H2' * $1.bytesize ).join( '%' ).upcase
      end
    end

    def self.urlConv(url, params)

      # params
      param = String.new
      params.each {|key, value|
        if(!param.empty?)
          param += '&'
        end
        param += key.to_s + '=' + value.to_s
      }

      # url
      return url.empty? ? param : url + '?' + param
    end

    private

    def self.getRequest(url, params)

      url = urlConv(url, params)
      #print url
      uri = URI.parse(url)
      request = Net::HTTP::Get.new(uri)
      #print uri.host

      res = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') {|http|
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        http.request request
      }
      return res
    end

    def self.postRequest(url, params)

      uri = URI.parse(url)
      request = Net::HTTP::Post.new(uri.path)
      request.set_form_data(params)

      res = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') {|http|
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        http.request request
      }
      return res
    end

  end

end
