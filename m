Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43E00118D78
	for <lists+selinux@lfdr.de>; Tue, 10 Dec 2019 17:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbfLJQXZ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 10 Dec 2019 11:23:25 -0500
Received: from sonic306-27.consmr.mail.ne1.yahoo.com ([66.163.189.89]:37117
        "EHLO sonic306-27.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727459AbfLJQXY (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 10 Dec 2019 11:23:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1575995002; bh=ZbR8Y50QrxJ+gz0M9EPz6SD0g476jYKjgbwr+PaxFkA=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject; b=tc+BWMNFMNjslmgBykdU6qSmFHHJ9QuVEwJRWwwzS3rNJ35AfzcvcBKiWtOA8TcHA7swwQBDT/f03+ooAPmzn2tam36pd42xSLQUI022iKEJYOD4f8vn6JscChoa+hiMeQfYhiUp8x+z6sdQr7jFA8qjuf/V+PsUPpkepu7EyXeNK3/j0agBhETlk4ztrj985c6jtgyeDCptw09MdZU79Hz/CqMblrJEkvgOpy6z1d8B/wRJAn1LskRP4Qrx3tqDGj1WZ6cYW3DCji65sNWC3mVRrgkOyecVMYyy4Sk2aazoFY0BZNBBp10CY6XYeBkmYVZ4c18mPCuNPgE1cxRgRA==
X-YMail-OSG: NYkJ3woVM1mRzJOktf4zAZFwdiPXhxTP.ATxI2UJ5eewGw1mV3FXUX1AWPjDUM5
 ZbxmCdHZgAXBNP0PaA3nHOisoyAD8y09UHHlbZDmuNhKy2CIZcrUcxRsJCaJANDVIqWZ5H5x1EPt
 Sa5Dh76dRqUoYBppZVTYXdtSisPN5pgtu3CHoS4pPDfMip6gSWGAkR.INt9y.zJDEvlzyrcGqgsU
 FN7RoEdvl8WVBlbCDrJ9zdpPNK5mAMaMfEv0DrYQgB5WaGbLPkUFY7jifG4wQV8ayCbySrpdIT1O
 wbKJkS238MGKNpgrNw3CKJD34BpICR9QsZfBk_qrlwORTfEt1Qrj_VAlCBQU571V_VM0d.A4J.6j
 Qy6slo_DFKkPXpPIjOI7iY71POG3qkKH3xxSMLln94y0GLnDzIO9amdxNiT5y37cAQz6DfQLUZ0z
 tA_qIgcSFjIbRSUw.mrY1xuh.ggymLfzAUMgxrAzghZIReuO2iq9g8ZLL5zaQp9bpgCc43qQ2xbY
 xBeo0mn9MiSPSql65M65Y2mWVxXNP.sexNQpjz_lPq1EOvMMuPP9Ut.DB.imi4rtAz7lAjmB91AI
 HO87XRswcz.oBOYbPtT3UHHMu9.G1x.qwbKIoKmORqFPKMmnmTlnAD4ri6qd6slFuP0EGxAIqetb
 GNb0eJfokzL59eYqJPCcxUHc6M.FvZbrx5IDh4uQCNVKrQTc9MTTwkL9S7RMCiEL0qPW9Sjn7qRf
 SHe2KCDx0YY21XwOfXEIouTUbraPthJ0LElhxbsS_By19NNoCpQZhDdsE2bokcVzublZMTs_67by
 SKe8TyY6XY9hxhaE4768l8cGZJhdz1OSGWGKrrDFFlbwvWs2c4c_FVb6PzP4_9_KKoI9GUeCphQv
 JFfd4.WeTgP4Lv0FUW3CezyVHrlIZSN.P8axllDZi6Fxb5U0nu28zyw77iUu6VI_ItrK4yFWh6Tm
 5ApTbtmbHkT3Ui.swjuzi1rrt4An1wsMRXyWECkLXGzIJvsTkc06nxbpnJF7Xk30.dgezp7esRe5
 A_zLDpIPadRAjs0izlfaUEN2JgzELkXiLfU0unItPKvYzFXdC7TPFbo.XRSb5TxvVD9.GzPu6fDy
 89Fqpjw3wVPqnkfIWqfdt_KSQc0uMXfN5665i8ymVUacOBoUGs5vmbmaMo8cRWnmlnmQohXS54V9
 HwgTE4HXKMdzwhJYMVWbLdXJytp.oc1yojnGUBKl9HhKQ3F32ns_72.1MH3U53ur5NGAoT9TtRBf
 w9KJgnZxAsE93Y4naF5wDEI1rzd2gywn979e5suE5_kc3S0KK31Q_lkaUUo2TGr8gL6P.0oNTgNw
 7L8jtUGNjS878jdjJ80IA4DHAkl8R9pq2FrigzL7VJMZNuwTy6VWlLupQwmR9UQTEipgX.168cs6
 Ral50J3wENmjD2PK31sObx9pblFgMxiM.9c5w
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ne1.yahoo.com with HTTP; Tue, 10 Dec 2019 16:23:22 +0000
Received: by smtp425.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID f59978885dec1f23d2ff3fb1edd846a5;
          Tue, 10 Dec 2019 16:23:21 +0000 (UTC)
Subject: Re: [PATCH] selinux: reorder hooks to make runtime disable less
 broken
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     Stephen Smalley <sds@tycho.nsa.gov>,
        SElinux list <selinux@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        LSM <linux-security-module@vger.kernel.org>
References: <20191209075756.123157-1-omosnace@redhat.com>
 <23671223-f841-564c-6ae8-0401bce0fa20@tycho.nsa.gov>
 <ecfd3846-b38f-4b85-4568-d64625c490ac@tycho.nsa.gov>
 <2fadcd3d-96d2-82bf-f221-a7961853be50@schaufler-ca.com>
 <CAFqZXNsZTRveUYBdsXC2iM2MU+nWPz0xL9eLRFwFYMnti-Ww-g@mail.gmail.com>
From:   Casey Schaufler <casey@schaufler-ca.com>
Openpgp: preference=signencrypt
Autocrypt: addr=casey@schaufler-ca.com; keydata=
 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
 abzjfg==
Message-ID: <0d76e2ba-c417-b691-ca54-29172cc24c5f@schaufler-ca.com>
Date:   Tue, 10 Dec 2019 08:23:20 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAFqZXNsZTRveUYBdsXC2iM2MU+nWPz0xL9eLRFwFYMnti-Ww-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailer: WebService/1.1.14728 hermes Apache-HttpAsyncClient/4.1.4 (Java/1.8.0_181)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 12/10/2019 3:27 AM, Ondrej Mosnacek wrote:
> On Mon, Dec 9, 2019 at 6:20 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> On 12/9/2019 5:58 AM, Stephen Smalley wrote:
>>> On 12/9/19 8:21 AM, Stephen Smalley wrote:
>>>> On 12/9/19 2:57 AM, Ondrej Mosnacek wrote:
>>>>> Commit b1d9e6b0646d ("LSM: Switch to lists of hooks") switched the LSM
>>>>> infrastructure to use per-hook lists, which meant that removing the
>>>>> hooks for a given module was no longer atomic. Even though the commit
>>>>> clearly documents that modules implementing runtime revmoval of hooks
>>>>> (only SELinux attempts this madness) need to take special precautions to
>>>>> avoid race conditions, SELinux has never addressed this.
>>>>>
>>>>> By inserting an artificial delay between the loop iterations of
>>>>> security_delete_hooks() (I used 100 ms), booting to a state where
>>>>> SELinux is enabled, but policy is not yet loaded, and running these
>>>>> commands:
>>>>>
>>>>>      while true; do ping -c 1 <some IP>; done &
>>>>>      echo -n 1 >/sys/fs/selinux/disable
>>>>>      kill %1
>>>>>      wait
>>>>>
>>>>> ...I was able to trigger NULL pointer dereferences in various places. I
>>>>> also have a report of someone getting panics on a stock RHEL-8 kernel
>>>>> after setting SELINUX=disabled in /etc/selinux/config and rebooting
>>>>> (without adding "selinux=0" to kernel command-line).
>>>>>
>>>>> Reordering the SELinux hooks such that those that allocate structures
>>>>> are removed last seems to prevent these panics. It is very much possible
>>>>> that this doesn't make the runtime disable completely race-free, but at
>>>>> least it makes the operation much less fragile.
>>>>>
>>>>> An alternative (and safer) solution would be to add NULL checks to each
>>>>> hook, but doing this just to support the runtime disable hack doesn't
>>>>> seem to be worth the effort...
>>>> Personally, I would prefer to just get rid of runtime disable altogether; it also precludes making the hooks read-only after initialization.  IMHO, selinux=0 is the proper way to disable SELinux if necessary.  I believe there is an open bugzilla on Fedora related to this issue, since runtime disable was originally introduced for Fedora.
>>> Also, if we have to retain this support, it seems like this ought to be fixed in the LSM framework especially since it was a change there that broke the SELinux implementation.
>> Agreed, mostly. Deleting an LSM is fundamentally something the infrastructure
>> should handle *if* we allow it. Should we decide at some point to allow loadable
>> modules, as Tetsuo has advocated from time to time, we would need a general
>> solution. We don't have a general solution now because only SELinux wants it.
>> The previous implementation was under #ifdef for SELinux. At the time I understood
>> that there was no interest in investing in it. The implementation passed tests
>> at the time.
>>
>> I propose that until such time as someone decides to seriously investigate
>> loadable security modules* the sole user of the deletion mechanism is
>> welcome to invest whatever they like in their special case, and I will be
>> happy to lend whatever assistance I can.
> On my way to lunch I came up with another relatively simple solution
> that should address this problem at the infrastructure level. Let me
> try to write it up into a patch, hopefully it will work...

I await your proposal with keen interest.

>
>> ---
>> * I do not plan to propose an implementation of loadable modules.
>>   I leave that as an exercise for the next generation.
>>
>>
