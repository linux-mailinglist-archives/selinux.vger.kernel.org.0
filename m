Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F92417BFAC
	for <lists+selinux@lfdr.de>; Fri,  6 Mar 2020 14:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgCFN4U (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 6 Mar 2020 08:56:20 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42709 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbgCFN4U (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 6 Mar 2020 08:56:20 -0500
Received: by mail-ot1-f65.google.com with SMTP id 66so2445783otd.9
        for <selinux@vger.kernel.org>; Fri, 06 Mar 2020 05:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=z7hQH73S33FR85kkSHxbichi2Zdy9R1pTwx3+MgUI7Y=;
        b=rQzrHbrbLvgp5cGOCjSJgIOLudadtd4R3Ev7tDNTPaRrztZCrft7i87zfg4ZPonQhh
         UWD71P4xpAbggAzPfXz1ReO1fr6XzdJezznPxQs6hC3RQAtdefif6DqIHNajBtCKrz7S
         9wzYVnNHUVDymynb5isMdwFJagm0WV2HouQ44DW0TXhR0fH3Ptrl6xBcKVPSnJrua76k
         UzBo4jo1cNJ90b/fUx2LYlCCSaNOKiz8Zu5ZOcOes1rYVgiztm1632B2OwXef/QK42KA
         hWErEJKrUwNEvmOZ2xQf9gwU1opHyo7DmlGBesWXEzvPjdoJgwGYLBixw5Eybe4v3k5n
         srsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=z7hQH73S33FR85kkSHxbichi2Zdy9R1pTwx3+MgUI7Y=;
        b=O/o3XbLMZNaz9kOTutIPZC3b1feoTXS9BMA3afsuzQv+uK0MWRctM6gE3oSutzbsGG
         eAFL6VxQ6UKHNOMnn0rsSLUzCvc5x2H6/Q0WkWG6r/QvifeHKLVx92GcOvlCVSlIHPmk
         7h1Kq98gp3WzW9/QfATL9sl2C/TvntSb92OJTN3wzl3tyrpo+nSRIKtNY0WKxHqFnAmK
         vrB4Hnmxn8cjAHpQjSP2EsTvhxgVoN1zBKG5bqWTq6GZjqGWzvObfDvP27fjRhHzQwWh
         6ozf5tqZ27RWMDF5xBrXhn+8Ou2IBb494fW+V7Kmi0C0qaR4R+OFxvyFzMaf6s8jEp4z
         vu3g==
X-Gm-Message-State: ANhLgQ2dlDmqjQMHT2Zzx9XIvpW743UPSfWikbrW3gx5D6EU+qrVgooL
        Ve6GpbjowujXt78QyPJQG3Amx+T4rAq85F8kmtrnqQ==
X-Google-Smtp-Source: ADFU+vvT9ob6zVemPzcmgDuYV2AQMXr2qV5swor4g0aIL4lDCSxVrtySH0MUmXsZtuBEcigJ2o+r/HCKdKiuqY4h1FQ=
X-Received: by 2002:a9d:6e85:: with SMTP id a5mr2464705otr.89.1583502979698;
 Fri, 06 Mar 2020 05:56:19 -0800 (PST)
MIME-Version: 1.0
References: <20200305184034.165554-1-dburgener@linux.microsoft.com>
In-Reply-To: <20200305184034.165554-1-dburgener@linux.microsoft.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Fri, 6 Mar 2020 08:57:32 -0500
Message-ID: <CAEjxPJ5OZpvvrWq9h1xYudLwZFgHj6nyr-uPnFqxoGEv91fk2A@mail.gmail.com>
Subject: Re: [PATCH] checkpolicy: Add --werror flag to checkmodule and
 checkpolicy to treat warnings as errors.
To:     Daniel Burgener <dburgener@linux.microsoft.com>,
        James Carter <jwcart2@gmail.com>,
        Joshua Brindle <joshua.brindle@crunchydata.com>,
        pebenito@ieee.org
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Mar 5, 2020 at 1:40 PM Daniel Burgener
<dburgener@linux.microsoft.com> wrote:
>
> When the lexer encounters an unexpected character in a policy source file=
, it prints a warning, discards the character and moves on.  In some build =
environments, these characters could be a symptom of an earlier problem, su=
ch as unintended results of expansion of preprocessor macros, and the abili=
ty to have the compiler halt on such issues would be helpful for diagnosis.
>
> Signed-off-by: Daniel Burgener <Daniel.Burgener@microsoft.com>

I'm trying to remember why this particular case (unmatched character
in the lexer) isn't already a fatal error.
If there isn't a real reason for it, we could alternatively just
switch it to use yyerror() in that case.
Otherwise, your description suggests that you only want to make that
particular case a fatal error; are you sure
you want to treat all warnings as fatal errors?
