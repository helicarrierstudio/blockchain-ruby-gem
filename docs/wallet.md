##`wallet` module

An instance of the `Wallet` class needs to be initialized before it can be used.

Constructor params:
```
identifier : str
password : str
second_password : str (optional)
api_code : str (optional)
```

Usage:
```ruby
require 'blockchain'

wallet = Blockchain::Wallet.new('ada4e4b6-3c9f-11e4-baad-164230d1df67', 'password123')
```

####`send`
Send bitcoin from your wallet to a single address. Returns a `PaymentResponse` object.

Params:
```
to : str - receiving address
amount : int - amount to send (in satoshi)
from_address : str - specific address to send from (optional, keyword)
fee : int - transaction fee in satoshi. Must be greater than default (optional, keyword)
note : str - public note to include with the transaction (optional, keyword)
```

Usage:
```ruby
payment = wallet.send('1NAF7GbdyRg3miHNrw2bGxrd63tfMEmJob', 1000000, from_address: '1A8JiWcwvpY7tAopUkSnGuEYHmzGYfZPiq')

puts payment.tx_hash
```

####`send_many`
Send bitcoin from your wallet to multiple addresses. Returns a `PaymentResponse` object.

Params:
```
recipients : dictionary - dictionary with the structure of 'address':amount
from_address : str - specific address to send from (optional, keyword)
fee : int - transaction fee in satoshi. Must be greater than default (optional, keyword)
note : str - public note to include with the transaction (optional, keyword)
```

Usage:
```ruby
recipients = { '1NAF7GbdyRg3miHNrw2bGxrd63tfMEmJob' => 1428300,
				'1A8JiWcwvpY7tAopUkSnGuEYHmzGYfZPiq' => 234522117 }
payment = wallet.send_many(recipients)

puts payment.tx_hash
```

####`get_balance`
Fetch the wallet balance. Includes unconfirmed transactions and possibly double spends. Returns the wallet balance in satoshi.

Usage:
```ruby
puts wallet.get_balance() 
```

####`list_addresses`
List all active addresses in the wallet. Returns an array of `Address` objects.

Params:
```
confirmations : int - minimum number of confirmations transactions must have before being included in balance of addresses (optional)
```

Usage:
```ruby
addresses = wallet.list_addresses()
addresses.each do |a|
	puts a.balance
end

```

####`get_address`
Retrieve an address from the wallet. Returns an `Address` object.

Params:
```
confirmations : int - minimum number of confirmations transactions must have before being included in the balance (optional)
```

Usage:
```ruby
addr = wallet.get_address('1NAF7GbdyRg3miHNrw2bGxrd63tfMEmJob', confirmations = 2)
puts addr.balance
```

####`new_address`
Generate a new address and add it to the wallet. Returns an `Address` object.

Params:
```
label : str - label to attach to the address (optional, keyword)
```

Usage:
```ruby
newaddr = wallet.new_address('test_label')
```

####`archive_address`
Archive an address. Returns a string representation of the archived address.

Params:
```
address : str - address to archive
```

Usage:
```ruby
wallet.archive_address('1NAF7GbdyRg3miHNrw2bGxrd63tfMEmJob')
```

####`unarchive_address`
Unarchive an address. Returns a string representation of the unarchived address.

Params:
```
address : str - address to unarchive
```

Usage:
```ruby
wallet.unarchive_address('1NAF7GbdyRg3miHNrw2bGxrd63tfMEmJob')
```

####`consolidate`
Consolidate the wallet addresses. Returns a string array of consolidated addresses.

Params:
```
days : int - addresses which have not received any transactions in at least this many days will be consolidated.
```

Usage:
```ruby
wallet.consolidate(50)
```
