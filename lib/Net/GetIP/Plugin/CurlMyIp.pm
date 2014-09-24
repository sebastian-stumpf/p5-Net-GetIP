package Net::GetIP::Plugin::CurlMyIp;
use Moo;
with 'Net::GetIP::Plugin';

sub run {
    return http_get('http://curlmyip.com/');
}


1;
