Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3C52D4CA
	for <lists+selinux@lfdr.de>; Wed, 29 May 2019 06:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbfE2Ed7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+selinux@lfdr.de>); Wed, 29 May 2019 00:33:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43116 "EHLO eggs.gnu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725840AbfE2Ed7 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 29 May 2019 00:33:59 -0400
Received: from fencepost.gnu.org ([2001:470:142:3::e]:45629)
        by eggs.gnu.org with esmtp (Exim 4.71)
        (envelope-from <kaction@gnu.org>)
        id 1hVqHj-0002CM-Th
        for selinux@vger.kernel.org; Wed, 29 May 2019 00:33:57 -0400
Received: from [172.58.11.75] (port=23976 helo=localhost)
        by fencepost.gnu.org with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.82)
        (envelope-from <kaction@gnu.org>)
        id 1hVqHh-0000E6-7w
        for selinux@vger.kernel.org; Wed, 29 May 2019 00:33:54 -0400
To:     Jason Zaman <jason@perfinion.com>, 929063@bugs.debian.org
Cc:     Laurent Bigonville <bigon@debian.org>, selinux@vger.kernel.org,
        kaction@debian.org
Subject: Re: Bug#929063: SELinux integration in sysVinit
In-reply-to: <20190524130015.GA25786@baraddur.perfinion.com>
References: <8cef19ba-5055-39fd-873f-73c7ba13cb8e@debian.org> <20190524125522.GA48358@baraddur.perfinion.com> <E1hRCA0-0000al-Io@eggs.gnu.org> <20190524130015.GA25786@baraddur.perfinion.com>
Comments: In-reply-to Jason Zaman <jason@perfinion.com>   message dated "Fri, 24 May 2019 21:00:15 +0800."
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1616.1559101242.1@localhost>
Content-Transfer-Encoding: 8BIT
Date:   Wed, 29 May 2019 03:40:42 +0000
From:   Dmitry Bogatov <KAction@debian.org>
Message-Id: <1559104433.284129.14732@localhost>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


[ Sorry, if I messed quotation. It is complex ]

[2019-05-24 21:00] Jason Zaman <jason@perfinion.com>

> > > There is currently some discussion at [0] about SELinux
> > > integration in sysVinit and the fact that somebody wants to
> > > delegate the loading of the policy to an other binary than PID1.
> > > 
> > > Has somebody a remark or an objection to that proposal?
> > 
> > I object too. There is a *huge* change in functionality. Originally if
> > you boot with SELinux enforcing, there are only two things that can
> > happen. Either you end up with the policy loaded or the machine halts.
> > 
> > In the new patch, an attacker can just chmod -x /sbin/selinux-check then
> > next boot there will be no selinux enabled.
> > 
> > if (access(SELINUX_CHECK, X_OK) != 0) fails, the machine will continue
> > to boot without SELinux enabled. There is no difference between a user
> > without /sbin/selinux-check on purpose and an attacker just chmod -x'd
> > the tool.
> > 
> > SELinux does not protect /sbin anywhere near as much as /etc/selinux
> > (and doing that would probably be impossible). You'd need to check if
> > selinux is enabled and enforcing before skipping the loading ... which
> > is done by calling is_selinux_enabled() which needs linking to
> > libselinux. The important part of the original design is not
> > selinux_init_load_policy(), its is_selinux_enabled().

How does it come that attacker can just "chmod -x /sbin/selinux-check"?
Aren't there supposed to be SELinux rule, preventing attacker from doing
this, even if he cracked root process?

Okay, this patch should be accompanied with patch to src:refpolicy,
correct?
-- 
        Note, that I send and fetch email in batch, once every 24 hours.
                 If matter is urgent, try https://t.me/kaction
                                                                             --
