Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0004A21C4E
	for <lists+selinux@lfdr.de>; Fri, 17 May 2019 19:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbfEQRTM (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 17 May 2019 13:19:12 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39099 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfEQRTL (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 17 May 2019 13:19:11 -0400
Received: by mail-pg1-f196.google.com with SMTP id w22so3589026pgi.6
        for <selinux@vger.kernel.org>; Fri, 17 May 2019 10:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=JAswoR5Qv/2WYAqzx6JaoqD58LtbqKgAkfQL5B0Gl2k=;
        b=cPEHXVMeHFJobMu4Wmzco0x0g0cFQ6RtVK9VjgDcBBwJ/FETtzMaNoes42AVX5OI5D
         I9u9osWJUHO/46J+S/hasOU6Bqdq0PkNgQr/J+f1fHNSP1HOO8QQgaiEnon3JhAvil1M
         1FL36M4DDMcRmZ5ZGe4KHTc62m6soVUl2/shsWRPkNwU4eXymLb2QwTgrrkPHQ19KbQG
         vT9HBUZ+iX1RSd757rq+2gJmgKb5nxphdUaRQtPRQtxLBsiZpugjUKd3UP2nRyOIcrSv
         acoYce7qsgNESrZf+Gvya+FJCPAC2oIUOUpTvkRlrqtsD10tHd6Qt7qJ4DJxaC9ZBevU
         4zUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=JAswoR5Qv/2WYAqzx6JaoqD58LtbqKgAkfQL5B0Gl2k=;
        b=R8zLS3SBe4vqjY8tZbestTW3XMimu9MZghDz5ZqlB66E3Gx/LizcRvbSHLf0mu0iDn
         03a0va0RyzXFNIRWMy6xiMgfVXb6GqdcpU+utZTgUclKTnMRB76O6/Rcb2h5Nbp+I8wJ
         AqGCADJwE9yBuTlCd6Ub0wcHOPXacVdvAzMKbuibXT1OPpvWyh8+3PCwWNujDPTPu8Z5
         GeHPzyQB/magjjtH48kwdjQnATtTe3h1thmLqqb+nbK3pG6Wzu9RQ8+sbFxERnsV/PPp
         Zkgqu6oeNNWEoGQyhWlnQszXoOGUB8yQpsuSnviXBipC6EjgcytZxO9naMVCXR2MMrxB
         YPoQ==
X-Gm-Message-State: APjAAAU+5OB+xajzrtF1pndb51vlYwtWato9WzsPpJom/w16lm1G8drs
        do9n1mL612VfUQQPGBgLnPKKQw==
X-Google-Smtp-Source: APXvYqzB8HQYLiqoUkmvgy2Qbfkq0oKD7/O5SMJJluI3vpUX7KQUH6p/CAsDENs2ofp3S28Iz4r7gA==
X-Received: by 2002:aa7:8c10:: with SMTP id c16mr16875764pfd.89.1558113551080;
        Fri, 17 May 2019 10:19:11 -0700 (PDT)
Received: from [10.232.242.123] (96.sub-97-41-134.myvzw.com. [97.41.134.96])
        by smtp.gmail.com with ESMTPSA id t2sm3841651pfh.166.2019.05.17.10.18.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 10:19:10 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: SGX vs LSM (Re: [PATCH v20 00/28] Intel SGX1 support)
Date:   Fri, 17 May 2019 10:12:40 -0700
Message-Id: <837CE33B-A636-4BF8-B46E-0A8A40C5A563@amacapital.net>
References: <20190515013031.GF1977@linux.intel.com> <CALCETrXf8mSK45h7sTK5Wf+pXLVn=Bjsc_RLpgO-h-qdzBRo5Q@mail.gmail.com> <alpine.LRH.2.21.1905160543070.19802@namei.org> <CALCETrX_Q6qwNRNF0TL2tgfm1j6DKLX7NVHHmWbMFtk3WnHDKw@mail.gmail.com> <alpine.LRH.2.21.1905160844130.29250@namei.org> <CALCETrX2ovRx3Rre+1_xC-q6CiybyLjQ-gmB4FZF_qCZ-Qd+4A@mail.gmail.com> <960B34DE67B9E140824F1DCDEC400C0F654E38CD@ORSMSX116.amr.corp.intel.com> <CALCETrUfmyQ7ivNzQic0FyPXe1fmAnoK093jnz0i8DRn2LvdSA@mail.gmail.com> <960B34DE67B9E140824F1DCDEC400C0F654E3FB9@ORSMSX116.amr.corp.intel.com> <6a97c099-2f42-672e-a258-95bc09152363@tycho.nsa.gov> <20190517150948.GA15632@linux.intel.com> <ca807220-47e2-5ec2-982c-4fb4a72439c6@tycho.nsa.gov> <80013cca-f1c2-f4d5-7558-8f4e752ada76@tycho.nsa.gov>
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
In-Reply-To: <80013cca-f1c2-f4d5-7558-8f4e752ada76@tycho.nsa.gov>
To:     Stephen Smalley <sds@tycho.nsa.gov>
X-Mailer: iPhone Mail (16E227)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org



> On May 17, 2019, at 9:37 AM, Stephen Smalley <sds@tycho.nsa.gov> wrote:
>=20
>> On 5/17/19 12:20 PM, Stephen Smalley wrote:
>>> On 5/17/19 11:09 AM, Sean Christopherson wrote:
>>>> On Fri, May 17, 2019 at 09:53:06AM -0400, Stephen Smalley wrote:
>>>>> On 5/16/19 6:23 PM, Xing, Cedric wrote:
>>>>> I thought EXECMOD applied to files (and memory mappings backed by them=
) but
>>>>> I was probably wrong. It sounds like EXECMOD applies to the whole proc=
ess so
>>>>> would allow all pages within a process's address space to be modified t=
hen
>>>>> executed, regardless the backing files. Am I correct this time?
>>>>=20
>>>> No, you were correct the first time I think; EXECMOD is used to control=

>>>> whether a process can make executable a private file mapping that has
>>>> previously been modified (e.g. text relocation); it is a special case t=
o
>>>> support text relocations without having to allow full EXECMEM (i.e. exe=
cute
>>>> arbitrary memory).
>>>>=20
>>>> SELinux checks relevant to W^X include:
>>>>=20
>>>> - EXECMEM: mmap/mprotect PROT_EXEC an anonymous mapping (regardless of
>>>> PROT_WRITE, since we know the content has to have been written at some
>>>> point) or a private file mapping that is also PROT_WRITE.
>>>> - EXECMOD: mprotect PROT_EXEC a private file mapping that has been
>>>> previously modified, typically for text relocations,
>>>> - FILE__WRITE: mmap/mprotect PROT_WRITE a shared file mapping,
>>>> - FILE__EXECUTE: mmap/mprotect PROT_EXEC a file mapping.
>>>>=20
>>>> (ignoring EXECSTACK and EXECHEAP here since they aren't really relevant=
 to
>>>> this discussion)
>>>>=20
>>>> So if you want to ensure W^X, then you wouldn't allow EXECMEM for the
>>>> process, EXECMOD by the process to any file, and the combination of bot=
h
>>>> FILE__WRITE and FILE__EXECUTE by the process to any file.
>>>>=20
>>>> If the /dev/sgx/enclave mappings are MAP_SHARED and you aren't using an=

>>>> anonymous inode, then I would expect that only the FILE__WRITE and
>>>> FILE__EXECUTE checks are relevant.
>>>=20
>>> Yep, I was just typing this up in a different thread:
>>>=20
>>> I think we may want to change the SGX API to alloc an anon inode for eac=
h
>>> enclave instead of hanging every enclave off of the /dev/sgx/enclave ino=
de.
>>> Because /dev/sgx/enclave is NOT private, SELinux's file_map_prot_check()=

>>> will only require FILE__WRITE and FILE__EXECUTE to mprotect() enclave VM=
As
>>> to RWX.  Backing each enclave with an anon inode will make SELinux treat=

>>> EPC memory like anonymous mappings, which is what we want (I think), e.g=
.
>>> making *any* EPC page executable will require PROCESS__EXECMEM (SGX is
>>> 64-bit only at this point, so SELinux will always have default_noexec).
>> I don't think we want to require EXECMEM (or equivalently both FILE__WRIT=
E and FILE__EXECUTE to /dev/sgx/enclave) for making any EPC page executable,=
 only if the page is also writable or previously modified.  The intent is to=
 prevent arbitrary code execution without EXECMEM (or FILE__WRITE|FILE__EXEC=
UTE), while still allowing enclaves to be created without EXECMEM as long as=
 the EPC page mapping is only ever mapped RX and its initial contents came f=
rom an unmodified file mapping that was PROT_EXEC (and hence already checked=
 via FILE__EXECUTE).
>=20
> Also, just to be clear, there is nothing inherently better about checking E=
XECMEM instead of checking both FILE__WRITE and FILE__EXECUTE to the /dev/sg=
x/enclave inode, so I wouldn't switch to using anon inodes for that reason. =
 Using anon inodes also unfortunately disables SELinux inode-based checking s=
ince we no longer have any useful inode information, so you'd lose out on SE=
Linux ioctl whitelisting on those enclave inodes if that matters.

How can that work?  Unless the API changes fairly radically, users fundament=
ally need to both write and execute the enclave.  Some of it will be written=
 only from already executable pages, and some privilege should be needed to e=
xecute any enclave page that was not loaded like this.=
