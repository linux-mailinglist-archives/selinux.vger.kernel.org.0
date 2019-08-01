Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46A3E7E521
	for <lists+selinux@lfdr.de>; Fri,  2 Aug 2019 00:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389320AbfHAWCq (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 1 Aug 2019 18:02:46 -0400
Received: from mail-lf1-f47.google.com ([209.85.167.47]:40280 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389316AbfHAWCq (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 1 Aug 2019 18:02:46 -0400
Received: by mail-lf1-f47.google.com with SMTP id b17so51444974lff.7
        for <selinux@vger.kernel.org>; Thu, 01 Aug 2019 15:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PzgYLjc0DlH8R4/Bp3L3s/7baqBYRuLh++BLgTY5K6I=;
        b=bfXgAeFCx7SbQU55pHYa0+qyjg5O0iNcK+vjjFJNssv9L/GDxastw0rnwyTNrIP6xB
         PrYFfamTQdnKk+tbesPOX5J9We65zz9x7UPt1q23dq0U6xDJvvhd5wh5TCvMWHaIsiY3
         FAVfLqqa6Eamt4N703CkKzw0FS1/35yDiHVnXZcCkYmW1PigYxx4mDqXAQTsM80mH2Gx
         IOXcvKwb9ghfYF94gJ/ObqUW7DIN5tnvsvEZE3N2i001x0MxZZfYS+bYgqIw/Oqi4o1K
         bw78S4e3Ulls8gvfwYXDTHGg+6taHSrzWgjAx37QLgYvawipGGz0x/38bYNAVdu7LQs7
         zrtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PzgYLjc0DlH8R4/Bp3L3s/7baqBYRuLh++BLgTY5K6I=;
        b=HsKcxLpZnvp2H3PvEzRWX7+F8b2WiyFpw3zTwQ8ns3Ha9rA8zQIjzG0FLyL7SJAzhx
         41o5dTZWRqhEVQ4u1sXpYQuKyMnJs8D0TaNnKnBeNNY+bjfAHm/7Y5SJ61WXsumvw9jn
         QB6vNnORnRqg6xVmjJl5ZpAnFtm44x5CPlZuYT107TOOZb7QoCyH0OqcZKz8kjAuaohZ
         l8dGD+aGKtA3u096ljw9DFZJbjcdAE/JyjvV6fZjzkYWW/gLS8oJTUoFvlHA2xJMcyBe
         pyZACr9ntJqOlDyEytboWmX/N3GVtFEP2EYGYhpdF3yc4HHYSOtFIDD6WJfWeLv1cZLX
         FSlw==
X-Gm-Message-State: APjAAAUrC/BkquvKRq3VTh4Dxx/6YGdcT9//TSa47zT62xs5ld3sZBnL
        wHuSQv4kv4qMwHRsh8FkviwwHDeCRHCovLES2w==
X-Google-Smtp-Source: APXvYqzmq0uXfwJt7g/bBIxK05IIy7u3ZYdIDXtXkS+45JB5jOtl3Mi1LGyMsk7G9yx299JjIG2MwsqssmU7yB7cG7I=
X-Received: by 2002:a19:4349:: with SMTP id m9mr61702928lfj.64.1564696964070;
 Thu, 01 Aug 2019 15:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <2d7f0c7e-a82a-5adb-df94-3ac4fa6b0dfe@schaufler-ca.com>
In-Reply-To: <2d7f0c7e-a82a-5adb-df94-3ac4fa6b0dfe@schaufler-ca.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 1 Aug 2019 18:02:32 -0400
Message-ID: <CAHC9VhQRUGbU70p8p+zoxqgAF-W92Zz=rOjFB68JsaitrfQt_g@mail.gmail.com>
Subject: Re: Security labeling in NFS4 - who owns it?
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     linux-nfs@vger.kernel.org,
        Linux Security Module list 
        <linux-security-module@vger.kernel.org>,
        SELinux <selinux@vger.kernel.org>,
        Trond Myklebust <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Aug 1, 2019 at 3:39 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> As part of my work on LSM stacking I've encountered some issues with
> the Linux implementation of NFS4 security labels. For example, the LFS
> data is ignored, so even if the client and server are willing to identify
> the kind of information they are passing, the identity information isn't
> available. The code asks if attributes requested are mandatory access
> control attributes, but cannot differentiate between which of the possible
> security attribute the other end is providing.
>
> Is anyone actively owing the NFS labeling code? I'd like to bounce an
> idea or two around before committing too much time to my ideas of
> solutions.

I guess it all depends on what you mean by "own".  Historically it has
been a mix of the NFS and SELinux folks that have worked on it and
contributed patches, with code sprinkled between the two subsystems
(and possibly elsewhere too).

I suspect a better question would be: who should you work with to
discuss issues the labeled NFS code?  I don't want to assume too much,
but I think you know the answer to that one already ;)

-- 
paul moore
www.paul-moore.com
