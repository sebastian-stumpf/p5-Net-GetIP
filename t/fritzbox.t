#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 2;

require_ok('Net::GetIP::Plugin::FritzBox');

my $fb = Net::GetIP::Plugin::FritzBox->new;
like($fb->run, qr/^[0-9.]+$/, 'got ip address');
