Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 928C5399189
	for <lists+selinux@lfdr.de>; Wed,  2 Jun 2021 19:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbhFBRYA (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 2 Jun 2021 13:24:00 -0400
Received: from mail-ed1-f50.google.com ([209.85.208.50]:46777 "EHLO
        mail-ed1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231522AbhFBRXr (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 2 Jun 2021 13:23:47 -0400
Received: by mail-ed1-f50.google.com with SMTP id r11so3804216edt.13
        for <selinux@vger.kernel.org>; Wed, 02 Jun 2021 10:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gy9Q7B0FuTlWBXK6WYBPF7wGYJPXhU3skgW7sND1F44=;
        b=2H6a3268Y8rIPosDNohIqk8IO4fbbcCe2MxIvAL4DAsXs6XhnZ+s2taAuHxEbLD7Ov
         t133LXlJlBYPTa33YGOOt+vzxQ1o/dMjZYLPPIqrpAjXwrVE6mLIVT4ZYQBVLgNbdaCf
         BsefM2xqagD9LSZgrWFxp7/Hh835cv3sPwekKc5aQaBFBTkYa7fT7wQ2QLV5JnijVMfk
         k0akN1PfRPwFSvnLNhE7y7AY2mKUkogVXBEVTMysu7ybCcaPMtaX+1hJWuGPELNXzqpF
         Ts3beQjlQuLWfZXEsxcBbuJhsvA+q66yDxSnC+ExOz2OKeENKoZNrWd7yK/TwmHmIie+
         Z6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gy9Q7B0FuTlWBXK6WYBPF7wGYJPXhU3skgW7sND1F44=;
        b=oWgqHqXfOZOurB6dfZIMvRFJ1ocUXZZfJ7Pil3mFVJnRk7z3TuOM/34v0D9FBHNm3S
         YaYHrALVcJ1HsEgO5r4RxafVCaH2LQ768f9iC3wvTXV+wYmpcymvs6dQJrkUXU/55tXm
         YQy0/K8niDddZyNZS7jtsfEq9W2IXp/Ea91vh4KfLXqukvY1dj2E819kCO/cQn7NwmRI
         LOfBnBKr5FJPmn9lLI67EAkDpchXgpe6KR/Tjz/sCFVj8/T4yFOKdz/ifJj4hmOk+TwE
         7qH1lGTCS2F8G+cwD2oI9+rfqfVDNEaASiyQ7hUy93WyXXt5IhPL0oA23B/SEligma5I
         um9g==
X-Gm-Message-State: AOAM530TUuZ3v5xw0RKQKQ/RR38dxoNnBJLg9riJHKvFZ3Cb6yNlT2NL
        EILLLpD+7kyJxsdy2wRtCsFcIHwhdUYcC4DuC2gm
X-Google-Smtp-Source: ABdhPJzZAlpK8lC7eFoF6MjrjKot1TrFwp5krb6NmggDDvvweCN+qMzgsiPBBTtWKnkHrJm4FoBpqVHcr9KK0G5n+FI=
X-Received: by 2002:a05:6402:158e:: with SMTP id c14mr25945297edv.128.1622654463808;
 Wed, 02 Jun 2021 10:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <162163367115.8379.8459012634106035341.stgit@sifl>
 <162163380685.8379.17381053199011043757.stgit@sifl> <20210528223544.GL447005@madcap2.tricolour.ca>
 <CAHC9VhTr_hw_RBPf5yGD16j-qV2tbjjPJkimMNNQZBHtrJDbuQ@mail.gmail.com>
 <20210531134408.GL2268484@madcap2.tricolour.ca> <CAHC9VhSFNNE7AGGA20fDk201VLvzr5HB60VEqqq5qt9yGTH4mg@mail.gmail.com>
 <20210602153757.GQ2268484@madcap2.tricolour.ca>
In-Reply-To: <20210602153757.GQ2268484@madcap2.tricolour.ca>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 2 Jun 2021 13:20:52 -0400
Message-ID: <CAHC9VhSU16XG1SL_Nx1rXvakT=Lr4cFAc29bSsRzXEf-T=scvg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/9] audit: add filtering for io_uring records
To:     Richard Guy Briggs <rgb@redhat.com>
Cc:     linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        linux-audit@redhat.com, io-uring@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Jens Axboe <axboe@kernel.dk>,
        Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Jun 2, 2021 at 11:38 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2021-06-01 21:40, Paul Moore wrote:
> > On Mon, May 31, 2021 at 9:44 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2021-05-30 11:26, Paul Moore wrote:
> > > > On Fri, May 28, 2021 at 6:36 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > > On 2021-05-21 17:50, Paul Moore wrote:
> > > > > If we abuse the syscall infrastructure at first, we'd need a transition
> > > > > plan to coordinate user and kernel switchover to seperate mechanisms for
> > > > > the two to work together if the need should arise to have both syscall
> > > > > and uring filters in the same rule.
> > > >
> > > > See my comments above, I don't currently see why we would ever want
> > > > syscall and io_uring filtering to happen in the same rule.  Please
> > > > speak up if you can think of a reason why this would either be needed,
> > > > or desirable for some reason.
> > >
> > > I think they can be seperate rules for now.  Either a syscall rule
> > > catching all io_uring ops can be added, or an io_uring rule can be added
> > > to catch specific ops.  The scenario I was thinking of was catching
> > > syscalls of specific io_uring ops.
> >
> > Perhaps I'm misunderstand you, but that scenario really shouldn't
> > exist.  The io_uring ops function independently of syscalls; you can
> > *submit* io_uring ops via io_uring_enter(), but they are not
> > guaranteed to be dispatched synchronously (obviously), and given the
> > cred shenanigans that can happen with io_uring there is no guarantee
> > the filters would even be applicable.
>
> That wasn't my understanding.  There are a number of io_uring calls
> starting with at least open that are currently synchronous (but may
> become async in future) that we may want to single out which would be a
> specific io_uring syscall with a specific io_uring opcode.  I guess
> that particular situation would be caught by the io_uring opcode
> triggering an event that includes SYSCALL and URINGOP records.

The only io_uring syscalls are io_uring_setup(2), io_uring_enter(2),
etc., the stuff that is dispatched in io_issue_sqe() are the io_uring
ops/opcodes/whatever.  They *look* like syscalls but they are not and
we have to treat them differently.

> > It isn't an issue of "can" the filters be separate, they *have* to be separate.

-- 
paul moore
www.paul-moore.com
