Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB037ADDE
	for <lists+selinux@lfdr.de>; Tue, 30 Jul 2019 18:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbfG3QfL (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 30 Jul 2019 12:35:11 -0400
Received: from sonic301-38.consmr.mail.ne1.yahoo.com ([66.163.184.207]:43291
        "EHLO sonic301-38.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726770AbfG3QfL (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 30 Jul 2019 12:35:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1564504509; bh=j0PZROKhhso5/nDaQw3Sw3MDI5f2Cstc0GbB3ayE/2I=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject; b=f3+BcE6CBofM9Hw4rSM4HJP4q7XUpmgCG6S+qIzN+CoUzOIAW9IOHLzVdBWqUTgZw1b0+BJ11Zbuo6MY9pkr0NBckN/4krIIe5N7yx00TGsiF3Z4Mw3/hlHKy8Z+uOuOT8+AtAd665PlqUVK2arkdOv7MA7VexXR+p+j7DbbPF8hjZxr7WOZwqIOM1TTws8NfahhrGOvXvJe8WsqQtpPT2t6eYE9mt6uSyTo7E24jy5Nd8FxjFAPJK+k0oQ72ySyXesMutWYT430cESJxiwpN0f7aKkd/aNCwJU0uUz87egzYgYDf0nQ4unaenITz5D/AYuXI9o8BdnbgGwbIY0+Ww==
X-YMail-OSG: ZYuY2vcVM1mMdrRluOLCEAsEHbmV0kjyBvG.LBEKihBtOqfCwdRQL5Fl26K3yAv
 8xSPnnGyU6WfnweQnp.Qr5q3YSzTwcOCFqg8KM_X4HC62juUoN17f.DRSWttAsqSgo8_RU8BCmYO
 M0s1E9DAKSUMAIrISxXE4XZoeCAIxPE51rxFSZZH9r7vs4N7ZEVr8u6fYdkwpvYXse9ryHc1Tm.a
 Qfuig4vlUr2p2XnGOpWne5fqfzOgFlE6oQF3lcCwlURSdIs6YHiZnQwGPllY5yegSIJ2gX80sGyi
 2tS67t9H5mA3dpiLxoCL.7C_L8QIOwt32XHBIKGyosZD5yi3.rhHtegdlimTTX1yyRoR8hzLbE_v
 Sdo3XUdzUg..H7HttUR8lHFsh10n4fKXcR8kf.iPM1kGOzPxZvA4R7zNWkmjKf8ZAQQ4WhWht6X8
 qcba0asVveuAvWX9nD5uvdR3bIb3xaBN0X7Rz4aeqkPCcuyaPkyz0u8yB5KZYUe_g..JawhyvvTV
 FU5mx5LmTZ3KK7DWrz8CLCIx12u.v5FMctYbgarGT5W8wqnkdpoL6oaiAp2c3ggdD8AlTy_EYxB7
 1bUzqFiM_8UJt.4bd26xQPGLeOs5FhwnS4nc2_VYtT9jrA1NPP.tfLHQz2rd0tjvYqUIxUWWWfTL
 pjLeSlt6w_78omjkuhMYFC52x0fgwL9d3XqvmF1L.yGgsaUfkypuhbWmFnNDLOxSRHjfcXsJahkm
 fTsu9JWe.qF7_XnY9AjEHVg3kdY5Kl7EDqkOiRNuWUXwX1o4qVEfFKUDYrNdGP16MtzBErdZ7qm.
 oQpX.x06EcbPBUxNOKg43ZR3UrjtEbLTYYUKHbJVyy6Vj9QT9_b4ZMzYK0muSgvXQKYxBB4zx4tW
 D_gEKPjM0RpbKHUfwyXJ6nMZE3vVR3vd9Betcj9fm1RgrtNpJlBZXliT7YmbztEEdv7ERgOYjOvA
 r7o.1g8_5JRAkPKwKfULx.S067Z9wlrIDTTNl5.CbIfspSd.YGPHrzcof6SlJoX4ooHjfV5b8j8K
 V1rz_.rNjZMM.TbSUgBAqjJuQ6i7YE5.Wd9hSUk3eO_qMZqfR2zl_h922IlRhBwviZmW1yE_t3eL
 0rlHX.QjhjMzf8UwMXIB8Isdq8wkDxDU76NI5FP4pIrZmp_4CstNmdZAz1ZeD.aol_HmVHdIv5ht
 YNliod3ak9VR0y_flpg3uIRBJC_14asAOFajC00FWH.WcZQYW7.iICmr7vfxXlySctaOCgfZFkHI
 MMg9SANbG
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ne1.yahoo.com with HTTP; Tue, 30 Jul 2019 16:35:09 +0000
Received: by smtp423.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID ebb8c1e60be15876e7d9023561160f12;
          Tue, 30 Jul 2019 16:35:05 +0000 (UTC)
Subject: Re: [PATCH] selinux: optimize MLS context to string conversion
To:     Paul Moore <paul@paul-moore.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Cc:     selinux@vger.kernel.org, Stephen Smalley <sds@tycho.nsa.gov>,
        Michal Sekletar <msekleta@redhat.com>, casey@schaufler-ca.com
References: <20190730124852.7670-1-omosnace@redhat.com>
 <CAHC9VhTetPBY9keC5ps=XHvgzLOeZE7rDbeG00R4jz0mYaduhA@mail.gmail.com>
From:   Casey Schaufler <casey@schaufler-ca.com>
Openpgp: preference=signencrypt
Autocrypt: addr=casey@schaufler-ca.com; keydata=
 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
 abzjfg==
Message-ID: <64c8037a-ae7e-52f2-e1ef-500d408d0213@schaufler-ca.com>
Date:   Tue, 30 Jul 2019 09:35:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTetPBY9keC5ps=XHvgzLOeZE7rDbeG00R4jz0mYaduhA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 7/30/2019 7:46 AM, Paul Moore wrote:
> On Tue, Jul 30, 2019 at 8:48 AM Ondrej Mosnacek <omosnace@redhat.com> w=
rote:
>> When mls_compute_context_len() or mls_sid_to_context() encounters a
>> context with large category ranges, it behaves suboptimally - it
>> traverses each positive bit of the category bitmap, each time calling
>> find_next_bit() again.
>>
>> This has a large performance impact on UNIX datagram sockets with
>> SO_PASSSEC set, since here the peer context needs to be converted to
>> string for each recieved datagram. See [1] for more information.
>>
>> This patch introduces a new helper for ebitmap traversal, which allows=

>> to efficiently iterate over positive ranges instead of bits -
>> ebitmap_for_each_positive_range() - and converts the two mls_*()
>> functions to leverage it.
>>
>> [1] https://bugzilla.redhat.com/show_bug.cgi?id=3D1733259
>>
>> Reported-by: Michal Sekletar <msekleta@redhat.com>
>> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> My current opinion is that this isn't the right way to solve the
> problem, a SELinux sid->secctx cache would be a better choice.

I implemented secctx retention a while ago (can't locate the
thread to determine exactly when) and the performance improvement
was rather impressive. A cache with proper lifecycle management
would be a tremendous win for audit by reducing not only the time
required to generate a secctx, but the frequency at which they would
need to be copied. The downside would be on small systems with
sophisticated policies, where a small cache would be subject to
thrashing. If the cached values aren't considered when doing
secctx->sid conversions I would think aliasing issues wouldn't
apply, although I have missed subtleties in the past.

I'm rooting for the cache solution.


>   With
> that in mind, and the understanding that this patch is an optimization
> and not a bug fix, I'm going to hold-off on doing anything with this
> patch until there is a cache option we can use for comparison.
>
> As Stephen mentioned in the RH BZ (linked in the description), there
> are a couple of reasons why the code doesn't currently store the
> string translations.  Ignoring the issue of aliasing for a moment, I
> do want to stress that I agree with Stephen on the issue of memory
> pressure and that to keep translated strings around indefinitely in
> the kernel is going to be a problem (there are other issues beyond
> just memory use).  I imagine any cache implementation would need to be
> built to only store a subset of all the translations and there would
> need to be a way to age-out those translations (as well as purge them
> completely on events such as a policy load).
>

