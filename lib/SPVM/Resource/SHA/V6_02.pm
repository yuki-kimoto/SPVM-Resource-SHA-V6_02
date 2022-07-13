package SPVM::Resource::SHA::V6_02;

our $VERSION = '0.05';

1;

=head1 Name

SPVM::Resource::SHA::V6_02 - Resource of sha v6.02.

=head1 Usage

C<MySHA.spvm>

  class MySHA {
    native static method match : int ();
  }

C<MySHA.c>

  #include "spvm_native.h"
  
  #include "sha.h"
  
  int32_t SPVM__MySHA__match(SPVM_ENV* env, SPVM_VALUE* stack) {
    
    int32_t sha256 = SHA256;
    
    return 0;
  }

C<MySHA.config>

  use strict;
  use warnings;
  
  my $config = SPVM::Builder::Config->new_gnu99(file => __FILE__);
  
  $config->use_resource('Resource::SHA::V6_02');

  $config;

C<mysha.pl>

  use FindBin;
  use lib "$FindBin::Bin";
  use SPVM 'MySHA';
  
  my $match = SPVM::MySHA->match;

=head1 Description

C<Resource::SHA::V6_02> is a L<SPVM> module to provide the resource of L<RE2|https://github.com/google/re2> L<2022-06-01|https://github.com/google/re2/releases/tag/2022-06-01>.

L<RE2|https://github.com/google/re2> is a regular expression library written by C<C++>. Google created it.

See L<SPVM::Document::NativeModule> and L<SPVM::Document::Resource> to write native modules and use resources.

=head1 Caution

L<SPVM> is yet development status.

=head1 Config

The config of C<Resource::SHA::V6_02>.

  use strict;
  use warnings;
  use SPVM::Builder::Config;

  my $config = SPVM::Builder::Config->new_gnu99(file => __FILE__);

  my @source_files = qw(
    sha64bit.c
    sha.c
  );

  $config->add_source_files(@source_files);

  $config;

=head1 Required Libraries

None.

=head1 Source and Header Files

The source and header files are created by the following process.

=head2 src

All files of L<sha v6.02|https://github.com/google/re2/releases/tag/2022-06-01> are copiedinto C<SPVM/Resource/SHA/V6_02.native/src>.

=head2 include

All header files in above C<src> directory are copied into C<SPVM/Resource/SHA/V6_02.native/include> in the following command.

  rsync -av --include='*/' --include='*.h' --exclude='*' lib/SPVM/Resource/SHA/V6_02.native/src/ lib/SPVM/Resource/SHA/V6_02.native/include/

=head2 Compiled Source Files

The following source files are compiled.

  sha64bit.c
  sha.c

This source files are got by the following command.

  find * | grep -P '\.c$' | grep -P '\.native/src' | grep -v blib | perl -p -e 'use File::Basename; $_ = File::Basename::basename $_' | grep -v -P 'sdf\.c';

=head1 Repository

L<https://github.com/yuki-kimoto/SPVM-Resource-SHA-V6_02>

=head1 Author

YuKi Kimoto C<kimoto.yuki@gmail.com>

=head1 Copyright & License

Copyright 2022-2022 YuKi Kimoto, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
