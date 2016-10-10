fail_if_found {
  jq '[.Resources|with_entries(.value.LogicalResourceId = .key)[] | select(.Type == "AWS::EC2::InternetGateway")]|map(.LogicalResourceId)'
  message 'Internet Gateways are always a no-no'
}

fail_if_found {
  jq '.Resources|to_entries[]|.key == "rInternetGateway2"'
  message 'something wrong?'
}