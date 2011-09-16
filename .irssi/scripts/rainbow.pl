#!/usr/bin/perl -w

# for Irssi 0.7.98.4 and newer
# Written by Jakub Jankowski <shasta@atn.pl>
# And Adam Lee <adam8157#gmail.com> (since v1.5)

# USAGE:
#
# /rsay <text>
#  - same as /say, but outputs a colored text
#
# /rme <text>
#  - same as /me, but outputs a colored text
#
# /rtopic <text>
#  - same as /topic, but outputs a colored text
#
# /rkick <nick> [reason]
#  - kicks nick from the current channel with colored reason

# CHANGES:
#
# 2002.01.25: Initial release (v1.0)
# 2002.01.26: /rtopic added (v1.1)
# 2002.01.29: /rsay works with dcc chats now (v1.2)
# 2002.02.02: make_colors() doesn't assign any color to spaces (v1.3)
# 2002.02.23: /rkick added(v1.4)
# 2011.09.16: add utf8 support(v1.5)

use strict;
use vars qw($VERSION %IRSSI);
use Encode qw(_utf8_on _utf8_off);

$VERSION = "1.5";
%IRSSI = (
	authors     => 'Jakub Jankowski, Adam Lee',
	name        => 'rainbow',
	description => 'Prints colored text.',
	license     => 'GNU GPLv2 or later',
);

use Irssi;
use Irssi::Irc;

# colors list
#  4 == light red
#  8 == yellow
#  9 == light green
# 11 == light cyan
# 12 == light blue
# 13 == light magenta
my @colors = ('4', '8', '9', '11', '12', '13');

# str make_colors($string)
# returns random-colored string
sub make_colors {
	my $oldstr = join '',@_;
	my $newstr = "";
	my $last = 255;
	my $color = 0;

	_utf8_on($oldstr);
	@_ = split //,$oldstr;
	foreach(@_) {
		if ($_ eq ' ') {
			$newstr .= $_;
			next;
		}
		while (($color = int(rand(scalar(@colors)))) == $last) {};
		$last = $color;
		$newstr .= "\003";
		$newstr .= sprintf("%02d", $colors[$color]);
		$newstr .= sprintf "$_";
	}
	_utf8_off($oldstr);

	return $newstr;
}

# void rsay($text, $server, $destination)
# handles /rsay
sub rsay {
	my ($text, $server, $dest) = @_;

	if (!$server || !$server->{connected}) {
		Irssi::print("Not connected to server");
		return;
	}

	return unless $dest;

	if ($dest->{type} eq "CHANNEL" || $dest->{type} eq "QUERY") {
		$dest->command("/msg " . $dest->{name} . " " . make_colors($text));
	}
}

# void rme($text, $server, $destination)
# handles /rme
sub rme {
	my ($text, $server, $dest) = @_;

	if (!$server || !$server->{connected}) {
		Irssi::print("Not connected to server");
		return;
	}

	if ($dest && ($dest->{type} eq "CHANNEL" || $dest->{type} eq "QUERY")) {
		$dest->command("/me " . make_colors($text));
	}
}

# void rtopic($text, $server, $destination)
# handles /rtopic
sub rtopic {
	my ($text, $server, $dest) = @_;

	if (!$server || !$server->{connected}) {
		Irssi::print("Not connected to server");
		return;
	}

	if ($dest && $dest->{type} eq "CHANNEL") {
		$dest->command("/topic " . make_colors($text));
	}
}

# void rkick($text, $server, $destination)
# handles /rkick
sub rkick {
	my ($text, $server, $dest) = @_;

	if (!$server || !$server->{connected}) {
		Irssi::print("Not connected to server");
		return;
	}

	if ($dest && $dest->{type} eq "CHANNEL") {
		my ($nick, $reason) = split(/ +/, $text, 2);
		return unless $nick;
		$reason = "Irssi power!" if ($reason =~ /^[\ ]*$/);
		$dest->command("/kick " . $nick . " " . make_colors($reason));
	}
}

Irssi::command_bind("rsay", "rsay");
Irssi::command_bind("rtopic", "rtopic");
Irssi::command_bind("rme", "rme");
Irssi::command_bind("rkick", "rkick");
