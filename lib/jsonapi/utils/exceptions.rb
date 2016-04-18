require 'jsonapi/utils/version'

module JSONAPI::Utils::Exceptions
  class BadRequest < ::JSONAPI::Exceptions::Error
    def code; 400 end

    def errors
      [JSONAPI::Error.new(code: 400,
                          status: :bad_request,
                          title: 'Bad Request',
                          detail: 'This request is not supported.')]
    end
  end

  class InternalServerError < ::JSONAPI::Exceptions::Error
    def code; 500 end

    def errors
      [JSONAPI::Error.new(code: 500,
                          status: :internal_server_error,
                          title: 'Internal Server Error',
                          detail: 'An internal error ocurred while processing the request.')]
    end
  end
end
