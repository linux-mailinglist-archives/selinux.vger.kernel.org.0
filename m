Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A96BA2A155A
	for <lists+selinux@lfdr.de>; Sat, 31 Oct 2020 11:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgJaK6F (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 31 Oct 2020 06:58:05 -0400
Received: from mailomta32-re.btinternet.com ([213.120.69.125]:46381 "EHLO
        re-prd-fep-048.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726697AbgJaK6E (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 31 Oct 2020 06:58:04 -0400
Received: from re-prd-rgout-003.btmx-prd.synchronoss.net ([10.2.54.6])
          by re-prd-fep-048.btinternet.com with ESMTP
          id <20201031105801.QIXR19284.re-prd-fep-048.btinternet.com@re-prd-rgout-003.btmx-prd.synchronoss.net>;
          Sat, 31 Oct 2020 10:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1604141881; 
        bh=Fv5cuiRzr4ToNpePIV+iE4JIM4bAo50cUVHFoWd9J8w=;
        h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:MIME-Version;
        b=VvyjE3fKXU2HuL0SWuju/PeI53lZaZsDaOqunvBz1y/k78oJreQjssZ/d1JNJv6zYxqkXa2U9AuCgoeTS7PCkDYUPCfGA6axhZ2C4Komhj1mE5eLP9Q2RVNrdg9CGCzABgnxnZJ2b8mPHZmtPDZmzOtXd4cpNwfB14Y61FJeoqI6/JCz7VcTtawl3LfL9Z5xptHvS45dODZWQxp3JuuzGonYnb3TeCei1GXbbHhJTsf8UR83U7QcxjXu0kuaD6nR+Dj5oCe+Fzf0q2trOnB7CdqKkTqItzlBllwRyniguVLk0O1K6Ftupjw5qfZHX/1Aien3kik7FTGf3EhohfK1iw==
Authentication-Results: btinternet.com;
    auth=pass (LOGIN) smtp.auth=richard_c_haines@btinternet.com
X-SNCR-Rigid: 5ED9C2FD18342CB4
X-Originating-IP: [86.157.76.249]
X-OWM-Source-IP: 86.157.76.249 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedujedrleejgddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomheptfhitghhrghrugcujfgrihhnvghsuceorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqnecuggftrfgrthhtvghrnhepjeejkeetgefgteejteekledtveeftefhhfdukeehgfeggfeivdeuieetkeehgfehnecuffhomhgrihhnpehtrhgrvhhishdqtghirdgtohhmnecukfhppeekiedrudehjedrjeeirddvgeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeekiedrudehjedrjeeirddvgeelpdhmrghilhhfrhhomhepoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqecuuefqffgjpeekuefkvffokffogfdprhgtphhtthhopeeoohhmohhsnhgrtggvsehrvgguhhgrthdrtghomheqpdhrtghpthhtohepoehsvghlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgqe
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-SNCR-hdrdom: btinternet.com
Received: from localhost.localdomain (86.157.76.249) by re-prd-rgout-003.btmx-prd.synchronoss.net (5.8.340) (authenticated as richard_c_haines@btinternet.com)
        id 5ED9C2FD18342CB4; Sat, 31 Oct 2020 10:58:01 +0000
Message-ID: <e895f6ebe00f6fd8ca451521a2326d0717d75760.camel@btinternet.com>
Subject: Re: [PATCH 0/1] selinux-testsuite: Add btrfs support for filesystem
 tests
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Date:   Sat, 31 Oct 2020 10:57:54 +0000
In-Reply-To: <CAFqZXNvUiezPUTYgV+vWiS2LO5Nt0_Sb-p8GeELhLjVcPVTmRg@mail.gmail.com>
References: <20201013145456.77253-1-richard_c_haines@btinternet.com>
         <CAFqZXNu1o3rTRcrNBRwESt+txA+chc3PcdFjrZFiP50koceyAQ@mail.gmail.com>
         <CAFqZXNtubRw-pqEiuxwzp=6n53Gnso3oOoExbhc+OhWcQ5ESAA@mail.gmail.com>
         <CAFqZXNvUiezPUTYgV+vWiS2LO5Nt0_Sb-p8GeELhLjVcPVTmRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Sat, 2020-10-31 at 01:04 +0100, Ondrej Mosnacek wrote:
> On Sat, Oct 31, 2020 at 12:44 AM Ondrej Mosnacek <omosnace@redhat.com
> > wrote:
> > On Fri, Oct 30, 2020 at 10:55 PM Ondrej Mosnacek <
> > omosnace@redhat.com> wrote:
> > > And on related note, the existing vfat tests are also failing:
> > > Test Summary Report
> > > -------------------
> > > filesystem/vfat/test      (Wstat: 7936 Tests: 43 Failed: 31)
> > >   Failed tests:  3-4, 6-7, 10-12, 14-19, 21-22, 24-36, 38-40
> > >   Non-zero exit status: 31
> > > fs_filesystem/vfat/test   (Wstat: 8192 Tests: 42 Failed: 32)
> > >   Failed tests:  3, 5-7, 10-20, 22-35, 37-39
> > >   Non-zero exit status: 32
> > 
> > And this might be the same problem, but with dosfstools... I'll
> > need to check.
> 
> Yeah, that was it. With dosfstools installed the tests pass.
> 
> There are some fsetfilecon(3) errors visible in the test output,
> though:
> https://travis-ci.com/github/WOnder93/selinux-testsuite/jobs/422914927#L2697
> 

These tests pass as for vfat Operation not supported is correct. The
tests just need " 2>&1" added to stop output. I'll submit a patch, also
to add dosfstools (also to travis run-testsuite.sh).

I guess I also really need to add to defconfig:

CONFIG_VFAT_FS=m


