Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82373437350
	for <lists+selinux@lfdr.de>; Fri, 22 Oct 2021 09:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbhJVH50 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 22 Oct 2021 03:57:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24340 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232673AbhJVH5K (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 22 Oct 2021 03:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634889293;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=FnscZVnwhgivOuVbDG77hL6te5XVYvVngJTRhQDvm14=;
        b=HEYHuLAo4yC5GdLIBEZHmQFfRlVYQo10nsJWsBTolcyQKNa0DKZN+0Nka6ty0et3RWQcMr
        /WyqNTlKTyNrAWKP+s4UKm7gCGE9J788WCMiGRpOZbhD08EacEO4iCDaYjtf+lXoYQx/hY
        2uMxxwegb8nVLAN1xiXBEMeR/1Re9rw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-nJKz0svWNv63-wVd1NrxNw-1; Fri, 22 Oct 2021 03:54:51 -0400
X-MC-Unique: nJKz0svWNv63-wVd1NrxNw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B027801B00
        for <selinux@vger.kernel.org>; Fri, 22 Oct 2021 07:54:50 +0000 (UTC)
Received: from localhost (unknown [10.40.194.167])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 93BFE5C1D5
        for <selinux@vger.kernel.org>; Fri, 22 Oct 2021 07:54:49 +0000 (UTC)
From:   Petr Lautrbach <plautrba@redhat.com>
To:     selinux@vger.kernel.org
Subject: ANN: SELinux userspace 3.3 release
Date:   Fri, 22 Oct 2021 09:54:48 +0200
Message-ID: <87h7d9bik7.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hello!

The 3.3 release for the SELinux userspace is now available at:

https://github.com/SELinuxProject/selinux/wiki/Releases

Thanks to all the contributors, reviewers, testers and reporters!

User-visible changes
--------------------

* When reading a binary policy by checkpolicy, do not automatically change =
the version
  to the max policy version supported by libsepol or, if specified, the val=
ue given
  using the "-c" flag.

* `fixfiles -C` doesn't exclude /dev and /run anymore

* CIL: Lists are allowed in constraint expressions

* CIL: Improved situation with duplicate macro and block declarations

* Added the new `secilc2tree` program to write out CIL AST.

* Improved documentation

* A lot of static code analyse issues, fuzzer issues and compiler warnings =
fixed

* Updated checkpolicy documentation

* checkpolicy prints the reason why opening a source policy file failed

* Bug fixes

Development-relevant changes
----------------------------

* CIFuzz is turned on in CI
  https://google.github.io/oss-fuzz/getting-started/continuous-integration/

* Fedora 34 image is used in CI

Issues fixed
------------

* https://github.com/SELinuxProject/selinux/issues/293
* https://github.com/SELinuxProject/selinux/issues/307


(Long) shortlog of changes since the 3.2 release
-----------------------------------------
Christian G=C3=B6ttsche (102):
      libselinux: selinux_check_passwd_access_internal(): respect deny_unkn=
own
      libselinux: sidtab_hash(): do not discard const qualifier
      libselinux: selinux_file_context_cmp(): do not discard const qualifier
      libselinux: label_common(): do not discard const qualifier
      libselinux: Sha1Finalise(): do not discard const qualifier
      libselinux: sefcontext_compile: mark local variable static
      libselinux: avcstat: use standard length modifier for unsigned long l=
ong
      libselinux: selinux_restorecon: mark local variable static
      libselinux: selabel_get_digests_all_partial_matches: free memory afte=
r FTS_D block
      libselinux: getconlist: free memory on multiple level arguments
      libselinux: exclude_non_seclabel_mounts(): drop unused variable
      libselinux: context_new(): drop dead assignment
      libselinux: label_x::init(): drop dead assignment
      libselinux: label_media::init(): drop dead assignment
      libselinux: setexecfilecon(): drop dead assignment
      libselinux: getdefaultcon: free memory on multiple same arguments
      libselinux: store_stem(): do not free possible non-heap object
      libselinux: matchmediacon(): close file on error
      libselinux: init_selinux_config(): free resources on error
      libselinux: label_file::init(): do not pass NULL to strdup
      libselinux: matchpathcon: free memory on realloc failure
      libselinux: label_db::db_init(): open file with CLOEXEC mode
      libselinux: drop redundant casts to the same type
      libselinux: sidtab_sid_stats(): unify parameter name
      libselinux: regex: unify parameter names
      libselinux: label_file.c: fix indent
      libselinux: avc_destroy(3) closes status page
      libselinux: make selinux_status_open(3) reentrant
      libselinux: do not use status page fallback mode internally
      libselinux: selinux_status_open: return 1 in fallback mode
      libselinux: improve getcon(3) man page
      libsepol: quote paths in CIL conversion
      libselinux: fix typo
      libsepol: fix typos
      libsepol: resolve missing prototypes
      libsepol: remove unused functions
      libsepol: avoid unsigned integer overflow
      libsepol: follow declaration-after-statement
      libsepol/cil: follow declaration-after-statement
      libsepol: remove dead stores
      libsepol: mark read-only parameters of ebitmap interfaces const
      libsepol: mark read-only parameters of type_set_ interfaces const
      libsepol: do not allocate memory of size 0
      libsepol: remove dead stores
      libsepol/cil: silence cast warning
      libsepol/cil: drop extra semicolon
      libsepol/cil: drop dead store
      libsepol/cil: drop unnecessary casts
      libsepol/cil: avoid using maybe uninitialized variables
      libsepol: drop repeated semicolons
      libsepol: drop unnecessary casts
      libsepol: declare file local variable static
      libsepol: declare read-only arrays const
      libsepol: avoid unsigned integer overflow
      libsepol: ignore UBSAN false-positives
      libsepol: avoid implicit conversions
      libsepol: assure string NUL-termination of ibdev_name
      checkpolicy: pass CFLAGS at link stage
      checkpolicy: drop -pipe compile option
      checkpolicy: simplify assignment
      checkpolicy: drop dead condition
      checkpolicy: use correct format specifier for unsigned
      checkpolicy: follow declaration-after-statement
      checkpolicy: remove dead assignments
      checkpolicy: check before potential NULL dereference
      checkpolicy: avoid potential use of uninitialized variable
      checkpolicy: drop redundant cast to the same type
      checkpolicy: parse_util drop unused declaration
      checkpolicy/test: mark file local functions static
      checkpolicy: mark read-only parameters in policy define const
      scripts/run-scan-build: update
      secilc: fix memory leaks in secilc
      secilc: fix memory leaks in secilc2conf
      policycoreutils: free memory on lstat failure in sestatus
      policycoreutils: free memory of allocated context in run_init
      policycoreutils: free memory of allocated context in newrole
      libselinux: replace strerror by %m
      libsepol: replace strerror by %m
      libsepol: avoid implicit conversions
      libsepol: free memory after policy validation
      checkpolicy: enclose macro argument in parentheses
      checkpolicy: misc checkmodule tweaks
      checkpolicy: misc checkpolicy tweaks
      checkpolicy: mark read-only parameters in module compiler const
      checkpolicy: mark file local functions in policy_define static
      checkpolicy: add missing function declarations
      checkpolicy: resolve dismod memory leaks
      checkpolicy: avoid implicit conversion
      checkpolicy: error out on parsing too big integers
      checkpolicy: print warning on source line overflow
      checkpolicy: free extended permission memory
      libselinux/utils: drop requirement to combine compiling and linking
      Correct some typos
      libsepol: ebitmap: mark nodes of const ebitmaps const
      libsepol: use correct cast
      libsepol: resolve GCC warning about null-dereference
      libsepol/cil: silence clang void-pointer-to-enum-cast warning
      checkpolicy: policy_define: cleanup declarations
      checkpolicy: print reason of fopen failure
      checkpolicy: update documentation
      checkpolicy: drop incorrect cast
      checkpolicy: delay down-cast to avoid align warning

Dominick Grift (1):
      cil_conditional_statements.md: fix expr definition

Evgeny Vereshchagin (3):
      ci: turn on CIFuzz
      README: add OSS-Fuzz/CIFuzz badges
      libsepol/cil: move the fuzz target and build script to the selinux re=
pository

Fabrice Fontaine (1):
      libselinux/utils/getseuser.c: fix build with gcc 4.8

HuaxinLu (1):
      libsemanage: fix use-after-free in parse_module_store()

James Carter (107):
      libsepol: Expand role attributes in constraint expressions
      libsepol: Properly handle types associated to role attributes
      libsepol: Remove unnecessary copying of declarations from link.c
      libsepol/checkpolicy: Set user roles using role value instead of domi=
nance
      checkpolicy: Do not automatically upgrade when using "-b" flag
      libsepol: Check kernel to CIL and Conf functions for supported versio=
ns
      libsepol: Write "NO_IDENTIFIER" for empty constraint expression
      libsepol: Enclose identifier lists in constraint expressions
      libsepol/cil: Allow lists in constraint expressions
      secilc/docs: Lists are now allowed in constraint expressions
      libsepol: Enclose identifier lists in CIL constraint expressions
      libsepol: Write "NO_IDENTIFIER" for empty CIL constraint expression
      libsepol/cil: Check for duplicate blocks, optionals, and macros
      libsepol/cil: Fix out-of-bound read of file context pattern ending wi=
th "\"
      libsepol/cil: Destroy classperms list when resetting classpermission
      libsepol/cil: Destroy classperm list when resetting map perms
      libsepol/cil: cil_reset_classperms_set() should not reset classpermis=
sion
      libsepol/cil: Set class field to NULL when resetting struct cil_class=
perms
      libsepol/cil: More strict verification of constraint leaf expressions
      libsepol/cil: Exit with an error if declaration name is a reserved wo=
rd
      libsepol/cil: Allow permission expressions when using map classes
      libsepol/cil: Refactor helper function for cil_gen_node()
      libsepol/cil: Create function cil_add_decl_to_symtab() and refactor
      libsepol/cil: Move check for the shadowing of macro parameters
      libsepol/cil: Reorder checks for invalid rules when building AST
      libsepol/cil: Cleanup build AST helper functions
      libsepol/cil: Create new first child helper function for building AST
      libsepol/cil: Use AST to track blocks and optionals when resolving
      libsepol/cil: Reorder checks for invalid rules when resolving AST
      libsepol/cil: Sync checks for invalid rules in booleanifs
      libsepol/cil: Check for statements not allowed in optional blocks
      libsepol/cil: Sync checks for invalid rules in macros
      libsepol/cil: Do not allow tunable declarations in in-statements
      libsepol/cil: Make invalid statement error messages consistent
      libsepol/cil: Use CIL_ERR for error messages in cil_compile()
      secilc/docs: Update the CIL documentation for various blocks
      libsepol/cil: Create functions to write the CIL AST
      libsepol/cil: Add functions to make use of cil_write_ast()
      secilc: Create the new program called secil2tree to write out CIL AST
      libsepol/cil: Properly reset an anonymous classperm set
      libsepol/cil: Fix instances where an error returns SEPOL_OK
      libsepol/cil: Detect degenerate inheritance and exit with an error
      libsepol/cil: Check datum in ordered list for expected flavor
      libsepol/cil: Return an error if a call argument fails to resolve
      libsepol/cil: Check for self-referential loops in sets
      libsepol/cil: Fix name resolution involving inherited blocks
      secilc/docs: Document the order that inherited rules are resolved in
      libsepol/cil: Make name resolution in macros work as documented
      libsepol/cil: Do not add NULL node when inserting key into symtab
      libsepo/cil: Refactor macro call resolution
      libsepol/cil: Do not resolve arguments to declarations in the call
      secilc/docs: Relocate and reword macro call name resolution order
      libsepol/cil: Handle disabled optional blocks in earlier passes
      libsepol/cil: Destroy the permission nodes when exiting with an error
      libsepol/cil: Limit the number of open parenthesis allowed
      libsepol/cil: Resolve anonymous class permission sets only once
      libsepol/cil: Pointers to datums should be set to NULL when resetting
      libsepol/cil: Resolve anonymous levels only once
      libsepol/cil: Fix anonymous IP address call arguments
      libsepol/cil: Account for anonymous category sets in an expression
      secilc/test: Add test for anonymous args
      libsepol: Quote paths when generating policy.conf from binary policy
      libsepol/cil: Allow duplicate optional blocks in most cases
      libsepol/cil: Properly check for loops in sets
      libsepol/cil: Fix syntax checking of defaultrange rule
      libsepol/cil: Check for empty list when marking neverallow attributes
      libsepol/cil: Reduce the initial symtab sizes for blocks
      libsepol/cil: Improve degenerate inheritance check
      libsepol/cil: Add function to determine if a subtree has a declaration
      libsepol/cil: Only reset AST if optional has a declaration
      libsepol/cil: Provide option to allow qualified names in declarations
      secilc: Add support for using qualified names to secilc
      libsepol/cil: Add support for using qualified names to secil2tree
      libsepol/cil: Add support for using qualified names to secil2conf
      libsepol/cil: Improve checking for bad inheritance patterns
      libsepol/cil: Fix handling category sets in an expression
      libsepol/cil: Check syntax of src_info statement
      libsepol/cil: Check the token type after getting the next token
      libsepol/cil: Check for valid line mark type immediately
      libsepol/cil: Push line mark state first when processing a line mark
      libsepol/cil: Create common string-to-unsigned-integer functions
      libsepol/cil: Add line mark kind and line number to src info
      libsepol/cil: Report correct high-level language line numbers
      libsepol/cil: When writing AST use line marks for src_info nodes
      libsepol/cil: Allow some duplicate macro and block declarations
      libsepol/cil: Properly check parse tree when printing error messages
      libsepol/cil: Reset expandtypeattribute rules when resetting AST
      libsepol/cil: Properly check for parameter when inserting name
      libsepol/cil: Don't destroy optionals whose parent will be destroyed
      libsepol/cil: Refactor the function __cil_build_ast_node_helper()
      libsepol/cil: Simplify cil_tree_children_destroy()
      libsepol/cil: Improve in-statement to allow use after inheritance
      libsepol/secilc/docs: Update the CIL documentation
      libsepol/cil: Remove redundant syntax checking
      libsepol/cil: Use size_t for len in __cil_verify_syntax()
      libsepol/cil: Fix syntax checking in __cil_verify_syntax()
      libsepol/cil: Add function to get number of items in a stack
      libsepol/cil: Limit the number of active line marks
      libsepol/cil: Free duplicate datums in original calling function
      libsepol/cil: Do not use original type and typeattribute datums
      libsepol/cil: Handle operations in a class mapping when verifying
      libsepol/cil: Limit the amount of reporting for bounds failures
      libsepol/cil: Do not skip macros when resolving until later passes
      libsepol: Fix potential undefined shifts
      libsepol/cil: Fix potential undefined shifts
      checkpolicy: Fix potential undefined shifts
      libselinux: Fix potential undefined shifts

Kelvin Zhang (1):
      Improve error message for label file validation

Micha=C5=82 G=C3=B3rny (1):
      python: Import specific modules from setools for less deps

Nicolas Iooss (20):
      libsepol/cil: make cil_post_fc_fill_data static
      libsepol/cil: remove stray printf
      libsepol/cil: replace printf with proper cil_tree_log
      libsepol/cil: fix NULL pointer dereference in __cil_insert_name
      libsepol/cil: do not leak avrulex_ioctl_table memory when an error oc=
curs
      libsepol: make num_* unsigned int in module_to_cil
      libselinux: do not duplicate make target when going into subdirectory
      libsepol: use checked arithmetic builtin to perform safe addition
      libselinux: silence -Wstringop-overflow warning from gcc 10.3.1
      libsepol/cil: make array cil_sym_sizes const
      libsepol/cil: do not override previous results of __cil_verify_classp=
erms
      libsepol: silence -Wextra-semi-stmt warning
      libselinux: silence -Wextra-semi-stmt warning
      libsemanage: silence -Wextra-semi-stmt warning
      checkpolicy: silence -Wextra-semi-stmt warning
      policycoreutils: silence -Wextra-semi-stmt warning
      mcstrans: silence -Wextra-semi-stmt warning
      libsepol/cil: do not allow \0 in quoted strings
      README: update continuous integration badges
      GitHub Actions: do not use macOS latest runner for now

Ondrej Mosnacek (4):
      policycoreutils/setfiles: do not create useless setfiles.8.man file
      fixfiles: do not exclude /dev and /run in -C mode
      scripts/ci: use F34 image instead of F33
      libsepol/cil: remove obsolete comment

Petr Lautrbach (12):
      libsemanage: Fix USE_AFTER_FREE (CWE-672) in semanage_direct_write_la=
ngext()
      Do not use Python slip
      dbus: Use GLib.MainLoop()
      python/sepolicy: Fix COPY_PASTE_ERROR (CWE-398)
      mcstrans: Improve mlstrans-test output
      libsepol: Fix detected RESOURCE_LEAKs
      Update VERSIONs and Python bindings version to 3.3-rc1 for release
      libsepol/cil: Fix detected RESOURCE_LEAK (CWE-772)
      Update VERSIONs to 3.3-rc2 for release.
      libselinux/semodule: Improve extracting message
      Update VERSIONs to 3.3-rc3 for release.
      Update VERSIONs to 3.3 for release.

Topi Miettinen (2):
      selinux.8: document how mount flag nosuid affects SELinux
      libsepol: fix typo

Yi-Yo Chiang (1):
      secilc.c: Don't fail if input file is empty

