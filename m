Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2279023CF5E
	for <lists+selinux@lfdr.de>; Wed,  5 Aug 2020 21:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbgHETTz (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 5 Aug 2020 15:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728623AbgHETTt (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 5 Aug 2020 15:19:49 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469ECC061575
        for <selinux@vger.kernel.org>; Wed,  5 Aug 2020 12:19:49 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id s190so9016303ooa.13
        for <selinux@vger.kernel.org>; Wed, 05 Aug 2020 12:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WURAb002xgJ9SGVgQHbr2oWKUuaEX6lb7zXsW0gP1V4=;
        b=fo8StR3FPpban78Y514jEaOrq5kFc+8VvAh2flxeMzj+c6ehFa/qpE9LX97lE1TNa2
         wFSobnTzJQWqc6HeJQPH1pVoltIUuZBThqj1rU8b8o3g6miMFEAOETQ76U5uK36ipOYB
         L2cw+4OYopV62xnh6diaUJTIwdKLvuyoFb5ACNrCqVv0HSES7jYQ6qRMbeEre6nO8kQm
         jSixHsXUqOcs8hZZ/NY6wYTvQuNhIO1kS5qLSFKZjKOiYcvhYoBG9ddkbNTTBBziq+bu
         ZeOGtio9XrXucouoZ08OCe0qzm7NX6NFTE7TgBM8rTBwXbzjUSCu3H7ZWzopmOruPGgI
         tpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WURAb002xgJ9SGVgQHbr2oWKUuaEX6lb7zXsW0gP1V4=;
        b=WUguwpmHxXIStlnjfZBQvL/PPLIiVR2nBKzHzJLHYbSJt6YZK/Wq9BKzyqbjGmV+bb
         qVgNQorcjVvMlZVUawI+0MPiETc6ORu3U0Kw/HvUviGUAkoE3U1uU3PP+FS/39joKE/V
         Fm/r4jHqJGf2bkvL88K02W6hD/6oXOfbKAbrK/J61a1apg+5sjzt/tB1kCQPyjdBWcgD
         20bIxDcmw101FN1yu8PW3CKoXENBEPTCiU+O+QS+A8R0SNFkG+Dm91yKk5D6L/U4FzWf
         yBkGU55TcclfIz4MXqZoQbaVUmTys0f7A1eSEC5S6nhSl3oU50eMqIO4R/RgrTTx0U6V
         ww1A==
X-Gm-Message-State: AOAM5329udCXpAYse5vcTutmngdycKcEAbAbzdUCaD0ZAON9CAbHudgq
        EhOjOTkZKSNRsiP+A/Jrc4bceylCgsUSobPZbJBDFUVZAz8=
X-Google-Smtp-Source: ABdhPJxeELrriCMzYtBFlpATVfDveGFfFJyFesd2Wlt93jywpYsadMrPfDuWGGAOKbYMva9/8tpEWTcWambFHlnCj3w=
X-Received: by 2002:a4a:4201:: with SMTP id h1mr4315641ooj.1.1596655188414;
 Wed, 05 Aug 2020 12:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAP+JOzQMM5YpemgPXzAZew+oHiV6fgPuuY5WFSyQb2cEkFLwRA@mail.gmail.com>
 <20200802123421.222597-1-dominick.grift@defensec.nl> <CAP+JOzQ=wnAWHp7i6OVjpV58QxdFPT63ON7HOLuVHjoL8O2Oqg@mail.gmail.com>
 <ypjlft9298vi.fsf@defensec.nl> <CAP+JOzRgJmD8NE-_nY118G_h7B70Y70=jT1n8TimcMGPjDYFxw@mail.gmail.com>
 <ypjlbljq8l9d.fsf@defensec.nl> <CAP+JOzRUPpWXXmmuX5zdS1qCCbhpAXm8uO9JXvy+pYeBOoGbnA@mail.gmail.com>
 <ypjl7due88a1.fsf@defensec.nl>
In-Reply-To: <ypjl7due88a1.fsf@defensec.nl>
From:   James Carter <jwcart2@gmail.com>
Date:   Wed, 5 Aug 2020 15:23:02 -0400
Message-ID: <CAP+JOzQe8Q0GKtm9aavEQTzFWCT8sUi8shjw=TmgJYm5XkaN_w@mail.gmail.com>
Subject: Re: [PATCH v4] secilc/docs: document expandtypeattribute
To:     Dominick Grift <dominick.grift@defensec.nl>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Aug 4, 2020 at 4:29 PM Dominick Grift
<dominick.grift@defensec.nl> wrote:
>
> James Carter <jwcart2@gmail.com> writes:
>
> > On Tue, Aug 4, 2020 at 11:48 AM Dominick Grift
> > <dominick.grift@defensec.nl> wrote:
> >>
> >> James Carter <jwcart2@gmail.com> writes:
> >>
> >> > On Tue, Aug 4, 2020 at 3:18 AM Dominick Grift
> >> > <dominick.grift@defensec.nl> wrote:
> >> >>
> >> >> James Carter <jwcart2@gmail.com> writes:
> >> >>
> >> >> > On Sun, Aug 2, 2020 at 8:39 AM Dominick Grift
> >> >> > <dominick.grift@defensec.nl> wrote:
> >> >> >>
> >> >> >> This was added for Androids Treble in 2017.
> >> >> >>
> >> >> >> Signed-off-by: Dominick Grift <dominick.grift@defensec.nl>
> >> >> >> ---
> >> >> >> v2: overriden is overridden
> >> >> >> v3: add link to README.md
> >> >> >> v4: rephrase and add another example
> >> >> >>
> >> >> >>  secilc/docs/README.md              |  1 +
> >> >> >>  secilc/docs/cil_type_statements.md | 44 ++++++++++++++++++++++++++++++
> >> >> >>  2 files changed, 45 insertions(+)
> >> >> >>
> >> >> >> diff --git a/secilc/docs/README.md b/secilc/docs/README.md
> >> >> >> index 3f1838e6..efab2a71 100644
> >> >> >> --- a/secilc/docs/README.md
> >> >> >> +++ b/secilc/docs/README.md
> >> >> >> @@ -126,6 +126,7 @@ CIL (Common Intermediate Language)
> >> >> >>    * [typealiasactual](cil_type_statements.md#typealiasactual)
> >> >> >>    * [typeattribute](cil_type_statements.md#typeattribute)
> >> >> >>    * [typeattributeset](cil_type_statements.md#typeattributeset)
> >> >> >> +  * [expandtypeattribute](cil_type_statements.md#expandtypeattribute)
> >> >> >>    * [typebounds](cil_type_statements.md#typebounds)
> >> >> >>    * [typechange](cil_type_statements.md#typechange)
> >> >> >>    * [typemember](cil_type_statements.md#typemember)
> >> >> >> diff --git a/secilc/docs/cil_type_statements.md b/secilc/docs/cil_type_statements.md
> >> >> >> index f9dd3a76..41f0f01a 100644
> >> >> >> --- a/secilc/docs/cil_type_statements.md
> >> >> >> +++ b/secilc/docs/cil_type_statements.md
> >> >> >> @@ -213,6 +213,50 @@ This example is equivalent to `{ domain -kernel.process -ueventd.process -init.p
> >> >> >>          )
> >> >> >>      )
> >> >> >>
> >> >> >> +expandtypeattribute
> >> >> >> +-------------------
> >> >> >> +
> >> >> >> +Overrides the compiler defaults for the expansion of one or more previously declared [`typeattribute`](cil_type_statements.md#typeattribute) identifiers.
> >> >> >> +
> >> >> >> +Note that this statement can be overridden at compile-time with `secilc -X SIZE` and that this functionality is not intended to override `secilc -X SIZE` for individual type attributes!
> >> >> >> +
> >> >>
> >> >> <snip>
> >> >> > When the value
> >> >> > is false, the type attribute will not be removed from the policy, even
> >> >> > if the default expand rules or "-X" option cause the rules involving
> >> >> > the type attribute to be expanded.
> >> >>
> >> >> Yes but I cannot produce that. In my earlier test the type attribute
> >> >> was expanded regardless of the -X option.
> >> >>
> >> >> In my test I instructed secilc to expand all attributes with more than 3
> >> >> members (-X 4), then I added a expandtypeattribute statement telling
> >> >> secilc to not expand pets and colors.
> >> >>
> >> >> The result was that it expanded pets and colors anyway.
> >> >>
> >> >
> >> > I see the source of your confusion now. "-X 4" means that all
> >> > attributes with LESS than 4 types associated with it will be expanded.
> >>
> >> I think its important to clarify this in the documentation. ie:
> >> expandattribute false will not work if you use -X (-X will override the
> >> false statement)
> >>
> >> I think that is unintuitive, I would actually want to be able to for
> >> example expand all attributes with less then 4 members except a few
> >> specific ones.
> >>
> >
> > It is poorly named at this point. I think it was a victim of multiple
> > changes over time. A better name now would be removeattribute. That
> > would be more accurate, because what is really being controlled is
> > whether the attribute is kept as defined in the policy or not.
> >
> > I am not sure what advantage there would be to expanding and removing
> > all except a few selected attributes with less than 4 members, except
> > for the case when you needed those selected attributes to remain
> > defined in the policy.  Not much space is going to be saved by not
> > expanding them. Ok, I guess the advantage would be that the name of
> > the rule would make more sense. I will grant that.
> >
> > At any rate, the name stinks, but the functionality is exactly what is
> > needed. I can trade a large policy for quicker access checks by using
> > the "-X SIZE" option and I can retain the definitions of the
> > attributes that need to be defined using expandattribute false.
> >
> > This whole discussion is why keeping the selinux-notebook in sync with
> > language changes will be very valuable practice.
>
> I agree and that is why I added the "Note", so that readers have some
> reference when they figure out that they cannot override -X for
> specified attributes.
>
> If you still do not like this v4 patch then tell me (again) what you
> want in there and I will put it in there without argueing so that we can
> wrap this up.
>
I would like this:

Overrides the compiler defaults for the expansion of one or more
previously declared
[`typeattribute`](cil_type_statements.md#typeattribute) identifiers.

This rule gives more control over type attribute expansion and
removal. When the value is true, all rules involving the type
attribute will be expanded and the type attribute will be removed from
the policy. When the value is false, the type attribute will not be
removed from the policy, even if the default expand rules or "-X"
option cause the rules involving the type attribute to be expanded.

Thanks again,
Jim

> >
> > Thanks,
> > Jim
> >
> >> >
> >> > Jim
> >> >
> >> >> >
> >> >> > Thanks,
> >> >> > Jim
> >> >> >
> >> >> >> +**Statement definition:**
> >> >> >> +
> >> >> >> +    (expandtypeattribute typeattribute_id true|false)
> >> >> >> +
> >> >> >> +**Where:**
> >> >> >> +
> >> >> >> +<table>
> >> >> >> +<colgroup>
> >> >> >> +<col width="25%" />
> >> >> >> +<col width="75%" />
> >> >> >> +</colgroup>
> >> >> >> +<tbody>
> >> >> >> +<tr class="odd">
> >> >> >> +<td align="left"><p><code>expandtypeattribute</code></p></td>
> >> >> >> +<td align="left"><p>The <code>expandtypeattribute</code> keyword.</p></td>
> >> >> >> +</tr>
> >> >> >> +<tr class="even">
> >> >> >> +<td align="left"><p><code>typeattribute_id</code></p></td>
> >> >> >> +<td align="left"><p>One or more previously declared
> >> >> >> <code>typeattribute</code> identifiers. Multiple entries consist of
> >> >> >> a space separated list enclosed in parentheses '()'.</p></td>
> >> >> >> +</tr>
> >> >> >> +<tr class="odd">
> >> >> >> +<td align="left"><p><code>true | false</code></p></td>
> >> >> >> +<td align="left"><p>Either true or false.</p></td>
> >> >> >> +</tr>
> >> >> >> +</tbody>
> >> >> >> +</table>
> >> >> >> +
> >> >> >> +**Examples:**
> >> >> >> +
> >> >> >> +This example uses the expandtypeattribute statement to forcibly expand a previously declared `domain` type attribute.
> >> >> >> +
> >> >> >> +    (expandtypeattribute domain true)
> >> >> >> +
> >> >> >> +This example uses the expandtypeattribute statement to not expand
> >> >> >> previously declared `file_type` and `port_type` type attributes
> >> >> >> regardless of compiler defaults.
> >> >> >> +
> >> >> >> +    (expandtypeattribute (file_type port_type) false)
> >> >> >> +
> >> >> >>  typebounds
> >> >> >>  ----------
> >> >> >>
> >> >> >> --
> >> >> >> 2.28.0
> >> >> >>
> >> >>
> >> >> --
> >> >> gpg --locate-keys dominick.grift@defensec.nl
> >> >> Key fingerprint = FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
> >> >> https://sks-keyservers.net/pks/lookup?op=get&search=0xDA7E521F10F64098
> >> >> Dominick Grift
> >>
> >> --
> >> gpg --locate-keys dominick.grift@defensec.nl
> >> Key fingerprint = FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
> >> https://sks-keyservers.net/pks/lookup?op=get&search=0xDA7E521F10F64098
> >> Dominick Grift
>
> --
> gpg --locate-keys dominick.grift@defensec.nl
> Key fingerprint = FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
> https://sks-keyservers.net/pks/lookup?op=get&search=0xDA7E521F10F64098
> Dominick Grift
