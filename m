Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD54F2FDD3
	for <lists+selinux@lfdr.de>; Thu, 30 May 2019 16:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfE3Ob3 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 30 May 2019 10:31:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:43972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726955AbfE3Ob3 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 30 May 2019 10:31:29 -0400
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 375D225B22
        for <selinux@vger.kernel.org>; Thu, 30 May 2019 14:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559226688;
        bh=t9FNMyuHdKiRj7lNbCFjHjSQ+ossF6GJx2uNN/K/Nqk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TanxQO2eHs1jPHFF+ujiL9pPGiOw95ZuR5Jw7GbGZDBmPGvKg79QrhOPYwjJpAmng
         PtMth2Fx9PdPORT4hPl2E7d5uXJgqsrnQ7hrg1bYALSH368KM2xJ2LQojfMc+xL+DP
         Wo16AAsUzlwoqhqdLm8zOLdmPi4jeJYk2N2rmrXs=
Received: by mail-wm1-f42.google.com with SMTP id f204so121891wme.0
        for <selinux@vger.kernel.org>; Thu, 30 May 2019 07:31:28 -0700 (PDT)
X-Gm-Message-State: APjAAAUL4Vg5AH6uyEIrMObSb+FeL1BkQUq7ANA+gO4bC5SoAzA6LV6X
        nxV+HjKsWwfVEPAYv5WkjkcKztVaaMUOd86SjdUo/A==
X-Google-Smtp-Source: APXvYqwORgGGojbciIM4fBZHz5YhRKo/2ULQ4NI80rS2FJvcS6cz6SrRTtIjmZI7sCvf88uhtvJhxWljXytA/bz2Lfc=
X-Received: by 2002:a7b:c450:: with SMTP id l16mr2110219wmi.0.1559226686610;
 Thu, 30 May 2019 07:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190524175458.GB365@linux.intel.com> <960B34DE67B9E140824F1DCDEC400C0F654E8E1D@ORSMSX116.amr.corp.intel.com>
 <CALCETrUw5sEr-MHPMU4CzEzkrejDs-JOThHB9Buhoxo5-rdpRw@mail.gmail.com>
 <20190524200333.GF365@linux.intel.com> <CALCETrUyAAhnQ+RUeN1L41TKj-vcD2CNt-FJ9siO=Zo6gvH1Aw@mail.gmail.com>
 <20190524224107.GJ365@linux.intel.com> <683B5E3D-AFB6-4B45-8D39-B00847312209@amacapital.net>
 <960B34DE67B9E140824F1DCDEC400C0F654E965F@ORSMSX116.amr.corp.intel.com>
 <CALCETrXXVMutX8eZk6nnkOAeS+Tj0sQd0FkW+wk6Rx8hQxCe6w@mail.gmail.com>
 <960B34DE67B9E140824F1DCDEC400C0F654E9824@ORSMSX116.amr.corp.intel.com>
 <20190528202407.GB13158@linux.intel.com> <285f279f-b500-27f0-ab42-fb1dbcc5ab18@tycho.nsa.gov>
 <960B34DE67B9E140824F1DCDEC400C0F654EB487@ORSMSX116.amr.corp.intel.com> <678a37af-797d-7bd5-a406-32548a270e3d@tycho.nsa.gov>
In-Reply-To: <678a37af-797d-7bd5-a406-32548a270e3d@tycho.nsa.gov>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 30 May 2019 07:31:14 -0700
X-Gmail-Original-Message-ID: <CALCETrWXB9fNNDH7gZxPTx05F78Og6K=ZtAr2aA++BDwY09Wbg@mail.gmail.com>
Message-ID: <CALCETrWXB9fNNDH7gZxPTx05F78Og6K=ZtAr2aA++BDwY09Wbg@mail.gmail.com>
Subject: Re: SGX vs LSM (Re: [PATCH v20 00/28] Intel SGX1 support)
To:     Stephen Smalley <sds@tycho.nsa.gov>
Cc:     "Xing, Cedric" <cedric.xing@intel.com>,
        "Christopherson, Sean J" <sean.j.christopherson@intel.com>,
        William Roberts <bill.c.roberts@gmail.com>,
        Andy Lutomirski <luto@kernel.org>,
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

Hi all-

After an offline discussion with Sean yesterday, here are some updates
to the user API parts of my proposal.

Unfortunately, Sean convinced me that MAXPERM doesn't work the way I
described it because, for SGX2, the enclave loader won't know at load
time whether a given EAUG-ed page will ever be executed.  So here's an
update.

First, here are the requrements as I see them, where EXECUTE, EXECMOD,
and EXECMEM could be substituted with other rules at the LSM's
discretion:

 - You can create a WX or RWX mapping if and only if you have EXECMEM.

 - To create an X mapping of an enclave page that has ever been W, you
need EXECMOD.

 - To create an X mapping of an enclave page that came from EADD, you
need EXECUTE on the source file.  Optionally, we could also permit
this if you have EXECMOD.

And I have two design proposals.  One is static and one is dynamic.
To implement either one, we will probably need a new .may_mprotect vm
operation, and that operation can call an LSM hook.  Or we can give
LSMs a way to detect that a given vm_area_struct is an enclave.  As I
see it, this is an implementation detail that is certainly solveable.


Static proposal:


EADD takes an execute_intent flag.  It calls a new hook:

  int security_enclave_load(struct vm_area_struct *source, bool execute_intent);

This hook will fail if execute_intent==true and the caller has neither
EXECUTE, EXECMOD, nor EXECMEM.

EAUG sets execute_intent = false.

EINIT takes a sigstruct pointer.  SGX can (when initially upstreamed
or later on once there's demand) call a new hook:

  security_enclave_init(struct sigstruct *sigstruct, struct
vm_area_struct *source);

mmap() and mprotect() will require EXECMEM to create WX or RWX
mappings.  They will require EXECMOD to create RX or X mappings of an
execute_intent==false page.  They require no permissions in the other
cases.


Dynamic proposal:


EADD does not take any special flags.  It does something like this internally:

  bool execute_intent = true;
  int security_enclave_load(struct vm_area_struct *source, bool
*execute_intent);

The implementation of security_enclave_load() may set *execute_intent to false.
The driver records execute_intent after the LSM is done.

mmap() and mprotect() will require EXECMEM to create WX or RWX
mappings.  They will require EXECMOD to create RX or X mappings of an
execute_intent==false page.  They require no permissions in the other
cases.



A benefit of the static proposal is that audit failures due to a lack
of EXECUTE permission are easy to implement and to understand in the
lods.  With the dynamic model, we can only really audit the lack of
EXECMOD or EXECMEM.  A benefit of the dynamic model is that we hide
what is arguably a decently large wart from the API.
