Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53D237DDA9D
	for <lists+selinux@lfdr.de>; Wed,  1 Nov 2023 02:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235851AbjKABcG (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 31 Oct 2023 21:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbjKABcF (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 31 Oct 2023 21:32:05 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB819E8
        for <selinux@vger.kernel.org>; Tue, 31 Oct 2023 18:31:59 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d9beb865a40so5770704276.1
        for <selinux@vger.kernel.org>; Tue, 31 Oct 2023 18:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1698802319; x=1699407119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAtbtXoeyQL2kI+3xh8JmxZpodoQXPkbKDeMUcyZ+DU=;
        b=IFPouKtcWELcNlKP5qKaVshNtxWTHbkG3zwk8ABZaxtlbjnOFhQNp2viGMbxi5rhkq
         hHXDH2S9f3d7ZYAsjNyV0CDUIDshEBsw5Z2PMX3HEQBrLPdq7wZGz9bnY2Pb1BBue6mj
         Ibtk7bdGInN1E/mhln1clpqrsNO98O9S2xazw4CSEuAjg6X/exyOn3m4HGw6LTuCyjNJ
         OJ6z7OsudloLlwgrsFsahpH0mdThXAcdxF5IvhHc/2a5jPLevROo1HGl4q/3cbWu/unu
         nyJfRfIgNFrMKWD01cHrQTBE5vNqIKPQyyxxhW4y7iPVRkVHFEOLoWiKyWcdb6I0hd4x
         I7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698802319; x=1699407119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAtbtXoeyQL2kI+3xh8JmxZpodoQXPkbKDeMUcyZ+DU=;
        b=uK83UwWbSa1DUgjuLnE1f0OJYfXbtwswniop7Wc5Hr+Aqul4viR/lRC+fSpEd8ZmIE
         tkcMd0Uq6y9P42TeXxNTc7U53wtV5b5uLk6ifraY/qKhskZhmy+D2nA/cp5+pJarL820
         3QaKzVcdqtV7lFgkahe7T34oDhDd0moH6AJ1RUCkKErdhvbVe55BoGF72xpnpJh2oE6u
         TnnmZyWh+sCmY16t16t3JsExW7wrUDoM5uO5pcnvMbf9/06aAwVgnREkJyJKf52wTvFt
         rXtVh/oHg2AoMialFxOkHfrI2i+0yFceLO+4O9oajyzMk8t6L5VN6+TQTPfCPnrLCZio
         H90w==
X-Gm-Message-State: AOJu0Yz4DNVXTaPyx2nUaGrY6C6vlXh2J3EGegmyZt8AOjgOLufoVrSV
        A6+feOWJ0yeAVVjPJDt/IGfSX1uRrkm9H9wMwv8f
X-Google-Smtp-Source: AGHT+IFaty8q/YU9+RKjuTi/K5RqkTtKBa9esaVDZXsopmxgTuyR6pQ67IqImVBTbPpnJ2KaQP7urzV337kh2Od/6Ko=
X-Received: by 2002:a25:8243:0:b0:da0:3b7e:6ad8 with SMTP id
 d3-20020a258243000000b00da03b7e6ad8mr12576282ybn.10.1698802319135; Tue, 31
 Oct 2023 18:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <78932582fa556fd5fd6e8886e80e993f.paul@paul-moore.com> <CAHk-=whOtZK1g_dzEnb5NEB8ssNqotmHy3CkUwbnab_4phFRdw@mail.gmail.com>
In-Reply-To: <CAHk-=whOtZK1g_dzEnb5NEB8ssNqotmHy3CkUwbnab_4phFRdw@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 31 Oct 2023 21:31:48 -0400
Message-ID: <CAHC9VhQs9H-f8qZbwMgcF=LHEwspxvdJSNhhjwGu5K-ExYjPZw@mail.gmail.com>
Subject: Re: [GIT PULL] selinux/selinux-pr-20231030
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
        selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Oct 31, 2023 at 2:13=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Mon, 30 Oct 2023 at 16:16, Paul Moore <paul@paul-moore.com> wrote:
> >
> > * Use a better hashing function for the SELinux role tansition hash
> >   table.
>
> Bah.
>
> While the old hash function was garbage, the new one is quite expensive.
>
> Maybe it's worth it.
>
> But generally, if you find that "oh, just doing a modulus with a power
> of two drops all high bits", the first thing to try is probably to
> just do "hash_long(x, N)" to get N bits instead.
>
> Assuming the input is somewhat ok in one word, it does a fairly good
> job of mixing the bits with a simple multiply-and-shift.
>
> Yes, yes, jhash is a fine hash, but it does a quite *lot* of (simple)
> ALU ops. While "hash_long()" is often small enough to be inlined.

We probably should do some performance measurements of the various
hash tables in the SELinux code and use that to drive some decisions
on what functions we use.  There have been some in the past for
specific tables, but I don't think we've done anything comprehensive,
or recent.  This latest change obviously focused more on ensuring a
better distribution, which can help, but if the digest calculation is
too slow it probably doesn't matter.

> I also note that filenametr_hash() does the old "one byte at a time"
> hash and partial_name_hash(). Is there any reason that code doesn't
> use the "full_name_hash()" which does things a word at a time?

Likely just a matter of no one looking at it and realizing it can be
improved.  I'll toss this on the todo list, it should take all of five
minutes.

> Probably doesn't matter, but since I looked at this to see what the
> new hashing was, I noticed...

No harm in mentioning it, feedback is always welcome, but you know
what else is even more welcome?  Patches ;)

--=20
paul-moore.com
