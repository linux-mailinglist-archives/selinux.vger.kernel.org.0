Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C20CD1C8B21
	for <lists+selinux@lfdr.de>; Thu,  7 May 2020 14:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbgEGMik (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 7 May 2020 08:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725857AbgEGMik (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 7 May 2020 08:38:40 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8380EC05BD43
        for <selinux@vger.kernel.org>; Thu,  7 May 2020 05:38:40 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id j4so4294951otr.11
        for <selinux@vger.kernel.org>; Thu, 07 May 2020 05:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AHTPgqe64mTU9ole297qTC6janjlOqN8urRXNRQfkas=;
        b=aEQeTLMaBCzGHI0gvsoLUEqDtcrLiwRDjONT7bRPc98PJAmFx4zwUYkxio3uFyCsyt
         alMCsEeatuN0qvEtPZB3puO8Gzc7+sl7+sHF4GDSo0xaQfwbDD12rb9OquWUNgRN9Iv6
         wW6yQiVCRFwaVH1VSBpE+odSp5yec06WJzAVcQvDVh06ROvFQ9JLwy/ckAdTaO52Osgv
         wUiJFq5UMd176MkQUyurIQrzP1SfnVGWRB7QVFYE0fOY0nOImgWkRHQAHYIU8DkIQm4Y
         cqJlacsg88t8nImVSMXN8iz/K7grXcoG+ySmhXgQqW3Z8d2Sk/vxZe8IVooq19dPupqf
         IMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AHTPgqe64mTU9ole297qTC6janjlOqN8urRXNRQfkas=;
        b=IRL2l6ALJoLUNXQ3mFNMH2vsSjrW7eB8B8fNLfGaVh2M39IOHRHApi+BT1jFEGVH6/
         Vt3r8LmOVoiwgRAfM2s9NGNklRGymZ8qxlUXvIkLQihW0cJyV9+ZBHcTR1WZvVk3jU/6
         ++KKXVFsB3NZ4FbKJKbRUCjZysowKdgIDol44M6ANfVBjSNzMVuCG3gJxsueoB1UGsMX
         Ke+YhPvdJqaYHNhD3WwLm9CflOI7OB4j6YcfzUnEVrp8UeJz0AqcAdDxz2r0QxPthZhP
         IF8u6TbTCN+eRCDcydWqR2OL6aSfZmOrYi6QZMR4AIuz2iC/qkjL7s83/E6MisFiZRdm
         4QBw==
X-Gm-Message-State: AGi0Puahv50nFSF1lRZ1LAsspIaWE99me3xestxnOG4D+YE0zRyYfQol
        FjAsiz/+e6Xdi2+5VHCRIDC2HeJB/f5lQFYPZII=
X-Google-Smtp-Source: APiQypLu0o4sESseMzJ3TZeQdmPkS5+4uzD9wbZBjMRapG0s50Yrb311bPEAR1TwMV/FKmNh0r9zTBQDOpvIbCU+MKA=
X-Received: by 2002:a9d:2aa9:: with SMTP id e38mr10602699otb.162.1588855119892;
 Thu, 07 May 2020 05:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200506211435.30296-1-stephen.smalley.work@gmail.com> <CAFqZXNsDv3pmeW-5Knc1bpcN5U3yzFE61JKnNYRU+w2N0W+PzQ@mail.gmail.com>
In-Reply-To: <CAFqZXNsDv3pmeW-5Knc1bpcN5U3yzFE61JKnNYRU+w2N0W+PzQ@mail.gmail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Thu, 7 May 2020 08:38:27 -0400
Message-ID: <CAEjxPJ5wrAfWRBQfaHFCD7Y7UkqPwnpG914Q_S66dF7cDEMa4w@mail.gmail.com>
Subject: Re: [PATCH v2] selinux-testsuite: update to work on Debian
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     SElinux list <selinux@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, May 7, 2020 at 4:26 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> On Wed, May 6, 2020 at 11:14 PM Stephen Smalley
> <stephen.smalley.work@gmail.com> wrote:
> [...]
> > ---
> > v2 improves the patch description and README.md and tries to provide
> > greater compatibility with older systems. NB One must set SUPPORTS_CIL
> > to n to disable loading the CIL modules; the alternative would be
> > some kind of package version test but doing so in a distro-agnostic
> > and backward-compatible manner looks painful.
>
> Thanks! As I said in another reply, I agree that CIL support detection
> wouldn't be worth it here.

I just remembered that we do have the os_detect and
ifeq(x$(DISTRO),... support in the Makefiles,
so I could set SUPPORTS_CIL automatically to n in the RHEL6 case that way.

> > diff --git a/policy/test_execute_no_trans.te b/policy/test_execute_no_trans.te
> > index 79ba868..2c0346a 100644
> > --- a/policy/test_execute_no_trans.te
> > +++ b/policy/test_execute_no_trans.te
> > @@ -24,4 +24,5 @@ userdom_sysadm_entry_spec_domtrans_to(test_execute_notrans_t)
> >
> >  #Allow test_execute_notrans permissions to the allowed type
> >  can_exec(test_execute_notrans_t,test_execute_notrans_allowed_t)
> > -allow test_execute_notrans_t test_execute_notrans_denied_t:file mmap_file_perms;
> > +allow_map(test_execute_notrans_t, test_execute_notrans_denied_t, file)
> > +allow test_execute_notrans_t test_execute_notrans_denied_t:file { getattr open read };
>
> An alternative solution could be to use "mmap_file_perms" unless it is
> not defined, in which case we can assume a non-legacy policy and use
> the proper "mmap_exec_file_perms". But I'm fine with your approach as
> well if you don't want to change it.

This seems a little safer to me given the confusion about what
mmap_exec_file_perms contains but either way.
