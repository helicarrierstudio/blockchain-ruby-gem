##Exchange rates functionality

All functions support an optional parameter called `api_code`. It won't be listed with every function description.

####`get_ticker`
Call the 'ticker' method and return a dictionary of `Currency` objects. Keys are currency symbols (str) and values are `Currency` objects.


Usage:
```ruby
require 'blockchain'

ticker = Blockchain::get_ticker()
#print the 15 min price for every currency
ticker.keys.each do |key|
	puts ticker[key].p15min
end
```

####`to_btc`
Call the 'tobtc' method and convert x value in the provided currency to BTC. Returns a `float`.

Params:
```
ccy : str - currency code
value : float
```

Usage:
```ruby
btc_amount = Blockchain::to_btc('USD', 4342.11)
```