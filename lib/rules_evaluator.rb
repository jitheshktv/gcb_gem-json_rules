require_relative 'json_rule'
require 'json'

class RulesEvaluator

  ##
  # Return an array of rule violations
  #
  # each entry is a Hash with the jq result and a human readable error message to go along with it
  def evalute_rules(json_source_path:,
                    rule_directory:)
    unless Dir.exist?(rule_directory)
      fail "The rule directory: #{rule_directory} does not exist"
    end

    unless File.exist?(json_source_path)
      fail "The JSON source path: #{json_source_path} does not exist"
    end
    
    @failures = []
    Dir[File.join(rule_directory, '*.rb')].sort.each do |rule_file|
      json_rule = JsonRule.new json_source_path: json_source_path,
                               failures: @failures

      json_rule.instance_eval IO.read(rule_file)
    end
    @failures
  end

  def emit_results(json_source_path:,
                   rule_directory:)
    results = evalute_rules json_source_path: json_source_path,
                            rule_directory: rule_directory

    puts JSON.generate results

    results.size > 0 ? 1 : 0
  end
end
