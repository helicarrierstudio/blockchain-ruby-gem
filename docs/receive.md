##Receive functionality

####`receive`
Call the 'api/receive' endpoint and create a forwarding address. Returns a `ReceiveResponse` object.

Params:
```
dest_addr : str
callback : str
api_code : str (optional)
```

Usage:
```ruby
require 'blockchain'

resp = Blockchain::receive('1hNapz1CuH4DhnV1DFHH7hafwDE8FJRheA', 'http://your.url.com')

```
