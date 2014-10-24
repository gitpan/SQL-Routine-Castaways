# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl SQL_Routine_SkipID.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..5\n"; }
END {print "not ok 1\n" unless $loaded;}
use lib 't/lib';
use t_SQL_Routine_SkipID;
use SQL::Routine::SkipID '0.32';
use SQL::Routine::SkipID::L::en '0.07';
$loaded = 1;
print "ok 1\n";
use strict;
use warnings;

######################### End of black magic.

# Set this to 1 to see complete result text for each test
my $verbose = shift( @ARGV ) ? 1 : 0;  # set from command line

######################################################################
# Here are some utility methods:

my $test_num = 1;  # same as the first test, above

sub result {
	$test_num++;
	my ($worked, $detail) = @_;
	$verbose or 
		$detail = substr( $detail, 0, 50 ).
		(length( $detail ) > 47 ? "..." : "");	print "@{[$worked ? '' : 'not ']}ok $test_num $detail\n";
}

sub message {
	my ($detail) = @_;
	print "-- $detail\n";
}

sub error_to_string {
	my ($message) = @_;
	my $translator = Locale::KeyedText->new_translator( 
		['SQL::Routine::SkipID::L::', 'SQL::Routine::L::'], ['en'] );
	my $user_text = $translator->translate_message( $message );
	unless( $user_text ) {
		return( ref($message) ? "internal error: can't find user text for a message: ".
			$message->as_string()." ".$translator->as_string() : $message );
	}
	return( $user_text );
}

######################################################################

message( "START TESTING SQL::Routine::SkipID" );

######################################################################

eval {
	message( "First populate some objects ..." );

	my $model = t_SQL_Routine_SkipID->create_and_populate_model( 'SQL::Routine::SkipID' );
	result( ref($model) eq 'SQL::Routine::SkipID::Container', "creation of all objects" );

	message( "Now check for missing SRT node values ..." );

	$model->assert_deferrable_constraints();
	result( 1, "verify mandatory attributes are set" );

	message( "Now see if the output is correct ..." );

	my $expected_output = t_SQL_Routine_SkipID->expected_model_xml_output();
	my $actual_output = $model->get_all_properties_as_xml_str();
	result( $actual_output eq $expected_output, "verify serialization of objects" );

	message( "Now destroy the objects ..." );

	$model->destroy();
	result( (keys %{$model}) eq '0', "destruction of all objects" );

	message( "Other functional tests are not written yet; they will come later" );
};
$@ and result( 0, "TESTS ABORTED: ".error_to_string( $@ ) );

######################################################################

message( "DONE TESTING SQL::Routine::SkipID" );

######################################################################

1;
