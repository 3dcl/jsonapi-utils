require 'json'

module Helpers
  module ResponseParser
    def json
      @json ||= JSON.parse(response.body)
    end

    def error
      @error ||= json['errors'].first
    end

    def data
      @data ||= json['data']
    end

    def collection
      @collection ||= [data].flatten
    end

    def links
      @links ||= json['links']
    end
  end
end
