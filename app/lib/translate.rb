module Translate

  class TranslateApi
    require 'net/http'
    require 'nokogiri/css'

    def self.translate(dialect, message)
      data = {d: dialect, w: message}
      url = URI.parse('http://www.degraeve.com/cgi-bin/babel.cgi')
      url.query = URI.encode_www_form(data)
      req = Net::HTTP.new(url.host, url.port)
      api_response = {}
      begin
        response = req.get(url.request_uri)
      rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError, Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
        api_response[:error] = "Message could not be translated in to desired dialect: #{e}"
        api_response[:message] = message
        return api_response
      else
        page = Nokogiri::HTML(response.body)
        unless page.css('blockquote').empty?
          api_response[:message] = page.css('blockquote').text
        else
          api_response[:error] = 'Message could not be translated in to desired dialect.'
          api_response[:message] = message
        end
        api_response
      end
    end
  end

end