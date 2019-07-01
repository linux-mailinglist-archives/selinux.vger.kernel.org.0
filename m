Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2D0621DD5
	for <lists+selinux@lfdr.de>; Fri, 17 May 2019 20:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbfEQSxD (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 17 May 2019 14:53:03 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38221 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbfEQSxD (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 17 May 2019 14:53:03 -0400
Received: by mail-pg1-f195.google.com with SMTP id j26so3703314pgl.5
        for <selinux@vger.kernel.org>; Fri, 17 May 2019 11:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Zedk+akRmRCkjlP2v+DLCTRSwVyK89TYIDPpzH+WlCo=;
        b=ip6rP4a7K7+zXEf5W8Wi59dm82XG6OS0S9ZuQM/R3m4HZBPDpbEsryeSQAiNCUMo9n
         Npyu0Ex/7I6LSTU0Hn0T9B9ff3Qt7UHKpZ4kb10dgIjtzru1QNEgtg06cvgOrtmkvSb1
         ISueCn1+o+BjU7M/al9zR680IGNP81M2Qw5lkhqS3odOPIG4Szuv1+huK6X2LpmcVRNu
         D1YAcdMthvyCXOXfPq1Xk3wBo9rPn/9ozeUV9V07aIpTgpZegpqlAGe46klScMYLO4lD
         h7qUu9d/skpnGxNs/BXnYhbOSYwMNq17RQoSytbin/2RaC9iv4MkDYZ+yHk4Ncsq5ugT
         fCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Zedk+akRmRCkjlP2v+DLCTRSwVyK89TYIDPpzH+WlCo=;
        b=XITguWDBayWJDnIBvgGIvrbxqJ/hiLjOjpx7F3x1e4PbTTancDHkFOlyDeMbIh05fM
         3huArQ/nHeYvWTvD4/8WesOTntac4BheUap9eIO/FkmDumNYsSPPUXDrsljqxrSS7gY9
         Od3Ir+u3f5YbcQK81cvo+TlrRCNsT7IIW1N+4R+/ojt2m6xXzGCadvsmu05UAq3Gp1g5
         KrNfeeuilJUCyS79J1F7zzlng5/we3j59c+PdnnIB+5P4Bhr/bFYVxypq42JnvZz5DES
         A2U/LOoK1qklh83YyDReGhNNQsa1NbByLTwQgEfgpapQ1/0PUjp741+sW0p5OX0foOwI
         7qMQ==
X-Gm-Message-State: APjAAAX/IPewP7sjgiYZO6Tp/blTp6c92tjVz4cO18KCm3+Odp1TDxbC
        CAf3eHaOg+hKPDnRzhTx43pRpw==
X-Google-Smtp-Source: APXvYqyTd69tqkuVEARG8Y+9ZovVDRZ6Vc29b6lGDGKyVcTXVijdT6jmM3t9cOKJjq1rFQRiuTEvwA==
X-Received: by 2002:aa7:8a11:: with SMTP id m17mr40233878pfa.122.1558119182522;
        Fri, 17 May 2019 11:53:02 -0700 (PDT)
Received: from ?IPv6:2600:1010:b04b:10dc:8986:2c48:2978:531d? ([2600:1010:b04b:10dc:8986:2c48:2978:531d])
        by smtp.gmail.com with ESMTPSA id t142sm529350pgb.32.2019.05.17.11.53.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 11:53:01 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: SGX vs LSM (Re: [PATCH v20 00/28] Intel SGX1 support)
From:   Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (16E227)
In-Reply-To: <20190517182124.GF15006@linux.intel.com>
Date:   Fri, 17 May 2019 11:53:00 -0700
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        "Xing, Cedric" <cedric.xing@intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        LSM List <linux-security-module@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@parisplace.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Jethro Beekman <jethro@fortanix.com>,
        "Hansen, Dave" <dave.hansen@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Dr. Greg" <greg@enjellic.com>,
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <3FECC02D-C65C-4D35-B538-D32EC7D722D5@amacapital.net>
References: <CALCETrUfmyQ7ivNzQic0FyPXe1fmAnoK093jnz0i8DRn2LvdSA@mail.gmail.com> <960B34DE67B9E140824F1DCDEC400C0F654E3FB9@ORSMSX116.amr.corp.intel.com> <6a97c099-2f42-672e-a258-95bc09152363@tycho.nsa.gov> <20190517150948.GA15632@linux.intel.com> <ca807220-47e2-5ec2-982c-4fb4a72439c6@tycho.nsa.gov> <80013cca-f1c2-f4d5-7558-8f4e752ada76@tycho.nsa.gov> <20190517172953.GC15006@linux.intel.com> <DFE03E0C-694A-4289-B416-29CDC2644F94@amacapital.net> <20190517175500.GE15006@linux.intel.com> <CAHk-=wgH2FBzBG3_RZSuatpYCj8DCQZipJYp9vh3Wy_S3Qt4-g@mail.gmail.com> <20190517182124.GF15006@linux.intel.com>
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org



> On May 17, 2019, at 11:21 AM, Sean Christopherson <sean.j.christopherson@i=
ntel.com> wrote:
>=20
>> On Fri, May 17, 2019 at 11:04:22AM -0700, Linus Torvalds wrote:
>> On Fri, May 17, 2019 at 10:55 AM Sean Christopherson
>> <sean.j.christopherson@intel.com> wrote:
>>>=20
>>> In this snippet, IS_PRIVATE() is true for anon inodes, false for
>>> /dev/sgx/enclave.  Because EPC memory is always shared, SELinux will nev=
er
>>> check PROCESS__EXECMEM for mprotect() on/dev/sgx/enclave.
>>=20
>> Why _does_ the memory have to be shared? Shared mmap() is
>> fundamentally less secure than private mmap, since by definition it
>> means "oh, somebody else has access to it too and might modify it
>> under us".
>>=20
>> Why does the SGX logic care about things like that? Normal executables
>> are just private mappings of an underlying file, I'm not sure why the
>> SGX interface has to have that shared thing, and why the interface has
>> to have a device node in the first place when  you have system calls
>> for setup anyway.
>>=20
>> So why don't the system calls just work on perfectly normal anonymous
>> mmap's? Why a device node, and why must it be shared to begin with?
>=20
> I agree that conceptually EPC is private memory, but because EPC is
> managed as a separate memory pool, SGX tags it VM_PFNMAP and manually
> inserts PFNs, i.e. EPC effectively it gets classified as IO memory.=20
>=20
> And vmf_insert_pfn_prot() doesn't like writable private IO mappings:
>=20
>   BUG_ON((vma->vm_flags & VM_PFNMAP) && is_cow_mapping(vma->vm_flags));

I don=E2=80=99t see how it could be anonymous even in principle.  The kernel=
 can=E2=80=99t *read* the memory =E2=80=94 how could we possibly CoW it?  An=
d we can=E2=80=99t share an RO backing pages between two different enclaves b=
ecause the CPU won=E2=80=99t let us =E2=80=94 each EPC page belongs to a par=
ticular enclave.  And fork()ing an enclave is right out.

So I agree that MAP_ANONYMOUS would be nice conceptually, but I don=E2=80=99=
t see how it would work.=
