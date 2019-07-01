Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8101E3B9CA
	for <lists+selinux@lfdr.de>; Mon, 10 Jun 2019 18:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbfFJQpK (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 10 Jun 2019 12:45:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:51206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726781AbfFJQpK (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 10 Jun 2019 12:45:10 -0400
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B2A9C2146E
        for <selinux@vger.kernel.org>; Mon, 10 Jun 2019 16:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560185108;
        bh=Y8E+4PLVaGcBC0QnRuAjUawfq3/72hXoE582Tg5tIuw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J6HRPNNWuT4LA6l5MNHQZ+sRmWPpcNrrf9JUFPeKcbzU0CkUBtn/xFRSTx0+NY6uf
         vPexidZG/FjkmyoqpoLwiDazEMcHkIk/ffRkl05K1WlkgtxNOc4UV+rBCJvbbB9Fmg
         Wa+Wo4qXzj14suHaq7aB2GCf5ZoQO5x3HwpaEGb8=
Received: by mail-wr1-f54.google.com with SMTP id b17so9879007wrq.11
        for <selinux@vger.kernel.org>; Mon, 10 Jun 2019 09:45:08 -0700 (PDT)
X-Gm-Message-State: APjAAAW+oCmhOxMAyAphGVQWdCsRNH+rrEj5t6pvAjlABz8RsD4hBdcb
        MB8G6LpHFZ9KpFd0gClDiwMa2faROQkiGBDSUoi8/Q==
X-Google-Smtp-Source: APXvYqzYkr99eA23CbFFE0bAMXptfrueXWcrQU2TMu+R/pORoCW0lJCU07jWbIkOi7KgS2qyV0BaNVqRqxtywNB94M0=
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr19532206wrt.343.1560185107248;
 Mon, 10 Jun 2019 09:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190606021145.12604-1-sean.j.christopherson@intel.com>
 <20190606021145.12604-4-sean.j.christopherson@intel.com> <20190610160005.GC3752@linux.intel.com>
In-Reply-To: <20190610160005.GC3752@linux.intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Mon, 10 Jun 2019 09:44:55 -0700
X-Gmail-Original-Message-ID: <CALCETrVovr8XNZSroey7pHF46O=kj_c5D9K8h=z2T_cNrpvMig@mail.gmail.com>
Message-ID: <CALCETrVovr8XNZSroey7pHF46O=kj_c5D9K8h=z2T_cNrpvMig@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] x86/sgx: Enforce noexec filesystem restriction
 for enclaves
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Sean Christopherson <sean.j.christopherson@intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Cedric Xing <cedric.xing@intel.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        LSM List <linux-security-module@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@parisplace.org>, selinux@vger.kernel.org,
        Jethro Beekman <jethro@fortanix.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>,
        linux-sgx@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>, nhorman@redhat.com,
        npmccallum@redhat.com, Serge Ayoun <serge.ayoun@intel.com>,
        Shay Katz-zamir <shay.katz-zamir@intel.com>,
        Haitao Huang <haitao.huang@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kai Svahn <kai.svahn@intel.com>,
        Borislav Petkov <bp@alien8.de>,
        Josh Triplett <josh@joshtriplett.org>,
        Kai Huang <kai.huang@intel.com>,
        David Rientjes <rientjes@google.com>,
        William Roberts <william.c.roberts@intel.com>,
        Philip Tricca <philip.b.tricca@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Jun 10, 2019 at 9:00 AM Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Wed, Jun 05, 2019 at 07:11:43PM -0700, Sean Christopherson wrote:
> > +             goto out;
> > +     }
> > +
> > +     /*
> > +      * Query VM_MAYEXEC as an indirect path_noexec() check (see do_mmap()),
> > +      * but with some future proofing against other cases that may deny
> > +      * execute permissions.
> > +      */
> > +     if (!(vma->vm_flags & VM_MAYEXEC)) {
> > +             ret = -EACCES;
> > +             goto out;
> > +     }
> > +
> > +     if (copy_from_user(dst, (void __user *)src, PAGE_SIZE))
> > +             ret = -EFAULT;
> > +     else
> > +             ret = 0;
> > +
> > +out:
> > +     up_read(&current->mm->mmap_sem);
> > +
> > +     return ret;
> > +}
>
> I would suggest to express the above instead like this for clarity
> and consistency:
>
>                 goto err_map_sem;
>         }
>
>         /* Query VM_MAYEXEC as an indirect path_noexec() check
>          * (see do_mmap()).
>          */
>         if (!(vma->vm_flags & VM_MAYEXEC)) {
>                 ret = -EACCES;
>                 goto err_mmap_sem;
>         }
>
>         if (copy_from_user(dst, (void __user *)src, PAGE_SIZE)) {
>                 ret = -EFAULT;
>                 goto err_mmap_sem;
>         }
>
>         return 0;
>
> err_mmap_sem:
>         up_read(&current->mm->mmap_sem);
>         return ret;
> }
>
> The comment about future proofing is unnecessary.
>

I'm also torn as to whether this patch is needed at all.  If we ever
get O_MAYEXEC, then enclave loaders should use it to enforce noexec in
userspace.  Otherwise I'm unconvinced it's that special.
