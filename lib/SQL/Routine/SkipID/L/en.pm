=head1 NAME

SQL::Routine::SkipID::L::en - Localization of SQL::Routine::SkipID for English

=cut

######################################################################

package SQL::Routine::SkipID::L::en;
use 5.006;
use strict;
use warnings;
use vars qw($VERSION);
$VERSION = '0.06';

######################################################################

=head1 DEPENDENCIES

Perl Version: 5.006

Standard Modules: I<none>

Nonstandard Modules: I<This module has no enforced dependencies, but it is
designed to be used by Locale::KeyedText when that module localizes error
messages generated by SQL::Routine::SkipID.>

=head1 COPYRIGHT AND LICENSE

This file is part of the SQL::Routine::Castaways collection of archaic
SQL::Routine functionality.

SQL::Routine::Castaways is Copyright (c) 1999-2004, Darren R. Duncan.  All
rights reserved. Address comments, suggestions, and bug reports to
B<perl@DarrenDuncan.net>, or visit "http://www.DarrenDuncan.net" for more
information.

SQL::Routine::Castaways is free software; you can redistribute it and/or modify
it under the same terms as Perl 5.8 itself.

Any versions of SQL::Routine::Castaways that you modify and distribute must
carry prominent notices stating that you changed the files and the date of any
changes, in addition to preserving this original copyright notice and other
credits.  SQL::Routine::Castaways is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=cut

######################################################################

my $CC = 'SQL::Routine::SkipID::Container';
my $CN = 'SQL::Routine::SkipID::Node';

my %text_strings = (
	'SRTSID_C_CR_NODE_TREE_NO_ARGS' => 
		"$CC.create_node_tree(): missing argument",

	'SRTSID_N_SET_NREF_AT_NO_ID_MATCH' => 
		"$CN.set_node_ref_attribute(): invalid ATTRS argument element; ".
		"when trying to set '{ATNM}' attribute of a '{HOSTTYPE}' Node; ".
		"'{ARG}' is not a Node ref and it does not ".
		"match the id of any existing '{EXPTYPE}' Node",

	'SRTSID_N_SET_ATS_BAD_ARGS' => 
		"$CN.set_attributes(): invalid ATTRS argument; ".
		"it is not a hash ref, but rather is '{ARG}'; ".
		"also, nodes of type '{HOSTTYPE}' have no default ".
		"attribute to associate the given value with",

	'SRTSID_N_CR_NODE_TREE_NO_ARGS' => 
		"$CN.create_child_node_tree(): missing argument",
);

######################################################################

sub get_text_by_key {
	return( $text_strings{$_[1]} );
}

######################################################################

1;
__END__

=head1 SYNOPSIS

	use Locale::KeyedText;
	use SQL::Routine::SkipID;

	# do work ...

	my $translator = Locale::KeyedText->new_translator( 
		['SQL::Routine::SkipID::L::', 'SQL::Routine::L::'], ['en'] );

	# do work ...

	eval {
		# do work with SQL::Routine::SkipID, which may throw an exception ...
	};
	if( my $error_message_object = $@ ) {
		# examine object here if you want and programmatically recover...

		# or otherwise do the next few lines...
		my $error_user_text = $translator->translate_message( $error_message_object );
		# display $error_user_text to user by some appropriate means
	}

	# continue working, which may involve using SQL::Routine::SkipID some more ...

=head1 DESCRIPTION

The SQL::Routine::SkipID::L::en Perl 5 module contains localization
data for SQL::Routine::SkipID.  It is designed to be interpreted by
Locale::KeyedText.

This class is optional and you can still use SQL::Routine::SkipID
effectively without it, especially if you plan to either show users different
error messages than this class defines, or not show them anything because you
are "handling it".

=head1 SYNTAX

This class does not export any functions or methods, so you need to call them
using object notation.  This means using B<Class-E<gt>function()> for functions
and B<$object-E<gt>method()> for methods.  If you are inheriting this class for
your own modules, then that often means something like B<$self-E<gt>method()>.  

=head1 FUNCTIONS

=head2 get_text_by_key( MSG_KEY )

	my $user_text_template = SQL::Routine::SkipID::L::en->get_text_by_key( 'foo' );

This function takes a Message Key string in MSG_KEY and returns the associated
user text template string, if there is one, or undef if not.

=head1 SEE ALSO

perl(1), Locale::KeyedText, SQL::Routine::SkipID.

=cut
