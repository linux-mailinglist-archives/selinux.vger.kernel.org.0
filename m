Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114052CE329
	for <lists+selinux@lfdr.de>; Fri,  4 Dec 2020 00:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729631AbgLCXzD (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 3 Dec 2020 18:55:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbgLCXzD (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 3 Dec 2020 18:55:03 -0500
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:12e:520::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FED4C061A4F;
        Thu,  3 Dec 2020 15:54:23 -0800 (PST)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1kkyQR-00085F-6R; Fri, 04 Dec 2020 00:54:15 +0100
Date:   Fri, 4 Dec 2020 00:54:15 +0100
From:   Florian Westphal <fw@strlen.de>
To:     Paul Moore <paul@paul-moore.com>
Cc:     Mat Martineau <mathew.j.martineau@linux.intel.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        selinux@vger.kernel.org, mptcp@lists.01.org,
        linux-security-module@vger.kernel.org
Subject: Re: [MPTCP] Re: [RFC PATCH] selinux: handle MPTCP consistently with
 TCP
Message-ID: <20201203235415.GD5710@breakpoint.cc>
References: <3336b397dda1d15ee9fb87107f9cc21a5d1fe510.1606904940.git.pabeni@redhat.com>
 <3a5f156da4569957b91bb5aa4d2a316b729a2c69.camel@redhat.com>
 <539f376-62c2-dbe7-fbfd-6dc7a53eafa@linux.intel.com>
 <CAHC9VhTVc07P_MhWm7YRF6LXdMRQOcDEKe7SB+fpJJizdKOvEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHC9VhTVc07P_MhWm7YRF6LXdMRQOcDEKe7SB+fpJJizdKOvEg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Paul Moore <paul@paul-moore.com> wrote:
> I'm not very well versed in MPTCP, but this *seems* okay to me, minus
> the else-crud chunk.  Just to confirm my understanding, while MPTCP
> allows one TCP connection/stream to be subdivided and distributed
> across multiple interfaces, it does not allow multiple TCP streams to
> be multiplexed on a single connection, yes?

Its the latter.  The application sees a TCP interface (socket), but
data may be carried over multiple individual tcp streams on the wire.
