Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 466A6304B9
	for <lists+selinux@lfdr.de>; Fri, 31 May 2019 00:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbfE3WWY (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 30 May 2019 18:22:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:33602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbfE3WWX (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 30 May 2019 18:22:23 -0400
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62662261E6
        for <selinux@vger.kernel.org>; Thu, 30 May 2019 21:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559251401;
        bh=oq8IWdqTe7Bw3zkTzFHzZXXeKKTFiHHCQoJ8FlQJtDA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sO+/27uEIYIVD27JT/3qbo5sArzvjKlEGCApT/NRFm8PZUybMSDNtYcCNE9AKE3dg
         R0SKX00e65Gnt+OTdg4kxYHTKeMgLxiF3jt4Es+nxN12WHDXEclud4mVoQ4pXA0M9l
         uKy0uqC+kwlmx87W2DHQSPEVOwGRRcRCibMJy/WU=
Received: by mail-wm1-f45.google.com with SMTP id v19so6643312wmh.0
        for <selinux@vger.kernel.org>; Thu, 30 May 2019 14:23:21 -0700 (PDT)
X-Gm-Message-State: APjAAAXc1Jgo8wXA548aq3npzdT2XBxOB1whPUokc1UOFCbUP34tjBVO
        9kXTQ+oy4QEyy/rPRvD5LMHTG2/V28s6ZHbXYBmtTA==
X-Google-Smtp-Source: APXvYqzqp2zMLoO2RDdQMQlKBb7HWmxN353ZRZxh55Vp7c/ony/bJntaxeyf8uLUEQzVh/OwZRtPY3VzT8ksz9FPz1Q=
X-Received: by 2002:a05:600c:489:: with SMTP id d9mr3262525wme.173.1559251399871;
 Thu, 30 May 2019 14:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <960B34DE67B9E140824F1DCDEC400C0F654E9824@ORSMSX116.amr.corp.intel.com>
 <20190528202407.GB13158@linux.intel.com> <285f279f-b500-27f0-ab42-fb1dbcc5ab18@tycho.nsa.gov>
 <960B34DE67B9E140824F1DCDEC400C0F654EB487@ORSMSX116.amr.corp.intel.com>
 <678a37af-797d-7bd5-a406-32548a270e3d@tycho.nsa.gov> <CALCETrWXB9fNNDH7gZxPTx05F78Og6K=ZtAr2aA++BDwY09Wbg@mail.gmail.com>
 <c1135352-0b5e-4694-b1a9-105876095877@tycho.nsa.gov> <CALCETrWsEXzUC33eJpGCpdMCBO4aYVviZLRD-CLMNaG5Jv-TCA@mail.gmail.com>
 <20190530180110.GB23930@linux.intel.com> <CALCETrX2PgUc_jetXHqp85aaS0a0jHB8E7=T1rsW+5vyRgwnUA@mail.gmail.com>
 <20190530211645.GB27551@linux.intel.com>
In-Reply-To: <20190530211645.GB27551@linux.intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 30 May 2019 14:23:07 -0700
X-Gmail-Original-Message-ID: <CALCETrVAoDppmdJzkpwagt3q64M-QpNajXbKGR1yQdqyofeANQ@mail.gmail.com>
Message-ID: <CALCETrVAoDppmdJzkpwagt3q64M-QpNajXbKGR1yQdqyofeANQ@mail.gmail.com>
Subject: Re: SGX vs LSM (Re: [PATCH v20 00/28] Intel SGX1 support)
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     Andy Lutomirski <luto@kernel.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        "Xing, Cedric" <cedric.xing@intel.com>,
        William Roberts <bill.c.roberts@gmail.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        LSM List <linux-security-module@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@parisplace.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        Jethro Beekman <jethro@fortanix.com>,
        "Hansen, Dave" <dave.hansen@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Dr. Greg" <greg@enjellic.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "nhorman@redhat.com" <nhorman@redhat.com>,
        "npmccallum@redhat.com" <npmccallum@redhat.com>,
        "Ayoun, Serge" <serge.ayoun@intel.com>,
        "Katz-zamir, Shay" <shay.katz-zamir@intel.com>,
        "Huang, Haitao" <haitao.huang@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Svahn, Kai" <kai.svahn@intel.com>, Borislav Petkov <bp@alien8.de>,
        Josh Triplett <josh@joshtriplett.org>,
        "Huang, Kai" <kai.huang@intel.com>,
        David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, May 30, 2019 at 2:16 PM Sean Christopherson
<sean.j.christopherson@intel.com> wrote:
>
> On Thu, May 30, 2019 at 12:20:45PM -0700, Andy Lutomirski wrote:
> > On Thu, May 30, 2019 at 11:01 AM Sean Christopherson
> > <sean.j.christopherson@intel.com> wrote:
> > >
> > > On Thu, May 30, 2019 at 09:14:10AM -0700, Andy Lutomirski wrote:
> > > > Enclave file -- that is, the file backing the vma from which the data is loaded.
> > >
> > > It wasn't explicitly called out in Andy's proposal(s), but the idea is
> > > that the SGX driver would effectively inherit permissions from the source
> > > VMA (EADD needs a source for the initial value of the encave page).
> >
> > I actually meant for it to *not* work like this.  I don't want the
> > source VMA to have to be VM_EXEC.  I think the LSM should just check
> > permissions on ->vm_file.
>
> But if ->vm_file is NULL, i.e. the enclave is not backed by a file,
> then PROCESS__EXECMEM is required (or more likely, ENCLAVE__EXECMEM).
>

If ->vm_file is NULL, then I think some privilege is needed.  I
suppose the policy could have a new lesser permission EXECUNTRUSTED
which is like EXECMOD but you can't modify it.  I'm not convinced this
is particular important.
