package Net::GetIP::Plugin::ICanHazIp;
use Moo;
with 'Net::GetIP::Plugin';

sub run {
    return http_get('http://icanhazip.com/');
}

1;
