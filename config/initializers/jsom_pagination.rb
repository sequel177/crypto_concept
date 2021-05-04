module JSOM
  module Pagination
    class Links    
      def parse_url(url)
        uri = URI.parse(CGI.unescape(url))
        url_params = Rack::Utils.parse_nested_query(
          uri.query
        ).delete_if { |key, _value| key == 'page' }
        uri.query = to_query(url_params)
        uri.query = nil if uri.query.empty?
        uri
      end
    end
  end
end