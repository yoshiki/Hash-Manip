use inc::Module::Install;
name 'Hash-Manip';
all_from 'lib/Hash/Manip.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
