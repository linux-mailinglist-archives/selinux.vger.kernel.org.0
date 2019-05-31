Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29AD33140A
	for <lists+selinux@lfdr.de>; Fri, 31 May 2019 19:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfEaRpM (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 31 May 2019 13:45:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45154 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726653AbfEaRpM (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 31 May 2019 13:45:12 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 1F7E66EBA1;
        Fri, 31 May 2019 17:45:12 +0000 (UTC)
Received: from localhost (ovpn-204-38.brq.redhat.com [10.40.204.38])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 747AA19C69;
        Fri, 31 May 2019 17:45:11 +0000 (UTC)
References: <20190529160337.4672-1-plautrba@redhat.com> <CAHC9VhS8+h5TW1fAsss0uq=XspPun+SWzxRquusP6gLe7FMG7Q@mail.gmail.com> <CAHC9VhQcuQ8+eoxXXqtEL4+PyxrWdpVvgMG9FDKnmr_XfaBsiA@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.2
From:   Petr Lautrbach <plautrba@redhat.com>
To:     Paul Moore <paul@paul-moore.com>
Cc:     Petr Lautrbach <plautrba@redhat.com>, selinux@vger.kernel.org
Subject: Re: [PATCH] Add CONTRIBUTING
In-reply-to: <CAHC9VhQcuQ8+eoxXXqtEL4+PyxrWdpVvgMG9FDKnmr_XfaBsiA@mail.gmail.com>
Date:   Fri, 31 May 2019 19:45:09 +0200
Message-ID: <pjdo93iv7q2.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Fri, 31 May 2019 17:45:12 +0000 (UTC)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


Paul Moore <paul@paul-moore.com> writes:

> On Wed, May 29, 2019 at 12:05 PM Paul Moore <paul@paul-moore.com> wrote:
>> On Wed, May 29, 2019 at 12:03 PM Petr Lautrbach <plautrba@redhat.com> wrote:
>> >
>> > Based on https://github.com/SELinuxProject/selinux/wiki/Contributing
>> >
>> > Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
>> > ---
>> >  CONTRIBUTING | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>> >  1 file changed, 60 insertions(+)
>> >  create mode 100644 CONTRIBUTING
>>
>> I would suggest updating the wiki to point to this file if/when it is
>> merged upstream.
>
> Sorry, one more thing: you might consider adding the ".md" suffix so
> that GitHub and others will treat it as Markdown.  I know that GitHub
> also treats the CONTRIBUTING.md file in a special way and presents it
> to users in various parts of the web UI, for example it show up in the
> sidebar when creating new issues.


Using Contributing.md in code would mean that it could be directly
copied to wiki.

When you say include DCO directly in Contributing, do you mean something
like
https://github.com/bachradsusi/SELinuxProject-selinux/wiki/Contributing
?

Petr
