require 'spec_helper'
require 'rules_evaluator'

describe RulesEvaluator do

  context 'valid cfn template with internet gateway' do
    it 'returns a failure with an explanatory message' do

      json_rules = RulesEvaluator.new

      actual_evaluation_results = json_rules.evalute_rules json_source_path: 'spec/test-json/cfn_with_igw.json',
                                                           rule_directory: 'spec/test-rules'

      puts "results: #{actual_evaluation_results}"
      expect(actual_evaluation_results.size).to eq 1
      expect(actual_evaluation_results.first[:jq_results]).to eq ['rInternetGateway']
      expect(actual_evaluation_results.first[:error_message]).to eq 'Internet Gateways are always a no-no'
    end
  end
end