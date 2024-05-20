use strict;
use warnings;
use Test::More tests => 2;
use JSON;  # Módulo Perl para manejar JSON
use File::Slurp;  # Para leer archivos fácilmente
use lib '.';
require 'parser.pl';

my $json_file = 'example.json';
my $json_str = read_file($json_file);

ok($json_str, 'example.json read correctly');

my $parsed_data = eval { parse_json($json_str) };

if ($@) {
    die "Error parsing JSON: $@";
}

my $expected_data = {
};

is_deeply($parsed_data, $expected_data, 'Data parsed correctly from example.json');

