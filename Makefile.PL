use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
	NAME	=> 'SQL::Routine::Castaways',
	VERSION => '0.33', # for the distribution itself, not of individual modules
	PREREQ_PM => {
		'Locale::KeyedText' => '1.00',
		'SQL::Routine' => '0.47',
	},
);
