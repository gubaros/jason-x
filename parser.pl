# JSON perl parser
# Guido Barosio <guido@bravo47.com>
use strict;
use warnings;
use JSON::PP;

sub read_json {
    my ($filename) = @_;
    local $/;
    open my $fh, '<', $filename or die "Could not open $filename: $!";
    my $json_text = <$fh>;
    close $fh;
    return $json_text;
}

#sub parse_json {
#    my ($json_text) = @_;
#    my $json = JSON::PP->new->allow_nonref;
#    my $data = $json->decode($json_text);
#    return $data;
#}

sub parse_json {
    my ($json_str) = @_;
    my $data;
    eval {
        $data = decode_json($json_str);
    };
    if ($@) {
        die "Error parsing JSON: $@";
    }
    return $data;
}

my $filename = 'example.json';  
my $json_text = read_json($filename);
my $data = parse_json($json_text);

use Data::Dumper;
print Dumper($data);

