#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 2;
use Test::RequiresInternet ('curlmyip.com' => 80);

require_ok('Net::GetIP::Plugin::CurlMyIp');

my $p = Net::GetIP::Plugin::CurlMyIp->new;
like($p->run, qr/^[0-9.]+$/, 'got ip address');
