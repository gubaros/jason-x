use strict;
use warnings;
use Test::More tests => 2;
use lib '.';
require 'parser.pl';

my $valid_json = '{"name": "John", "age": 30}';
my $result = eval { parse_json($valid_json) };
is($@, '', 'No error in parsing valid JSON');
is_deeply($result, { name => 'John', age => 30 }, 'Parsed correctly');

my $invalid_json = '{"name": "John", "age": 30\'}';
$result = eval { parse_json($invalid_json) };
like($@, qr/Unexpected end of input|syntax error/i, 'Caught error for invalid JSON');
