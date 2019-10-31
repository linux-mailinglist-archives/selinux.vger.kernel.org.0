Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCF8DEACCF
	for <lists+selinux@lfdr.de>; Thu, 31 Oct 2019 10:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfJaJrb (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 31 Oct 2019 05:47:31 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33664 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbfJaJrb (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 31 Oct 2019 05:47:31 -0400
Received: by mail-lf1-f68.google.com with SMTP id y127so4095730lfc.0
        for <selinux@vger.kernel.org>; Thu, 31 Oct 2019 02:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M5lsnBLAOscz+eqJqCitZcN4u6tDV06AOdbwrk54IRU=;
        b=S0YhV8rvW2YoAMj+dvFNdv0xzTMRd5DY5exVV7WtlIuZnqgDhXkRgsjLOgiTDzL3WB
         1q+j/G6txlMODd8lLdw6pvrHEmDq8jTSut6MxD9UI7Opr6TfP/6T2Qkiqv2FER7zQBRZ
         8n2FjRK/JChAkfNPdUAzsLUExuSsRF2hS675PQS+lzRkFWu5aci56tRilWJp7VSqrbMz
         mPQbT0LZK26Vb2IUDWulsbUABiMccedpovbzDdLQVcAUdbbV8srrHktOW0viaS5XzhEp
         O/tMuDTZMwUBqWhSvl74nVr/dBlH/CnmfhMm45u1qMoKvGF5hEv0kJYYB3N8Mlwk6IlS
         Y7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M5lsnBLAOscz+eqJqCitZcN4u6tDV06AOdbwrk54IRU=;
        b=Md3t/BTeO/yu4ygyulV5mmYwnH6kri73Oy3UvQwS84hYbcAjjihy+TbNyQksuZHf8D
         BDCwfqrNBQMjxVovbxkNm4oZKhxxk6dF0O+YKV5RyB5fRY3G9Sj0tXdl3BQKVVMt0E9B
         wFG42EFWpR5CdEuzs+IFaPl6mf/SUc6ViMGB5Srj9LMDjc+CFJGqPLC9CJJnMJ8U/zvB
         e7YXDcpTAnbIotNbXW91jI6NL0L9774UIOOXVUSiYxe/pe6iwmGAqEH0NA1ftKw7fm+W
         KWBXQJicFCBvopJRq9e8iN0OumL2SzpoEGywpnXhQVuj13UkCTXXt8oX+UINoDaSq9d4
         6Rug==
X-Gm-Message-State: APjAAAWDiCxPyaplHIw4tl1QPri3yYKEMR70erOduORKQNoU7aACXmM6
        ZYVKl5rtxmALbUF1XWf4UgXKDlOEWCavcU8K/W5BHGfxyA==
X-Google-Smtp-Source: APXvYqwmtK5uuVJ0CUmBA45WUed7OGz6iV3J1Rl/Mi4KClc3t9VkjeVFxH6tyfOzptBGjYHJbp95JdGWB3ODPRKtXV0=
X-Received: by 2002:a19:8092:: with SMTP id b140mr2720435lfd.13.1572515248887;
 Thu, 31 Oct 2019 02:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191030131633.9356-1-sds@tycho.nsa.gov> <365ca063-6efd-8051-8d4b-5c8aef0d2e12@tycho.nsa.gov>
In-Reply-To: <365ca063-6efd-8051-8d4b-5c8aef0d2e12@tycho.nsa.gov>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 31 Oct 2019 05:47:18 -0400
Message-ID: <CAHC9VhRoBGgw3YrACh5LffcFhDMefEqF7dWuqD+bEadFMr5o3A@mail.gmail.com>
Subject: Re: [RFC PATCH] selinux: add SELinux hooks for lockdown integrity and confidentiality
To:     Stephen Smalley <sds@tycho.nsa.gov>
Cc:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Oct 30, 2019 at 11:29 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
> On 10/30/19 9:16 AM, Stephen Smalley wrote:
> > Add SELinux access control hooks for lockdown integrity and
> > confidentiality. This effectively mimics the current implementation of
> > lockdown (caveat noted below). If lockdown is enabled alongside SELinux,
> > then the lockdown access control will take precedence over the SELinux
> > lockdown implementation.
> >
> > Note that this SELinux implementation allows the integrity and
> > confidentiality reasons to be controlled independently from one another.
> > Thus, in an SELinux policy, one could allow integrity operations while
> > blocking confidentiality operations.
>
> NB This is intended to be the first of a series that will ultimately
> lead to finer-grained controls than just integrity and confidentiality,
> but wanted to get some feedback on it at this stage.  Also anticipate
> greater controversy over exposing finer granularity since the lockdown
> reasons are free to change at any time, so this would be the baseline
> fallback position if finer grained controls are rejected.
>
> > (original patch authored by an intern who wishes to remain anonymous;
> > I am signing off on his behalf)

I'm not going to comment on this on-list because IANAL, but it might
be best to leave the comment above off of future postings as I think
it somewhat confuses the principle behind the sign-off line.  I
understand you want to give credit where it is due, but without an
explicit author's name/email I believe it is safer for you to assume
that role.

Put another way, the comment above makes me nervous about adding my
own sign-off and merging it into the SELinux tree.

> > Signed-off-by: Stephen Smalley <sds@tycho.nsa.gov>
> > ---
> >   security/selinux/hooks.c            | 22 ++++++++++++++++++++++
> >   security/selinux/include/classmap.h |  2 ++
> >   2 files changed, 24 insertions(+)

-- 
paul moore
www.paul-moore.com
