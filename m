Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABE0887DFD
	for <lists+selinux@lfdr.de>; Fri,  9 Aug 2019 17:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407342AbfHIP1s (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 9 Aug 2019 11:27:48 -0400
Received: from mail-lf1-f45.google.com ([209.85.167.45]:36671 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfHIP1s (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 9 Aug 2019 11:27:48 -0400
Received: by mail-lf1-f45.google.com with SMTP id j17so15787874lfp.3
        for <selinux@vger.kernel.org>; Fri, 09 Aug 2019 08:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=63nF9E0JoauNflUf+1oyiGGf3j4Ef0o1wSxE7efMELg=;
        b=HnqjuGXa/dRh7xqjfbfXOqKIBLqaTPWjwE33x6r/sO8XVojjudbtoweMlgjJdxmS0N
         4ditulIIj+muxM3FJe8+UX1ignLGcGArxJIy+ejyrt2TC/FjW8fxo5dRQTo4E2Ak9nGE
         4qt+Xl7Kdyxkwqx1s7DKo/vprTBDwEB/5SXvSTBAiiCgwxb73d0AEAeFyScygmBorKBY
         ifgXW1ppJEb+6Lc6awVJFyUZJ9r8T1vDWeAPCkJGdnwN1r0zVPnl3ZHEJ3rgKxjLBZYx
         W12ucdtpmPuw7vImUeIhKREFRj77fgzVXqCAmGN42u/otjrMgubvsFWfrh7ia38bUZi5
         hssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=63nF9E0JoauNflUf+1oyiGGf3j4Ef0o1wSxE7efMELg=;
        b=BEXmjfNOSvMt7F2x5gy/1bD483xZf5MLx62li/tA2v1hahq5eXVoi4cgsKjcOSyLJQ
         qKzkZwHqsxZB61mTNMYXoBDWAfPbj031Lpc0OB4DOTR/ofBZVBiJVihB2cUcujSuXvLl
         2iCoFneFr6ocIFCzEf2isqxCLp4kfbAWCzxSF7w0GFK4WmfuUsGSoNErqOx1npUAuv3X
         CXDHUOoyxCoqaLe5qE5e/0XPaMPBZaPwWi37/bpCinTOt99d8UoN4+oIjlID9jaJyAzE
         oM8wwpaqguLGAYg43uuHdMmEfez7uH1OocIgEdA8sFqlPCL2u13CdhSe4+7wNqBVO0Sj
         z/rw==
X-Gm-Message-State: APjAAAUVYSNpc2g8D+am+Hwc5Sw6KXWDCwI3x9Jhu97istzoX6hfK77x
        mbIAIshset/hd6zzf5Vo24PHCPl48PGk3TVnxOT3qtM=
X-Google-Smtp-Source: APXvYqyvYp4RqC0agT+y6UYL3uyO1pHkelu7FHuF6GzTte6AzqBStWYisPzbtWnhjZqnr+YW2x4m6xV7SUX9GRkXkwk=
X-Received: by 2002:a19:8093:: with SMTP id b141mr13270051lfd.137.1565364466236;
 Fri, 09 Aug 2019 08:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190801111212.5536-1-richard_c_haines@btinternet.com>
In-Reply-To: <20190801111212.5536-1-richard_c_haines@btinternet.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 9 Aug 2019 11:27:35 -0400
Message-ID: <CAHC9VhQzWUDuGdsDQ9VDrSbm6VvGGYoOz-dq3BVz_dE860WK3Q@mail.gmail.com>
Subject: Re: [PATCH V2 0/2] selinux-testsuite: Add BPF tests
To:     Richard Haines <richard_c_haines@btinternet.com>
Cc:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Aug 1, 2019 at 7:22 AM Richard Haines
<richard_c_haines@btinternet.com> wrote:
> Patch 1 Runs basic checks for BPF with map_create, map_read, map_write,
> prog_load and prog_run permissions.
>
> Patch 2 Updates fdreceive to test BPF security_file_receive() path using
> the common BPF code in tests/bpf.
>
> If these are okay, I'll do the binder BPF tests for the
> security_binder_transfer_file() path.

Patch 1/2 seems to run fine on my test system, but I'm hitting some
errors with patch 2/2 ... although they appear to be gone now that I
run the test again to paste the error into my email :/

I'm about to leave for the weekend, and while I have access to email,
I don't plan to do much debugging while away ;)  I'll take a closer
look next week.

> Are there any other SELinux BPF areas that need testing ??

I would say as long as you exercise the SELinux BPF access controls we
should be good.  Thanks for helping with the tests!

-- 
paul moore
www.paul-moore.com
