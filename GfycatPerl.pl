#!/usr/bin/env perl
use strict;
use warnings;
use JSON::Parse 'parse_json';
use LWP::UserAgent;
my @urls = @ARGV;
foreach (@urls){
        my $post_url = qq{http://upload.gfycat.com/transcode?fetchUrl=$_};
        my $user_a = LWP::UserAgent->new(agent => "Perl");
        my $res = $user_a->post($post_url);
        my $json_res = $res->{_content};
        my $parsed = parse_json ($json_res);
        foreach (keys %$parsed){
                print "\n$_: $parsed->{$_}";
        }
        print "Done!\n";
        print "#"x50;
}
