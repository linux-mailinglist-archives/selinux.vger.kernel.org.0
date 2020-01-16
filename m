Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6195213FC30
	for <lists+selinux@lfdr.de>; Thu, 16 Jan 2020 23:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390021AbgAPW2v (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 16 Jan 2020 17:28:51 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42705 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390055AbgAPW2v (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 16 Jan 2020 17:28:51 -0500
Received: by mail-lj1-f196.google.com with SMTP id y4so24353629ljj.9
        for <selinux@vger.kernel.org>; Thu, 16 Jan 2020 14:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vnknp5E9zqxsx42dyIhNq1soSTvwogePIiI49YmjxtM=;
        b=lBwx6bnvOyJIODFOb+swAVjkbdOV0EKj6AIA2hOVPPWFjp8MltYHZoMD7fdauXcZsN
         H1AKfaofDwhtAnE8jmtYghcAa1+n4xSZZDWBrbYr+Xu7iXRwhP0UZyFPyIjmHO6A2gNB
         2dsWSF6+OR6Lthr2gZ4YAYi+D51L8OlY1W0EEEXXsmvn/qnmwr7I3P8CtsAU8GIjSbyc
         wqBhvCXwEGzErngB89XNDFkr0ats2NHCSCAvTVBcq/FkMyT7P9WxlzgQEAnfCT2Dv/0+
         SukCd+4Yhn8quvd8IGRycmtMMxwPeORtnEmK6aiOZ61Lny60pj6qPFplDpyV3mgtnFGR
         Ao3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vnknp5E9zqxsx42dyIhNq1soSTvwogePIiI49YmjxtM=;
        b=O1Mi6PYO2oPPtbcgXsQ3rFsXFFhYS2S+SJbW8GdBEd7Fly7aZlXOvweRE1vnkVAnw3
         5k5LhF+ky/nNgM4DjbABvL9csapsPZ+fyE2lAOHUqM5jEmrx/YJlyYiE1URLDeNTZjbL
         r85/AdKjKACCep3ByelWgTWrX+1VsJ9yCZ1gNlEticaCbZ7tw2jb8/3hZ8wkeJ53E/eg
         gzkglA/ngd2mSByf6xy7Z0hhe1alA0HYFqS5/tp82cC5KcuvZlMozS/jzaXFsMvIiG5I
         5fUZ846aclBciYNa6IqApb3rxstgf8ur3vRoTNsezewBqd6nmMjMC7GJgDh17i5NAtpQ
         3WAA==
X-Gm-Message-State: APjAAAWavm5OMpaDjPq3CE7GkNJOhV8qSwaPHYNlUW230OGeg6VrSPtX
        fv08Rifc4FGLJ4HDpLtF5u4heAzN7QcgxWubZkYV
X-Google-Smtp-Source: APXvYqxUDZvhj6ueLGk/u0cmzLO3MQMxoq9szyAEEDs7AJY1oMopWqgX6nSDmuxpMkQ0J1aCoFN2tVopoeFFxAJTaCE=
X-Received: by 2002:a2e:870b:: with SMTP id m11mr3706620lji.93.1579213729091;
 Thu, 16 Jan 2020 14:28:49 -0800 (PST)
MIME-Version: 1.0
References: <20200116120439.303034-1-omosnace@redhat.com> <20200116120439.303034-3-omosnace@redhat.com>
 <1aa7f437-7b34-4097-2af8-6f519e16d916@tycho.nsa.gov>
In-Reply-To: <1aa7f437-7b34-4097-2af8-6f519e16d916@tycho.nsa.gov>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 16 Jan 2020 17:28:38 -0500
Message-ID: <CAHC9VhTtcSjz9CQUk_Hpehiwuqe0_t5pg2=z=vC-PZUajJ2eZQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] selinux: simplify security_preserve_bools()
To:     Stephen Smalley <sds@tycho.nsa.gov>,
        Ondrej Mosnacek <omosnace@redhat.com>
Cc:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Jan 16, 2020 at 11:41 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
> On 1/16/20 7:04 AM, Ondrej Mosnacek wrote:
> > First, evaluate_cond_node() never returns an error. Make it just return
> > void.
> >
> > Second, drop the use of security_get_bools() from
> > security_preserve_bools() and read from the old policydb directly. This
> > saves some useless allocations and together with the first change makes
> > security_preserve_bools() no longer possibly return an error. Again the
> > return type is changed to void.
> >
> > Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
>
> Dropping use of security_get_bools() means we are no longer reading the
> boolean values with the policy read-lock held so they could in theory
> change underneath us.  However, this is presently prevented via the
> fsi->mutex taken by selinuxfs so I believe this is safe.

Since this code shouldn't be run very often, I think I would prefer
the added abstraction and safety of preserving the call to
security_get_bools().

In an effort to make sure expectations are set correctly, patches 2
through 6 are something that should probably wait until after the
upcoming merge window, so no rush on a respin.

-- 
paul moore
www.paul-moore.com
