require 'jq'

class JsonRule

  def initialize(json_source_path:, failures:)
    @json_source = IO.read(json_source_path)
    @json_source_path = json_source_path
    @failures = failures
    @error_message = ''
  end

  def fail_if_found
    yield
    if @jq_results.size > 0
      @failures << {
        json_path: @json_source_path,
        jq_results: @jq_results,
        error_message: @error_message
      }
    end
  end

  def jq(jq_string)
    @jq_results = JQ(@json_source).search(jq_string).flatten

    if @jq_results == [false]
      @jq_results = []
    end
  end

  def message(error_message)
    @error_message = error_message
  end
end