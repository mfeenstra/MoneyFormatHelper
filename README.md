# Money Format Helper v1.0

Formats any number, or dollar amount to have commas and/or padded zeros in the decimal place.

Make totals much easier to read.


_matt.a.feenstra@gmail.com_

_Licensed under GPLv3, all rights reserved._

-----

## Usage:

```ruby
require './money_format_helper'

dollar_amount = 8675307.1
debt_amount = -9876543.5

```
### Currently only 2 functions: `with_commas` and `zeropad`

```ruby
MoneyFormatHelper::with_commas(dollar_amount)
==>"8,675,307.1"

MoneyFormatHelper::zeropad("8,675,307.1")
==>"8675307.10"

MoneyFormatHelper::zeropad(dollar_amount)
==>"8675307.10"

MoneyFormatHelper::zeropad(debt_amount)
==>"-9876543.50"

MoneyFormatHelper::with_commas(debt_amount)
==>"-9,876,543.5"

```

## Testing:

```ruby
$ rspec
....

Finished in 0.0045 seconds (files took 0.18309 seconds to load)
4 examples, 0 failures

```
