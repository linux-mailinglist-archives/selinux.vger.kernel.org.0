Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5E86A0E41
	for <lists+selinux@lfdr.de>; Thu, 23 Feb 2023 17:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjBWQy6 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 23 Feb 2023 11:54:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjBWQy4 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 23 Feb 2023 11:54:56 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 26F73515C0
        for <selinux@vger.kernel.org>; Thu, 23 Feb 2023 08:54:55 -0800 (PST)
Received: (qmail 1331461 invoked by uid 1000); 23 Feb 2023 11:54:54 -0500
Date:   Thu, 23 Feb 2023 11:54:54 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     selinux@vger.kernel.org
Subject: Re: What's wrong with this usage of semanage fcontext?
Message-ID: <Y/eaXrWaE1d+uEe7@rowland.harvard.edu>
References: <Y/Z/eJU/yEseH2Jk@rowland.harvard.edu>
 <CAEjxPJ63keBZZTemgVmhejZh8RLD55t+JDPuVtFVp3sKW6Y3fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEjxPJ63keBZZTemgVmhejZh8RLD55t+JDPuVtFVp3sKW6Y3fg@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Feb 23, 2023 at 08:05:13AM -0500, Stephen Smalley wrote:
> On Wed, Feb 22, 2023 at 4:00 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > To anyone who can provide some advice: I'd like to know what's going
> > wrong here.
> >
> > ------------------------------------------------------------
> > # semanage fcontext -a -e /home '/mnt/export/share./home'
> > # semanage fcontext -l -C
> > ...
> > SELinux Local fcontext Equivalence
> >
> > /mnt/export/share./home = /home
> > # restorecon -v -r /mnt/export/share4/home
> > Warning no default label for /mnt/export/share4/home
> > ------------------------------------------------------------
> >
> > Shouldn't /mnt/export/share4/home match the PCRE '/mnt/export/share./home'?
> > Why does restorecon say there's no default label?
> 
> I could be wrong but I think the equivalence aka substitution only
> works for fixed strings, not regexes (at least wrt the source/original
> path).

That was it!  Thanks.

Alan Stern
