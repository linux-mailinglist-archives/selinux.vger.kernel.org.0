Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F7B1B4D38
	for <lists+selinux@lfdr.de>; Wed, 22 Apr 2020 21:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgDVTUb (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 22 Apr 2020 15:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725913AbgDVTUa (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 22 Apr 2020 15:20:30 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F9EC03C1A9
        for <selinux@vger.kernel.org>; Wed, 22 Apr 2020 12:20:30 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id pg17so2737779ejb.9
        for <selinux@vger.kernel.org>; Wed, 22 Apr 2020 12:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=twK/pM53hWni1zkJhDuLdxMZbWVOtirSTf5uF8NF2g4=;
        b=MssjbJEdWqbvQrjyN0E1xaB9FWQcK8k8mB10RDnOqeegIPNuXbwGW5eJc3Ia5iqydX
         JqRGmbT89WnNysLZIq3jg2p1Xq/KH3ZXkliinoF3M5sdSZ46TVb+tdjLs9fXHzxeWmMj
         /987jeIQ1ds9J+yAk3oqXKGDJME4SuL0Z+YYkreViSI+1ta5e1BcAHtAEhxLgjQeEwoS
         Jsb6/g4/2+tJRiFv2OspI7KxAAIm2sRqMjVVhB/S4xAZuq1Ig/bF8f4/kVBDf9HK31r7
         /3mKxoK4So6wExa33udhd+gYuHsdxazfq/QMOwlXGfmmR0Vyg7PFHHjQx3Inkl/HNmXq
         WcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=twK/pM53hWni1zkJhDuLdxMZbWVOtirSTf5uF8NF2g4=;
        b=KWZlcDLYLnWp0tTV0dLxMqtBjLB4Z5DCuHitHAEwWp6e+xXL5/qRbpqx2DX3S6bbkw
         vNj4/46zk/oZJ/7kxGcdMEMP58G3ft+g1Iz9thTZVCXhEOE6S9GAfqm9YIHLThod9FzG
         mSAPBZR2tQildVjAZMQCedoJKtmFPSEn/LfmC3OomSj4g3WJeQnWsNRcwSbAI+Jw0RWX
         6WtATcZeYijbLJ6kosyknkVONoibdfPBGyA5OXVwAoGc6nMXONXXD/pXgCJxjoM/vjw1
         rTMkUpgdORzq7/RkoRJllK/jykXFatp5mpZZ/EnF4ofWcU1VkaP80xW7VRiENeYLmyyX
         KDHQ==
X-Gm-Message-State: AGi0PubMjRNGNSuL6+Zf1wb9LeYwROLuWmxm/LPNwz5NWkJW19KSdFb6
        mDLd3Qc8bSIs39EDACo3XF/XmsjRGYKZ+EgxG+/bI0Q=
X-Google-Smtp-Source: APiQypKiaQ6F00e9os/HeZtUEFH/74Jfz/UUWJcwNwyRBxA5YRaGphR2F7C3rJE5krTu2AhrdYiOdbQpbvwiwctcSVE=
X-Received: by 2002:a17:906:f288:: with SMTP id gu8mr28196272ejb.281.1587583228532;
 Wed, 22 Apr 2020 12:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAHC9VhT95GJKNTMvTtmZL35UOoVwbGH-eDWZyELb5oZ5rQU+Tw@mail.gmail.com>
 <2136640.1587472186@warthog.procyon.org.uk>
In-Reply-To: <2136640.1587472186@warthog.procyon.org.uk>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 22 Apr 2020 15:20:17 -0400
Message-ID: <CAHC9VhQnORRaRapbb1wrUsxweJCRJ+X+RdvKw8_U0pT0fuxZ6A@mail.gmail.com>
Subject: Re: Problem with 9ba09998baa9 ("selinux: Implement the watch_key
 security hook") in linux-next
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Apr 21, 2020 at 8:29 AM David Howells <dhowells@redhat.com> wrote:
> Paul Moore <paul@paul-moore.com> wrote:
>
> > ... in particular it is the fifth argument to avc_has_perm(),
> > "KEY_NEED_VIEW" which is a problem.  KEY_NEED_VIEW is not a SELinux
> > permission and would likely result in odd behavior when passed to
> > avc_has_perm().
>
> I think it works because KEY_NEED_VIEW happens to coincide with KEY__VIEW.  It
> should just use KEY__VIEW instead.

Yes, it looks like it.  To be clear, it is dangerous to rely on
permission values from outside SELinux aligning with SELinux
permissions; changing the outside permission values w/o adjusting the
SELinux hook code to do the necessary translation will result in some
scary behavior (wrong permission checks).

> > it probably makes the most sense to pull the permission mapping in
> > selinux_key_permission() out into a separate function, e.g.
> > key_perm_to_av(...)
>
> Agreed.  How about the attached patch?  I wonder if I should do bit-by-bit
> translation rather than using a switch?  But then it's difficult to decide
> what it means if someone passes in two KEY_NEED_* flags OR'd together - is it
> either or both?

Comments inline.

> > and then use this newly created mapping function in [...]
> > selinux_watch_key()
>
> No, I think I should just hard-code KEY__VIEW there.

FWIW, my comment was based on a version of linux-next where you were
making policycap based permission adjustments to KEY_VIEW and I
thought you would want the same adjustments to be applied to both
access control points.  That code appears to now be gone in
linux-next.

> ---
> commit 70d1d82aa014ae4511976b4d80c17138006dddec
> Author: David Howells <dhowells@redhat.com>
> Date:   Tue Apr 21 13:15:16 2020 +0100
>
>     selinux: Fix use of KEY_NEED_* instead of KEY__* perms
>
>     selinux_key_getsecurity() is passing the KEY_NEED_* permissions to
>     security_sid_to_context() instead of the KEY__* values.  It happens to work
>     because the values are all coincident.
>
>     Fixes: d720024e94de ("[PATCH] selinux: add hooks for key subsystem")
>     Reported-by: Paul Moore <paul@paul-moore.com>
>     Signed-off-by: David Howells <dhowells@redhat.com>
>
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 0b4e32161b77..32f7fa538c5f 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -6539,12 +6539,27 @@ static void selinux_key_free(struct key *k)
>         kfree(ksec);
>  }
>
> +static unsigned int selinux_keyperm_to_av(unsigned int need_perm)
> +{
> +       switch (need_perm) {
> +       case KEY_NEED_VIEW:     return KEY__VIEW;
> +       case KEY_NEED_READ:     return KEY__READ;
> +       case KEY_NEED_WRITE:    return KEY__WRITE;
> +       case KEY_NEED_SEARCH:   return KEY__SEARCH;
> +       case KEY_NEED_LINK:     return KEY__LINK;
> +       case KEY_NEED_SETATTR:  return KEY__SETATTR;
> +       default:
> +               return 0;
> +       }

Regarding your question of permission translation via switch-statement
as opposed to bit-by-bit comparison, I think it depends on if multiple
permissions are going to be required in a single call to the hook.
The failure mode for the code above if multiple permissions are
requested is not very good, it defaults to *no* permission which means
that if someone requested KEY_NEED_SEARCH|KEY_NEED_VIEW (or some other
combination) then the SELinux check would not check any permissions
... that seems wrong to me.

If we want to stick with a switch statement I think we should have it
return -EPERM for the default case to protect against this.  We don't
need the full 32-bits afforded us by the unsigned int.

> +}
> +
>  static int selinux_key_permission(key_ref_t key_ref,
>                                   const struct cred *cred,
> -                                 unsigned perm)
> +                                 unsigned need_perm)
>  {
>         struct key *key;
>         struct key_security_struct *ksec;
> +       unsigned int perm;
>         u32 sid;
>
>         /* if no specific permissions are requested, we skip the
> @@ -6553,6 +6568,7 @@ static int selinux_key_permission(key_ref_t key_ref,
>         if (perm == 0)
>                 return 0;
>
> +       perm = selinux_keyperm_to_av(need_perm);

... and add a check for (perm < 0) as discussed above if we stick with
the switch statement.

>         sid = cred_sid(cred);
>
>         key = key_ref_to_ptr(key_ref);
>

-- 
paul moore
www.paul-moore.com
