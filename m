Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B379121158
	for <lists+selinux@lfdr.de>; Fri, 17 May 2019 02:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbfEQAfa (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 16 May 2019 20:35:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:47854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727215AbfEQAfa (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 16 May 2019 20:35:30 -0400
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 762A821783
        for <selinux@vger.kernel.org>; Fri, 17 May 2019 00:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558053329;
        bh=niIKH4botxbpWeWqvmcPwLDMSSafV2ChSNsYdIe+iGo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OPNb+7w9EXpQrLSrg2I5dPykVkZZJHXC3F41CUHkpgBwZ50z9slGV2cYrRzxgMQ7h
         FzYo91c6FoeuFlTvFDJicBqjNF5m/d1nSgEQ/l3vrWwt1WdWQPVLlSN+SMCMJESf9g
         TDJOMq4p357K3UE7XLF9nNWw9YI3KlNL7Q6JZuXE=
Received: by mail-wm1-f44.google.com with SMTP id y3so5265908wmm.2
        for <selinux@vger.kernel.org>; Thu, 16 May 2019 17:35:29 -0700 (PDT)
X-Gm-Message-State: APjAAAWU6CNkiDPAiPM/3Dz9rwS9pvDFrbXIbtqIghWmf0XwAn8kYzFL
        lNI/H9avscDnO5Zak6GtInU+18bhgyEijIfTUDTcyg==
X-Google-Smtp-Source: APXvYqwDcoGXimRaQPDsB3UlkhfxsRLkjKo5DiID5CYxx1g0XnlkVwMsC8ObS5vjAqIABzp4jbNhNRoniOEDgPQIhNk=
X-Received: by 2002:a7b:c084:: with SMTP id r4mr93634wmh.14.1558053327909;
 Thu, 16 May 2019 17:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <8fe520bb-30bd-f246-a3d8-c5443e47a014@intel.com>
 <358e9b36-230f-eb18-efdb-b472be8438b4@fortanix.com> <960B34DE67B9E140824F1DCDEC400C0F4E886094@ORSMSX116.amr.corp.intel.com>
 <6da269d8-7ebb-4177-b6a7-50cc5b435cf4@fortanix.com> <CALCETrWCZQwg-TUCm58DVG43=xCKRsMe1tVHrR8vdt06hf4fWA@mail.gmail.com>
 <20190513102926.GD8743@linux.intel.com> <20190514104323.GA7591@linux.intel.com>
 <CALCETrVbgTCnPo=PAq0-KoaRwt--urrPzn==quAJ8wodCpkBkw@mail.gmail.com>
 <20190514204527.GC1977@linux.intel.com> <CALCETrX6aL367mMJh5+Y1Seznfu-AvhPV6P7GkWF4Dhu0GV8cw@mail.gmail.com>
 <20190515013031.GF1977@linux.intel.com> <CALCETrXf8mSK45h7sTK5Wf+pXLVn=Bjsc_RLpgO-h-qdzBRo5Q@mail.gmail.com>
 <alpine.LRH.2.21.1905160543070.19802@namei.org> <CALCETrX_Q6qwNRNF0TL2tgfm1j6DKLX7NVHHmWbMFtk3WnHDKw@mail.gmail.com>
 <alpine.LRH.2.21.1905160844130.29250@namei.org> <CALCETrX2ovRx3Rre+1_xC-q6CiybyLjQ-gmB4FZF_qCZ-Qd+4A@mail.gmail.com>
 <960B34DE67B9E140824F1DCDEC400C0F654E38CD@ORSMSX116.amr.corp.intel.com>
 <CALCETrUfmyQ7ivNzQic0FyPXe1fmAnoK093jnz0i8DRn2LvdSA@mail.gmail.com> <960B34DE67B9E140824F1DCDEC400C0F654E3FB9@ORSMSX116.amr.corp.intel.com>
In-Reply-To: <960B34DE67B9E140824F1DCDEC400C0F654E3FB9@ORSMSX116.amr.corp.intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 16 May 2019 17:35:16 -0700
X-Gmail-Original-Message-ID: <CALCETrXmyau8Gq-wKHZ5FdNGF+mqd7a+q+HAVR2sqvXA6av9BA@mail.gmail.com>
Message-ID: <CALCETrXmyau8Gq-wKHZ5FdNGF+mqd7a+q+HAVR2sqvXA6av9BA@mail.gmail.com>
Subject: Re: SGX vs LSM (Re: [PATCH v20 00/28] Intel SGX1 support)
To:     "Xing, Cedric" <cedric.xing@intel.com>
Cc:     Andy Lutomirski <luto@kernel.org>,
        James Morris <jmorris@namei.org>,
        "Christopherson, Sean J" <sean.j.christopherson@intel.com>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        LSM List <linux-security-module@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Eric Paris <eparis@parisplace.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
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
Content-Transfer-Encoding: quoted-printable
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, May 16, 2019 at 3:23 PM Xing, Cedric <cedric.xing@intel.com> wrote:
>
> Hi Andy,
>
> > > SIGSTRUCT isn't necessarily stored on disk so may not always have a f=
d.
> > How about the following?
> > > void *ss_pointer =3D mmap(sigstruct_fd, PROT_READ,...);
> > > ioctl(enclave_fd, SGX_INIT_THE_ENCLAVE, ss_pointer);
> > >
> > > The idea here is SIGSTRUCT will still be passed in memory so it works
> > the same way when no LSM modules are loaded or basing its decision on
> > the .sigstruct file. Otherwise, an LSM module can figure out the backin=
g
> > file (and offset within that file) by looking into the VMA covering
> > ss_pointer.
> >
> > I don=E2=80=99t love this approach.  Application authors seem likely to=
 use
> > read() instead of mmap(), and it=E2=80=99ll still work in many cares. I=
t would
> > also complicate the kernel implementation, and looking at the inode
> > backing the vma that backs a pointer is at least rather unusual.
> > Instead, if the sigstruct isn=E2=80=99t on disk because it=E2=80=99s dy=
namic or came
> > from a network, the application can put it in a memfd.
>
> I understand your concern here. But I guess we are making too much assump=
tion on how enclaves are structured/packaged. My concern is, what if a SIGS=
TRUCT really has to be from memory? For example, an enclave (along with its=
 SIGSTRUCT) could be embedded inside a shared object (or even the "main" ex=
ecutable) so it shows up in memory to begin with.

Hmm.  That's a fair point, although opening /proc/self/exe could be
somewhat of a workaround.  It does suffer from a bit of an in-band
signaling problem, though, in that it's possible that some other
random bytes in the library resemble a SIGSTRUCT.

> I was not saying enclaves were exempt to good security practices. What I =
was trying to say was, EPC pages are *not* subject to the same attacks as r=
egular pages so I suspect there will be a desire to enforce different polic=
ies on them, especially after new SGX2 features/applications become availab=
le. So I think it beneficial to distinguish between regular vs. enclave vir=
tual ranges. And to do that, a new VM_SGX flag in VMA is probably a very si=
mple/easy way. And with that VM_SGX flag, we could add a new security_sgx_m=
prot() hook so that LSM modules/policies could act differently.

I'm not opposed to this, but I also don't think this needs to be in
the initial upstream driver.  VM_SGX also isn't strictly necessary --
an LSM could inspect the VMA to decide whether it's an SGX VMA if it
really wanted to.

That being said, do you have any specific behavior differences in mind
aside from the oddities involved in loading the enclave.

>
> And if you are with me on that bigger picture, the next question is: what=
 should be the default behavior of security_sgx_mprot() for existing/non-SG=
X-aware LSM modules/policies? I'd say a reasonable default is to allow R, R=
W and RX, but not anything else. It'd suffice to get rid of EXECMEM/EXECMOD=
 requirements on enclave applications. For SGX1, EPCM permissions are immut=
able so it really doesn't matter what security_sgx_mprot() does. For SGX2 a=
nd beyond, there's still time and new SGX-aware LSM modules/policies will p=
robably have emerged by then.

I hadn't thought about the SGX1 vs SGX2 difference.  If the driver
initially only wants to support SGX1, then I guess we really could get
away with constraining the EPC flags based on the source page
permission and not restricting mprotect() and mmap() permissions on
/dev/sgx/enclave at all.
