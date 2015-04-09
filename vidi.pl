#!/usr/bin/perl -w
use strict;
use lib qw(.);
use BES::VIDI;

my $vidi = BES::VIDI->new();
#my $d = Data::Dumper->new();
my $proto = $vidi->protocol_ver();
#
my $string = $vidi->get_upload_tree();

my ($types,$attr) = $vidi->get_user_attr();

my $folder = $vidi->read_folder("/NLE");

my $clip_info = $vidi->read_clip_info('857ae0e4df4d11dea399c15db881b8ad');

my $status = $vidi->create_clip_link("/NLE",'857ae0e4df4d11dea399c15db881b8ad');

my $del_status = $vidi->delete_clip_link("/NLE",'857ae0e4df4d11dea399c15db881b8ad');


print 1;

#ReadClipInfo +
#ReadFolder +
#CreateClipLink +
#WriteClipInfo 
#DeleteClipLink +
#OrderStatus
#GetClipsByCondition
   