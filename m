Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 938AE3686F4
	for <lists+selinux@lfdr.de>; Thu, 22 Apr 2021 21:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236459AbhDVTMh (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 22 Apr 2021 15:12:37 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:50507 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236058AbhDVTMh (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 22 Apr 2021 15:12:37 -0400
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id A181B561202
        for <selinux@vger.kernel.org>; Thu, 22 Apr 2021 21:12:00 +0200 (CEST)
Received: by mail-pf1-f171.google.com with SMTP id h15so14717556pfv.2
        for <selinux@vger.kernel.org>; Thu, 22 Apr 2021 12:12:00 -0700 (PDT)
X-Gm-Message-State: AOAM531CYJae8ERN42pR7ccRmMslFRVJir9ay4R/Z17oQ2VaVv9VhRfz
        knuryIM6scNtw0WfrPFfVW2DGvlQ6hThltZGtnY=
X-Google-Smtp-Source: ABdhPJyvK/fhVdgkl5GbrK01yQ2IuKu5XEcjgjhC6nsaGcS8ZPvlV9LozLl+fPS0Q4PE3rvjjd4UWBHuP21IxpuxS+U=
X-Received: by 2002:a63:1c54:: with SMTP id c20mr181569pgm.210.1619118719394;
 Thu, 22 Apr 2021 12:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210421172112.13277-1-jwcart2@gmail.com> <CAJfZ7=kL1A3xtCLBC=LhxAtRfmkehit5f3retC6jOJuzbC958A@mail.gmail.com>
In-Reply-To: <CAJfZ7=kL1A3xtCLBC=LhxAtRfmkehit5f3retC6jOJuzbC958A@mail.gmail.com>
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
Date:   Thu, 22 Apr 2021 21:11:48 +0200
X-Gmail-Original-Message-ID: <CAJfZ7=kQhj5BPUMhGsLO0zF+kDNRpAT0jz844KReTMd_FmU5rQ@mail.gmail.com>
Message-ID: <CAJfZ7=kQhj5BPUMhGsLO0zF+kDNRpAT0jz844KReTMd_FmU5rQ@mail.gmail.com>
Subject: Re: [PATCH 0/3 v3] Create secil2tree to write CIL AST
To:     James Carter <jwcart2@gmail.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Thu Apr 22 21:12:01 2021 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000437, queueID=1E7D9561209
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Apr 21, 2021 at 11:01 PM Nicolas Iooss <nicolas.iooss@m4x.org> wrote:
>
> On Wed, Apr 21, 2021 at 7:21 PM James Carter <jwcart2@gmail.com> wrote:
> >
> > For debugging purposes it would be useful to be able to write out
> > the CIL AST at various points in the build process.
> >
> > This patch set creates secil2tree which can write the CIL parse tree,
> > the CIL AST after the build phase, or the CIL AST after the resolve
> > phase (with names fully-qualified).
> >
> > Within CIL the function cil_print_tree() has existed from early in
> > CIL's development, but it was not exported in libsepol and there was no
> > way to use it except by adding a call to it where you wanted to print
> > out the CIL AST and then recompiling everything. It also used cil_log()
> > as its output, so other messages could be mixed in with the output. This
> > patch set moves all of this code to its own file, updates it, renames it
> > as cil_write_ast(), and adds libsepol functions that can be used to call
> > it after each one of the phases mentioned above.
> >
> > Both the parse and build CIL AST are valid CIL policies that can be
> > compiled with secilc, but the resolve CIL AST is not always a valid CIL
> > policy. The biggest problem is that fully-qualified names can contain
> > dots and CIL does not allow dots in declaration names. There are other
> > problems as well. It would be nice to get to the point where the output
> > for all of the trees are valid CIL, but that is a goal for the future.
> >
> > v3:
> > - -use "-ast-phase=<phase>" in the usage message and man pages instead
> > of "-ast-phase <phase>"
> >
> > v2:
> > - Remove whitespace errors in cil_write_ast.h
> > - Use "const char*" instead of just "char*" when dealing with string
> > literals to satisfy clang.
> >
> > James Carter (3):
> >   libsepol/cil: Create functions to write the CIL AST
> >   libsepol/cil: Add functions to make use of cil_write_ast()
> >   secilc: Create the new program called secil2tree to write out CIL AST
> >
> >  libsepol/cil/include/cil/cil.h   |    3 +
> >  libsepol/cil/src/cil.c           |   92 ++
> >  libsepol/cil/src/cil_tree.c      | 1471 ----------------------------
> >  libsepol/cil/src/cil_tree.h      |    2 -
> >  libsepol/cil/src/cil_write_ast.c | 1573 ++++++++++++++++++++++++++++++
> >  libsepol/cil/src/cil_write_ast.h |   46 +
> >  libsepol/src/libsepol.map.in     |    3 +
> >  secilc/.gitignore                |    2 +
> >  secilc/Makefile                  |   20 +-
> >  secilc/secil2tree.8.xml          |   81 ++
> >  secilc/secil2tree.c              |  206 ++++
> >  11 files changed, 2024 insertions(+), 1475 deletions(-)
> >  create mode 100644 libsepol/cil/src/cil_write_ast.c
> >  create mode 100644 libsepol/cil/src/cil_write_ast.h
> >  create mode 100644 secilc/secil2tree.8.xml
> >  create mode 100644 secilc/secil2tree.c
> >
> > --
> > 2.26.3
> >
>
> I indeed missed the v2, sorry for this.
> These patches look good to me, thanks!
>
> Acked-by: Nicolas Iooss <nicolas.iooss@m4x.org>

... and merged. Thanks again!

Nicolas

