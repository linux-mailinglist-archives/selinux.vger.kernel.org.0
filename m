Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2A6369EE8
	for <lists+selinux@lfdr.de>; Tue, 16 Jul 2019 00:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732492AbfGOWYA (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 15 Jul 2019 18:24:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:39010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730796AbfGOWX7 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 15 Jul 2019 18:23:59 -0400
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C466A217F9
        for <selinux@vger.kernel.org>; Mon, 15 Jul 2019 22:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563229439;
        bh=sXN8yTSkzlc2tuMkiJcjFdTjSzcCd65oQqUJ3FJmeJY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yBI9BarzH4OGHaCqhPNy8Mm/8mXweCVJrJ5oaEsKwuRQq1xvoxSZgM38/BlHNFNZZ
         R5dyFaarO9UA8SqBIUP0aXreaypfcw8cCJE60VmB7hqN6bs6frYoV+6tPpdcaV9Q+D
         VRmZUC1LI51akyWto8WgUcaRnSHsBZW9QSEdJYkY=
Received: by mail-wr1-f54.google.com with SMTP id n9so18801856wru.0
        for <selinux@vger.kernel.org>; Mon, 15 Jul 2019 15:23:58 -0700 (PDT)
X-Gm-Message-State: APjAAAUKKcdarSyNS+YKWE0WOdnnrSF/6ROQUl/cdG5YxAeOcUZ7pWM5
        7tIqQ0P3q0JEigQUaDGZUNMAkX5EJ1NMIptoW/3xAg==
X-Google-Smtp-Source: APXvYqyj/9VuP/+ihUF83njy2/IebE75lbwjE05Fh3u3X6o4w/jRKgrJb1caiXxXudMLSyjB+41C03VLnS0S0oyPpNY=
X-Received: by 2002:adf:cc85:: with SMTP id p5mr29293788wrj.47.1563229437236;
 Mon, 15 Jul 2019 15:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <960B34DE67B9E140824F1DCDEC400C0F6551D585@ORSMSX116.amr.corp.intel.com>
 <f59529e4-6cc8-2405-d7db-2519727f9a80@schaufler-ca.com> <960B34DE67B9E140824F1DCDEC400C0F6551D7F7@ORSMSX116.amr.corp.intel.com>
 <63c92ab6-dc8d-826b-b8bf-05ad262f06e4@schaufler-ca.com> <960B34DE67B9E140824F1DCDEC400C0F6551DBF7@ORSMSX116.amr.corp.intel.com>
 <9e45df1b-3aac-e851-4ef2-5b262f5139bd@schaufler-ca.com> <20190703094651.GA29601@wind.enjellic.com>
 <012fc47d-4e9d-3398-0d9d-d9298a758c8d@schaufler-ca.com> <20190707133023.GA4521@wind.enjellic.com>
 <256013f7-292d-7014-9abb-61755f07eb25@schaufler-ca.com> <20190711102247.GA5357@wind.enjellic.com>
In-Reply-To: <20190711102247.GA5357@wind.enjellic.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Mon, 15 Jul 2019 15:23:45 -0700
X-Gmail-Original-Message-ID: <CALCETrWmvtSaqtdZWeBdTMYP-38xeyWhf5TP9vV+OY30nHgJbQ@mail.gmail.com>
Message-ID: <CALCETrWmvtSaqtdZWeBdTMYP-38xeyWhf5TP9vV+OY30nHgJbQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] x86/sgx: Add SGX specific LSM hooks
To:     "Dr. Greg" <greg@idfusion.net>
Cc:     Casey Schaufler <casey@schaufler-ca.com>,
        "Xing, Cedric" <cedric.xing@intel.com>,
        Stephen Smalley <stephen.smalley@gmail.com>,
        "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        "jmorris@namei.org" <jmorris@namei.org>,
        "luto@kernel.org" <luto@kernel.org>,
        "jethro@fortanix.com" <jethro@fortanix.com>,
        "sds@tycho.nsa.gov" <sds@tycho.nsa.gov>,
        "jarkko.sakkinen@linux.intel.com" <jarkko.sakkinen@linux.intel.com>,
        "Christopherson, Sean J" <sean.j.christopherson@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Jul 11, 2019 at 3:23 AM Dr. Greg <greg@idfusion.net> wrote:
>
> On Mon, Jul 08, 2019 at 05:02:00PM -0700, Casey Schaufler wrote:
>
> > > On 7/7/2019 6:30 AM, Dr. Greg wrote:
> > > All well taken points from an implementation perspective, but they
> > > elide the point I was trying to make.  Which is the fact that without
> > > any semblance of a discussion regarding the requirements needed to
> > > implement a security architecture around the concept of a TEE, this
> > > entire process, despite Cedric's well intentioned efforts, amounts to
> > > pounding a square solution into the round hole of a security problem.
>
> > Lead with code. I love a good requirements document, but one of the
> > few places where I agree with the agile folks is that working code
> > speaks loudly.
> >
> > > Which, as I noted in my e-mail, is tantamount to security theater.
> >
> > Not buying that. Not rejecting it, either. Without code
> > to judge it's kind of hard to say.
>
> We tried the code approach.
>

You sent code.  That code did not, in any respect, address the issue
of how LSMs were supposed to control what code got executed.

Do you have an actual suggestion here that we should pay attention to?
