require 'net/http'
require 'net/https'
require 'uri'

class ConnectController < ApplicationController

  def getRequest(url, params)

    if(!params.empty?)
      url += '?'
      params.each {|key, value|
        if(url != /&$/)
          url += '&'
        end
        url += key.to_s + '=' + value.to_s
      }
    end

    uri = URI.parse(url)
    req = Net::HTTP::Get.new(uri)

    res = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') {|http|
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http.request req
    }

    return res;
  end

  def postRequest(url, params)

    uri = URI.parse(url)
    uri.query = URI.encode_www_form(params)
    req = Net::HTTP::Post.new(uri.path)
    req.set_form_data(params)

    return res;
  end

end
