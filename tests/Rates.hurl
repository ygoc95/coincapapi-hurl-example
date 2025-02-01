GET {{host}}/v2/rates
HTTP 200
[Asserts] 
header "Content-Type" == "application/json; charset=utf-8"
header "date" exists
header "server" =="cloudflare"
duration < 1000  
jsonpath "$.data" isCollection
jsonpath "$.data" count > 20


GET {{host}}/v2/rates/{{rates_id}}
HTTP 200
[Asserts] 
header "Content-Type" == "application/json; charset=utf-8"
header "date" exists
header "server" =="cloudflare"
duration < 1000  
jsonpath "$.data.id" == "bitcoin"
jsonpath "$.data.symbol" contains "BTC"
jsonpath "$.data.currencySymbol" exists
jsonpath "$.data.type" == "crypto"
jsonpath "$.data.rateUsd" isString
jsonpath "$.timestamp" isNumber
