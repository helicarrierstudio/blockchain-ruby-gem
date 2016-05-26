##Receive V2 functionality

####`receive`
Call the 'v2/receive' endpoint and create a new address. Returns a `V2::ReceiveResponse` object.

Params:
```
xpub : str
callback : str
api_key : str
```

Usage:
```ruby
require 'blockchain'

resp = Blockchain::V2::receive('xpub1hNapz1CuH4DhnV1DFHH7hafwDE8FJRheA', 'http://your.url.com', 'yourApiKey')

```

####`callback_log`
Call the 'v2/receive/callback_log' endpoint. Returns an array of `LogEntry` objects.

Params:
```
callback : str
api_key : str
```

Usage:
```ruby
require 'blockchain'

resp = Blockchain::callback_log('1hNapz1CuH4DhnV1DFHH7hafwDE8FJRheA', 'http://your.url.com')

```