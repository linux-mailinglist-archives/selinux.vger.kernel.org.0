Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2D22D76FF
	for <lists+selinux@lfdr.de>; Fri, 11 Dec 2020 14:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389094AbgLKNys (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 11 Dec 2020 08:54:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28936 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389085AbgLKNyR (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 11 Dec 2020 08:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607694769;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=McbzNJKLjS5eNKzrMUPh514GJ+x78hH++NEC0txV928=;
        b=HeO+2L9OA/VifyaDcMMCX2pY4gIWCyhozN/DZf963KAa7goTKZIq/vXel/4c9kh1p7CkBs
        iqc1Vz9brRSjN9tTZkuEul9u3JBCvIMuw+TF8wXPwP6tWl8ON+tQO8eLtJ/lNLC147Y+/r
        jG+fflTxJAgW2eetODGdJ3gwYBSN6vk=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-oUxLqx00OTqYN5kKKfCB_A-1; Fri, 11 Dec 2020 08:52:48 -0500
X-MC-Unique: oUxLqx00OTqYN5kKKfCB_A-1
Received: by mail-lf1-f72.google.com with SMTP id a10so2699541lfg.13
        for <selinux@vger.kernel.org>; Fri, 11 Dec 2020 05:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=McbzNJKLjS5eNKzrMUPh514GJ+x78hH++NEC0txV928=;
        b=hv+O73kia3ug2EkNp1VmE0wyNPHrkUajl9093aJOc3lgUI6mQdd4lveouDmvdebhLx
         fswrSuIWv8a3FfQwZyS7Fn3+zFMJcweROPjsOO9aPToC3SszgJgAf9DHSA9GBIxxyf1g
         +zvxWiRXgaWHyBjOMVcs0/Jp6CCBZ5nAmnh0Vcm3AUHUVv1iFjLWOymFu/2OkgEhfavx
         jjq833BpDozhb/jFyjmjnjZX1EHLNqmebX571GM9kXkbKXULiMqadNvrFn//Gp3mlvTL
         5qnUjeO+eIqNQOFGKtPJg7dzfpslyfK+qtse3ngjoEvwTvo+40ckLjEV/LlG3ZHrDOJn
         pypA==
X-Gm-Message-State: AOAM532eDGYd1GbMjRANSg8BGsD54Omqera0z7cM/A9OLnDEE6gUwH+m
        5sek7mSH2jkDFnzahiffvS0aKH+yQ4U2JFmEeQ/Tkug1UfzvUOreXHTNS2mmNaAKQin/30AjsZC
        gEOFx9qtlw2J6bvTO0XenUaK35XToR5G+Og==
X-Received: by 2002:a2e:6e06:: with SMTP id j6mr5047402ljc.282.1607694765598;
        Fri, 11 Dec 2020 05:52:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaelgDPinBKbkkPWT9zPiBFEWrCZYndSKpehuryXyKtc4SUfWxCYGKUQ7QD0xUb3UoAHNZq17GSwfTzOe870c=
X-Received: by 2002:a2e:6e06:: with SMTP id j6mr5047392ljc.282.1607694765285;
 Fri, 11 Dec 2020 05:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20201125125402.211692-1-lokeshgidra@google.com>
 <CAFqZXNsry1zqGND-iBaYmwb_KeCvoat-LQFywf04TAp998sqXQ@mail.gmail.com>
 <CA+EESO7KW+ixSoFKOE_aH7P=rgUSuOL6y6TZfg_4Pez-Caw8LA@mail.gmail.com>
 <CAFqZXNtYVrE2GWQtWhTMt2zTKkPaAeZtw95cvuRR9_DbDmKoCA@mail.gmail.com> <CA+EESO4EL3ZE4J-Xyoky5fz=nC7WYp3H8eCfKom7hBfkO=FiDg@mail.gmail.com>
In-Reply-To: <CA+EESO4EL3ZE4J-Xyoky5fz=nC7WYp3H8eCfKom7hBfkO=FiDg@mail.gmail.com>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Fri, 11 Dec 2020 14:52:32 +0100
Message-ID: <CAFqZXNvbGgQVtx3pCX_YyQj6tH7ctb97+8wqryaDjkBtp5BuKw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] selinux-testsuite: Add userfaultfd test
To:     Lokesh Gidra <lokeshgidra@google.com>
Cc:     Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        SElinux list <selinux@vger.kernel.org>,
        Kalesh Singh <kaleshsingh@google.com>,
        Calin Juravle <calin@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Jeff Vander Stoep <jeffv@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Dec 11, 2020 at 2:40 PM Lokesh Gidra <lokeshgidra@google.com> wrote:
> On Fri, Dec 11, 2020 at 1:11 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> >
> > On Fri, Dec 11, 2020 at 1:52 AM Lokesh Gidra <lokeshgidra@google.com> wrote:
> > > Hi Ondrej,
> > > On Fri, Nov 27, 2020 at 6:09 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> > > >
> > > > Hi Lokesh,
> > > >
> > > > On Wed, Nov 25, 2020 at 1:54 PM Lokesh Gidra <lokeshgidra@google.com> wrote:
> > > > > Confirm SELinux policies are enforced on userfaultfd operations
> > > > > via secure anon-inode interface.
> > > > >
> > > > > Signed-off-by: Lokesh Gidra <lokeshgidra@google.com>
> > > > > ---
> > > > >  policy/Makefile                 |  2 +-
> > > > >  policy/userfaultfd.cil          | 17 ++++++++++++
> > > > >  tests/Makefile                  |  2 +-
> > > > >  tests/userfaultfd/Makefile      |  3 ++
> > > > >  tests/userfaultfd/test          | 15 ++++++++++
> > > > >  tests/userfaultfd/userfaultfd.c | 49 +++++++++++++++++++++++++++++++++
> > > > >  6 files changed, 86 insertions(+), 2 deletions(-)
> > > > >  create mode 100644 policy/userfaultfd.cil
> > > > >  create mode 100644 tests/userfaultfd/Makefile
> > > > >  create mode 100755 tests/userfaultfd/test
> > > > >  create mode 100644 tests/userfaultfd/userfaultfd.c
> > > > >
> > > > > diff --git a/policy/Makefile b/policy/Makefile
> > > > > index 6c49091..02e7568 100644
> > > > > --- a/policy/Makefile
> > > > > +++ b/policy/Makefile
> > > > > @@ -36,7 +36,7 @@ SUPPORTS_CIL = n
> > > > >  endif
> > > > >
> > > > >  ifeq ($(SUPPORTS_CIL),y)
> > > > > -CIL_TARGETS = test_mlsconstrain.cil test_overlay_defaultrange.cil
> > > > > +CIL_TARGETS = test_mlsconstrain.cil test_overlay_defaultrange.cil userfaultfd.cil
> > > > >  ifeq ($(shell [ $(MAX_KERNEL_POLICY) -ge 32 ] && echo true),true)
> > > > >  ifeq ($(shell [ $(POL_VERS) -ge 32 ] && echo true),true)
> > > > >  # If other MLS tests get written this can be moved outside of the glblub test
> > > > > diff --git a/policy/userfaultfd.cil b/policy/userfaultfd.cil
> > > > > new file mode 100644
> > > > > index 0000000..0743fff
> > > > > --- /dev/null
> > > > > +++ b/policy/userfaultfd.cil
> > > > > @@ -0,0 +1,17 @@
> > > > > +(class anon_inode ())
> > > > > +(classcommon anon_inode file)
> > > > > +(classorder (unordered anon_inode))
> > > > > +(type uffd_t)
> > > > > +; Label the UFFD with uffd_t; this can be specialized per domain
> > > > > +(typetransition unconfined_t unconfined_t anon_inode "[userfaultfd]"    uffd_t)
> > > > > +(allow unconfined_t uffd_t (anon_inode (create)))
> > > > > +; Permit read() and ioctl() on the UFFD;
> > > > > +; Comment out if you want to test read or basic ioctl enforcement.
> > > > > +(allow unconfined_t uffd_t (anon_inode (read)))
> > > > > +(allow unconfined_t uffd_t (anon_inode (ioctl)))
> > > > > +; Uncomment one of the allowx lines below to test ioctl whitelisting.
> > > > > +; Currently the first one is uncommented; comment that out if trying another.
> > > > > +; None
> > > > > +;(allowx unconfined_t uffd_t (ioctl anon_inode ((0x00))))
> > > > > +; UFFDIO_API
> > > > > +(allowx unconfined_t uffd_t (ioctl anon_inode ((0xaa3f))))
> > > > > diff --git a/tests/Makefile b/tests/Makefile
> > > > > index 4c00b5f..3871570 100644
> > > > > --- a/tests/Makefile
> > > > > +++ b/tests/Makefile
> > > > > @@ -27,7 +27,7 @@ SUBDIRS:= domain_trans entrypoint execshare exectrace execute_no_trans \
> > > > >         task_setnice task_setscheduler task_getscheduler task_getsid \
> > > > >         task_getpgid task_setpgid file ioctl capable_file capable_net \
> > > > >         capable_sys dyntrans dyntrace bounds nnp_nosuid mmap unix_socket \
> > > > > -       inet_socket overlay checkreqprot mqueue mac_admin atsecure
> > > > > +       inet_socket overlay checkreqprot mqueue mac_admin atsecure userfaultfd
> > > > >
> > > > >  ifeq ($(shell grep -q cap_userns $(POLDEV)/include/support/all_perms.spt && echo true),true)
> > > > >  ifneq ($(shell ./kvercmp $$(uname -r) 4.7),-1)
> > > > > diff --git a/tests/userfaultfd/Makefile b/tests/userfaultfd/Makefile
> > > > > new file mode 100644
> > > > > index 0000000..66d02a1
> > > > > --- /dev/null
> > > > > +++ b/tests/userfaultfd/Makefile
> > > > > @@ -0,0 +1,3 @@
> > > > > +all: userfaultfd
> > > > > +clean:
> > > > > +       rm -f userfaultfd
> > > > > diff --git a/tests/userfaultfd/test b/tests/userfaultfd/test
> > > > > new file mode 100755
> > > > > index 0000000..dd42aa8
> > > > > --- /dev/null
> > > > > +++ b/tests/userfaultfd/test
> > > > > @@ -0,0 +1,15 @@
> > > > > +#!/usr/bin/perl
> > > > > +
> > > > > +use Test;
> > > > > +
> > > > > +BEGIN {
> > > > > +    plan tests => 1;
> > > > > +}
> > > > > +
> > > > > +$basedir = $0;
> > > > > +$basedir =~ s|(.*)/[^/]*|$1|;
> > > > > +
> > > > > +$result = system("$basedir/userfaultfd");
> > > > > +ok( $result, 0 );
> > > >
> > > > This is a good start, but it is only a very basic test :)
> > > >
> > > > I would expect at least these tests here:
> > > > 1. that an userfaultfd node created by a domain *without* the
> > > > transition rule gets the context of the creating process (should be
> > > > possible by calling fgetxattr(2) on the fd),
> > > > 2. that an userfaultfd node created by a domain *with* the transition
> > > > rule gets the context specified by the rule,
> > > > 3. that a process with context that is *allowed* to { create read
> > > > write [...] } a given userfaultfd type by the policy *can* indeed
> > > > successfully perform these operations (or at least that the error
> > > > returned is not -EACCESS),
> > > > 4. that a process with context that is *NOT allowed* to { create read
> > > > write [...] } a given userfaultfd type by the policy *cannot* perform
> > > > these operations and the error returned is -EACCESS.
> > > >
> > > > (The more permissions you can test the better, but I'd like to see at
> > > > least the three (create, read, write).)
> > > >
> > > > For this, you will need to define several process types in the test
> > > > policy and run the test program(s) with a specific type using runcon
> > > > (see e.g. policy/test_link.te and tests/link/test for a simple
> > > > example). I suggest using the CIL module only for adding the class and
> > > > permissions and a separate .te file to define the process and
> > > > userfaultfd types (so that you can use the unconfined_runs_test()
> > > > interface for common permissions needed for the process types).
> > > >
> > > I'm having a bit of a hard time managing the test policy in a cil
> > > module and a .te file. My inexperience with SELinux could be a reason
> > > :)
> > >
> > > I defined 'anon_inode' class, like in this patch in the CIL module as follows:
> > > (class anon_inode ())
> > > (classcommon anon_inode file)
> > > (classorder (unordered anon_inode))
> > >
> > > But then when I used anon_inode in the .te file as follows:
> > > ...
> > > type uffd_t;
> > > type_transition test_userfaultfd_t test_userfaultfd_t : anon_inode
> > > uffd_t "[userfaultfd]";
> > > allow test_userfaultfd_t uffd_t:anon_inode { create ioctl read };
> > >
> > > I get a compile error:
> > > test_policy.te:<line#>:ERROR 'unknown class anon_inode' at token ';' on line ...
> > >
> > > Any advice on where I am making mistakes?
> >
> > Ouch! No, the mistake is mine :) I forgot that the classes/permissions
> > added via CIL won't be available in the refpolicy build
> > infrastructure... But I think it should be possible to define the
> > types and add basic rules for them in .te and only add the necessary
> > userfaultfd rules in the .cil file:
> >
> > test_userfaultfd_newclass.cil:
> > ```
> > (class anon_inode ())
> > (classcommon anon_inode file)
> > (classorder (unordered anon_inode))
> > (typeattributeset cil_gen_require test_userfaultfd_t)
> > (typeattributeset cil_gen_require uffd_t)
> > (typetransition test_userfaultfd_t test_userfaultfd_t anon_inode
> > "[userfaultfd]" uffd_t)
> > (allow test_userfaultfd_t uffd_t (anon_inode (create ioctl read)))
> > [...]
> > ```
> >
> > test_userfaultfd.te:
> > ```
> > type uffd_t;
> > type test_userfaultfd_t;
> > domain_type(test_userfaultfd_t)
> > unconfined_runs_test(test_userfaultfd_t)
> > typeattribute test_userfaultfd_t testdomain;
> > [...]
> > ```
> >
> Thanks for your prompt reply.
>
> IIUC, if I have to add policy for another process (say without read
> permission), I''ll have to add the following lines in addition to the
> above lines right:
>
> in test_userfaultfd_newclass.cil
> ```
> (typeattributeset cil_gen_require test_noread_userfaultfd_t)
> (typetransition test_noread_userfaultfd_t test_noread_userfaultfd_t
> anon_inode "[userfaultfd]" uffd_t)
> (allow test_noread_userfaultfd_t uffd_t (anon_inode (create ioctl)))
> [...]
> ```
> and in test_userfaultfd.te
> ```
> type test_noread_userfaultfd_t;
> domain_type(test_noread_userfaultfd_t)
> unconfined_runs_test(test_noread_userfaultfd_t)
> typeattribute test_noread_userfaultfd_t testdomain;
> [...]
> ```
>
> Basically, in order to be able to use domain_type() and
> unconfined_runs_test() interface, I need to write part of the policy
> in the .te file. Is that right?

