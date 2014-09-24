#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 2;
use Test::RequiresInternet ('icanhazip.com' => 80);

require_ok('Net::GetIP::Plugin::ICanHazIp');

my $p = Net::GetIP::Plugin::ICanHazIp->new;
like($p->run, qr/^[0-9.]+$/, 'got ip address');
