Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66EC8350C7
	for <lists+selinux@lfdr.de>; Tue,  4 Jun 2019 22:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfFDUS2 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 4 Jun 2019 16:18:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:53094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbfFDUS2 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 4 Jun 2019 16:18:28 -0400
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBB40208CB
        for <selinux@vger.kernel.org>; Tue,  4 Jun 2019 20:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559679507;
        bh=iG0LtosQD92m9TTWN5JRMbddz/rPfUkoOrLnFTnZQOQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rbONcUbdged+eCYwiMBzEgIiISkpCCnOqZ/4M19YbzaRTOQKMWsCBAxo5+IxafmlK
         34t68z4pDP29OChTaaouHHy6Tiwq2L9QIUePzd+ewplo2OOiZ67f3wAfD1vyAlek/3
         rK7nBAoWHn927V1BRXLPKPfNrMiub2NxnMrBaFLk=
Received: by mail-wr1-f53.google.com with SMTP id o12so10048934wrj.9
        for <selinux@vger.kernel.org>; Tue, 04 Jun 2019 13:18:26 -0700 (PDT)
X-Gm-Message-State: APjAAAWuKBAkKP1KxpfyYeLeYgm3vrA9WO/C9bLzkzgFaFTPSyo54pzX
        sqBR0e34E//ECA85LgMJyMnnequcALGklGpJ17lPWQ==
X-Google-Smtp-Source: APXvYqwRkR9sWPYIMXZS9Q5rRlolzNc9nEBk2wWzs1nb5BIz1g/f+XZVoePL8lZsbJxQ+uA26oNFehMnbw/ZMl7tJOw=
X-Received: by 2002:adf:cc85:: with SMTP id p5mr7455664wrj.47.1559679505381;
 Tue, 04 Jun 2019 13:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190531233159.30992-1-sean.j.christopherson@intel.com>
 <20190531233159.30992-4-sean.j.christopherson@intel.com> <960B34DE67B9E140824F1DCDEC400C0F654ECBBD@ORSMSX116.amr.corp.intel.com>
 <20190603200804.GG13384@linux.intel.com> <20190603203950.GJ13384@linux.intel.com>
In-Reply-To: <20190603203950.GJ13384@linux.intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Tue, 4 Jun 2019 13:18:13 -0700
X-Gmail-Original-Message-ID: <CALCETrUb4X9_L9RXKhmyNpfSCsbNodP=BfbfO8Fz_efq24jp8w@mail.gmail.com>
Message-ID: <CALCETrUb4X9_L9RXKhmyNpfSCsbNodP=BfbfO8Fz_efq24jp8w@mail.gmail.com>
Subject: Re: [RFC PATCH 3/9] x86/sgx: Allow userspace to add multiple pages in
 single ioctl()
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     "Xing, Cedric" <cedric.xing@intel.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        LSM List <linux-security-module@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@parisplace.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        Jethro Beekman <jethro@fortanix.com>,
        "Hansen, Dave" <dave.hansen@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
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
        David Rientjes <rientjes@google.com>,
        "Roberts, William C" <william.c.roberts@intel.com>,
        "Tricca, Philip B" <philip.b.tricca@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Jun 3, 2019 at 1:39 PM Sean Christopherson
<sean.j.christopherson@intel.com> wrote:
>
> On Mon, Jun 03, 2019 at 01:08:04PM -0700, Sean Christopherson wrote:
> > On Sun, Jun 02, 2019 at 11:26:09PM -0700, Xing, Cedric wrote:
> > > > From: Christopherson, Sean J
> > > > Sent: Friday, May 31, 2019 4:32 PM
> > > >
> > > > +/**
> > > > + * sgx_ioc_enclave_add_pages - handler for %SGX_IOC_ENCLAVE_ADD_PAGES
> > > > + *
> > > > + * @filep:       open file to /dev/sgx
> > > > + * @cmd: the command value
> > > > + * @arg: pointer to an &sgx_enclave_add_page instance
> > > > + *
> > > > + * Add a range of pages to an uninitialized enclave (EADD), and
> > > > +optionally
> > > > + * extend the enclave's measurement with the contents of the page (EEXTEND).
> > > > + * The range of pages must be virtually contiguous.  The SECINFO and
> > > > + * measurement maskare applied to all pages, i.e. pages with different
> > > > + * properties must be added in separate calls.
> > > > + *
> > > > + * EADD and EEXTEND are done asynchronously via worker threads.  A
> > > > +successful
> > > > + * sgx_ioc_enclave_add_page() only indicates the pages have been added
> > > > +to the
> > > > + * work queue, it does not guarantee adding the pages to the enclave
> > > > +will
> > > > + * succeed.
> > > > + *
> > > > + * Return:
> > > > + *   0 on success,
> > > > + *   -errno otherwise
> > > > + */
> > > > +static long sgx_ioc_enclave_add_pages(struct file *filep, unsigned int cmd,
> > > > +                               unsigned long arg)
> > > > +{
> > > > + struct sgx_enclave_add_pages *addp = (void *)arg;
> > > > + struct sgx_encl *encl = filep->private_data;
> > > > + struct sgx_secinfo secinfo;
> > > > + unsigned int i;
> > > > + int ret;
> > > > +
> > > > + if (copy_from_user(&secinfo, (void __user *)addp->secinfo,
> > > > +                    sizeof(secinfo)))
> > > > +         return -EFAULT;
> > > > +
> > > > + for (i = 0, ret = 0; i < addp->nr_pages && !ret; i++) {
> > > > +         if (signal_pending(current))
> > > > +                 return -ERESTARTSYS;
> > >
> > > If interrupted, how would user mode code know how many pages have been EADD'ed?
> >
> > Hmm, updating nr_pages would be fairly simple and shouldn't confuse
> > userspace, e.g. as opposed to overloading the return value.
>
> Or maybe update @addr and @src as well?  That would allow userspace to
> re-invoke the ioctl() without having to modify the struct.

If you're going to use -ERESTARTSYS, that's the way to go.  -EINTR
would be an alternative.  A benefit of -ERESTARTSYS is that, with
-EINTR, it wouldn't be that surprising for user code to simply fail to
handle it.