Yes, exactly.

>
> > We don't have an established way of handling the testing of new
> > classes/permissions in the testsuite before they are defined in the
> > distribution policy, but I think we could try this way here. The
> > downside is that the rules are not in one place, but we can later
> > merge everything into one .te file once the new class is widely
> > available in the distribution policies.
> >
> > > > You will likely also need to communicate different locations of
> > > > failures / error codes from the test program(s) to the script via exit
> > > > code. See tests/keys for an example of such pattern (though you can
> > > > use a different approach as long as it gets the job done :)
> > > >
> > > > Sorry for requiring all the effort, but we're trying to keep
> > > > reasonably high standards for tests here. It's sometimes a PITA, but
> > > > it pays off in the long run ;)
> > > >
> > > > Thanks,
> > > >
> > > > > +
> > > > > +exit;
> > > > > diff --git a/tests/userfaultfd/userfaultfd.c b/tests/userfaultfd/userfaultfd.c
> > > > > new file mode 100644
> > > > > index 0000000..9baebd9
> > > > > --- /dev/null
> > > > > +++ b/tests/userfaultfd/userfaultfd.c
> > > > > @@ -0,0 +1,49 @@
> > > > > +#include <stdio.h>
> > > > > +#include <fcntl.h>
> > > > > +#include <unistd.h>
> > > > > +
> > > > > +#include <sys/types.h>
> > > > > +#include <sys/ioctl.h>
> > > > > +#include <sys/syscall.h>
> > > > > +
> > > > > +#include <linux/userfaultfd.h>
> > > > > +
> > > > > +void print_api(const struct uffdio_api *api)
> > > > > +{
> > > > > +       printf("api: %llu\n", api->api);
> > > > > +       printf("features: %llu\n", api->features);
> > > > > +       printf("ioctls: %llu\n", api->ioctls);
> > > > > +
> > > > > +       printf("\n");
> > > > > +}
> > > > > +
> > > > > +int main (void)
> > > > > +{
> > > > > +       long uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
> > > > > +       if (uffd < 0) {
> > > > > +               perror("syscall(userfaultfd)");
> > > > > +               return -1;
> > > > > +       }
> > > > > +
> > > > > +       struct uffdio_api api = {0};
> > > > > +       api.api = UFFD_API;
> > > > > +       if (ioctl(uffd, UFFDIO_API, &api) < 0) {
> > > > > +               perror("UFFDIO_API");
> > > > > +               return -1;
> > > > > +       }
> > > > > +
> > > > > +       print_api(&api);
> > > > > +
> > > > > +       struct uffd_msg msg = {0};
> > > > > +       ssize_t count = read(uffd, &msg, sizeof(msg));
> > > > > +       if (count < 0) {
> > > > > +               // Expected to fail as no memory range registered.
> > > > > +               return 0;
> > > > > +       } else if (count == 0) {
> > > > > +               printf("read EOF\n\n");
> > > > > +       }
> > > > > +
> > > > > +       printf("read uffd\n\n");
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > --
> > > > > 2.28.0
> > > > >
> > > >
> > > > --
> > > > Ondrej Mosnacek
> > > > Software Engineer, Platform Security - SELinux kernel
> > > > Red Hat, Inc.
> > > >
> > >
> >
> >
> > --
> > Ondrej Mosnacek
> > Software Engineer, Platform Security - SELinux kernel
> > Red Hat, Inc.
> >
>


-- 
Ondrej Mosnacek
Software Engineer, Platform Security - SELinux kernel
Red Hat, Inc.

