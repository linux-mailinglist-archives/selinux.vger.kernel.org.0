Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42F2C21B8C
	for <lists+selinux@lfdr.de>; Fri, 17 May 2019 18:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbfEQQYn (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 17 May 2019 12:24:43 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39568 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfEQQYn (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 17 May 2019 12:24:43 -0400
Received: by mail-pl1-f195.google.com with SMTP id g9so3569062plm.6
        for <selinux@vger.kernel.org>; Fri, 17 May 2019 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=aV3rffMxuXG8e12nRoLl587y9MXM8TOV+Ti1qX5jxqI=;
        b=NXpueBp2RQMTp7/ult69Cy5m/zTxwcPQ4jUpkeJZIDfT5NUWtRfdwnURyUvF+j6BFp
         AtAoNq/qumpwpOFcKFiEZaF/sZdU1y/HLKnK9X7UPX0N/K43J1jkVrMf5Xs5CqVetGcL
         ZBfYzEeuzoVND9qwgMHdjgycO60Wj5qtT1MAM5cT1Ytwi56EKX3k7ReMiyMZ8xdGHNre
         mM4fVZcEHDooxUjnhbVinIyKSNOV8KWA1dtbI6Y7eb62sxO2ITHJnViW49OB1VjvhKtv
         DGINjLmb++niWPUIc88gcCTcevakt4/DwbPMhlaoWreegbl0aeJ3i93b5EK1cmpI033W
         Wulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=aV3rffMxuXG8e12nRoLl587y9MXM8TOV+Ti1qX5jxqI=;
        b=FzVNpeYyHcpr75z17vfy0jrERJSvZwjrV2/lKOIpu9Hk/pozgh+HxMUpky0GwFNjO0
         YRo3N30OudSqimi6+Zcl9yxY1KpuOfa9phOH3DmDQYdzw0GopulnBCQO/gZjbbue22mv
         2c9bBYvkdru7PVhZntLSP0Q7RgaEr0LlbfpGewf5beviunXv1q/6+BTJ9jAp/9T3bOUE
         +y8cRm5N5jk3iU4hjYESJhx2ZrYpiFTKm28DpcDjfqjPoHPdkqjx7UNnW1O2YYOM9WCB
         wJIHtcxv9d3iZjoBzLG4ftrKaSxpDW2LQS3nzJhaHLWKsjGHof2292BNu5rQhWk1/lDB
         HTHA==
X-Gm-Message-State: APjAAAXEDcOYvHr8vNBc1q52SOngMSwIR31bhHPae3e5rWCEFmFCWtsp
        nSSApBaJA+3JEhOWjw8enMrqMw==
X-Google-Smtp-Source: APXvYqzLLqL8f8ufEhA84JZ4KDsuDGxuqP9EQI1cVkvo3Az2BKCevLwr9qASi18i0IIJwQ0nWw2g6w==
X-Received: by 2002:a17:902:be0e:: with SMTP id r14mr40513480pls.152.1558110282349;
        Fri, 17 May 2019 09:24:42 -0700 (PDT)
Received: from ?IPv6:2600:1010:b066:f2e9:80d1:f40f:2e81:3df1? ([2600:1010:b066:f2e9:80d1:f40f:2e81:3df1])
        by smtp.gmail.com with ESMTPSA id k9sm10974460pfa.180.2019.05.17.09.24.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 09:24:41 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: SGX vs LSM (Re: [PATCH v20 00/28] Intel SGX1 support)
From:   Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (16E227)
In-Reply-To: <ca807220-47e2-5ec2-982c-4fb4a72439c6@tycho.nsa.gov>
Date:   Fri, 17 May 2019 09:24:39 -0700
Cc:     Sean Christopherson <sean.j.christopherson@intel.com>,
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <ECF62380-A58A-4829-AFF0-F7D439D6F886@amacapital.net>
References: <20190515013031.GF1977@linux.intel.com> <CALCETrXf8mSK45h7sTK5Wf+pXLVn=Bjsc_RLpgO-h-qdzBRo5Q@mail.gmail.com> <alpine.LRH.2.21.1905160543070.19802@namei.org> <CALCETrX_Q6qwNRNF0TL2tgfm1j6DKLX7NVHHmWbMFtk3WnHDKw@mail.gmail.com> <alpine.LRH.2.21.1905160844130.29250@namei.org> <CALCETrX2ovRx3Rre+1_xC-q6CiybyLjQ-gmB4FZF_qCZ-Qd+4A@mail.gmail.com> <960B34DE67B9E140824F1DCDEC400C0F654E38CD@ORSMSX116.amr.corp.intel.com> <CALCETrUfmyQ7ivNzQic0FyPXe1fmAnoK093jnz0i8DRn2LvdSA@mail.gmail.com> <960B34DE67B9E140824F1DCDEC400C0F654E3FB9@ORSMSX116.amr.corp.intel.com> <6a97c099-2f42-672e-a258-95bc09152363@tycho.nsa.gov> <20190517150948.GA15632@linux.intel.com> <ca807220-47e2-5ec2-982c-4fb4a72439c6@tycho.nsa.gov>
To:     Stephen Smalley <sds@tycho.nsa.gov>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org



> On May 17, 2019, at 9:20 AM, Stephen Smalley <sds@tycho.nsa.gov> wrote:
>=20
>> On 5/17/19 11:09 AM, Sean Christopherson wrote:
>>> On Fri, May 17, 2019 at 09:53:06AM -0400, Stephen Smalley wrote:
>>>> On 5/16/19 6:23 PM, Xing, Cedric wrote:
>>>> I thought EXECMOD applied to files (and memory mappings backed by them)=
 but
>>>> I was probably wrong. It sounds like EXECMOD applies to the whole proce=
ss so
>>>> would allow all pages within a process's address space to be modified t=
hen
>>>> executed, regardless the backing files. Am I correct this time?
>>>=20
>>> No, you were correct the first time I think; EXECMOD is used to control
>>> whether a process can make executable a private file mapping that has
>>> previously been modified (e.g. text relocation); it is a special case to=

>>> support text relocations without having to allow full EXECMEM (i.e. exec=
ute
>>> arbitrary memory).
>>>=20
>>> SELinux checks relevant to W^X include:
>>>=20
>>> - EXECMEM: mmap/mprotect PROT_EXEC an anonymous mapping (regardless of
>>> PROT_WRITE, since we know the content has to have been written at some
>>> point) or a private file mapping that is also PROT_WRITE.
>>> - EXECMOD: mprotect PROT_EXEC a private file mapping that has been
>>> previously modified, typically for text relocations,
>>> - FILE__WRITE: mmap/mprotect PROT_WRITE a shared file mapping,
>>> - FILE__EXECUTE: mmap/mprotect PROT_EXEC a file mapping.
>>>=20
>>> (ignoring EXECSTACK and EXECHEAP here since they aren't really relevant t=
o
>>> this discussion)
>>>=20
>>> So if you want to ensure W^X, then you wouldn't allow EXECMEM for the
>>> process, EXECMOD by the process to any file, and the combination of both=

>>> FILE__WRITE and FILE__EXECUTE by the process to any file.
>>>=20
>>> If the /dev/sgx/enclave mappings are MAP_SHARED and you aren't using an
>>> anonymous inode, then I would expect that only the FILE__WRITE and
>>> FILE__EXECUTE checks are relevant.
>> Yep, I was just typing this up in a different thread:
>> I think we may want to change the SGX API to alloc an anon inode for each=

>> enclave instead of hanging every enclave off of the /dev/sgx/enclave inod=
e.
>> Because /dev/sgx/enclave is NOT private, SELinux's file_map_prot_check()
>> will only require FILE__WRITE and FILE__EXECUTE to mprotect() enclave VMA=
s
>> to RWX.  Backing each enclave with an anon inode will make SELinux treat
>> EPC memory like anonymous mappings, which is what we want (I think), e.g.=

>> making *any* EPC page executable will require PROCESS__EXECMEM (SGX is
>> 64-bit only at this point, so SELinux will always have default_noexec).
>=20
> I don't think we want to require EXECMEM (or equivalently both FILE__WRITE=
 and FILE__EXECUTE to /dev/sgx/enclave) for making any EPC page executable, o=
nly if the page is also writable or previously modified.  The intent is to p=
revent arbitrary code execution without EXECMEM (or FILE__WRITE|FILE__EXECUT=
E), while still allowing enclaves to be created without EXECMEM as long as t=
he EPC page mapping is only ever mapped RX and its initial contents came fro=
m an unmodified file mapping that was PROT_EXEC (and hence already checked v=
ia FILE__EXECUTE).

That agrees with my thoughts. Actually plumbing everything together so this w=
orks could be a bit interesting.  I assume it=E2=80=99ll need a special case=
 in SELinux or maybe a new vm_op.=
