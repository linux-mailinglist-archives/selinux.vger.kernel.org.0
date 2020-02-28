Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE1E0173BB2
	for <lists+selinux@lfdr.de>; Fri, 28 Feb 2020 16:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbgB1PkC (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 28 Feb 2020 10:40:02 -0500
Received: from mail-ed1-f49.google.com ([209.85.208.49]:36375 "EHLO
        mail-ed1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgB1PkA (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 28 Feb 2020 10:40:00 -0500
Received: by mail-ed1-f49.google.com with SMTP id j17so3848596edp.3
        for <selinux@vger.kernel.org>; Fri, 28 Feb 2020 07:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FxXDJZ7f6H00ez0+mALJX7AbbRdlX/cGNEAILCClU4Q=;
        b=layGR74oZe0zK+z+s/MzdlOErm6fqV8udwcAVkyvlVtJGbU3LQZdbrW7YDDQR3xxX1
         +ArizJjpudd3M0ZYiUbV/lqOWL1wkYnL9d+0zqmlYnRe0kgJ4rraXd0aLjdYQsS8lwvd
         7fpR8mQhuxucuQU93Ddv77XsE50ikrb7M3gn+440lAvDtH/GOvJbL39j3MQdb3kFOFRW
         8EyLoE03svJRwB0yjBBGLw04S7LA+xxKumGZLiYNXTy0XlpkgIn/G1f0TpjaZGdr+5mj
         RZRUePsg7w5VdRvVNikPn6MDhdkowEPfMciZviTHbK4oiOr4dTKidvY65ec0yLuMXCep
         ICJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FxXDJZ7f6H00ez0+mALJX7AbbRdlX/cGNEAILCClU4Q=;
        b=QCzZbiTGAPnKfuMayyGqy8Ne1sN84ypPW9kg4uTfsxBH+M86nZuauo4Uhn199KefGv
         fqHBKeR+lhJqO0Djpfw9i3IJc4ObrLFLGO453ScmIOBg0ouUMw+GTf32E6VZg8ywxKW2
         /VpsXKWJ0y3D5Rr2OQDZfzYnrS36ExPPDqq5kwui7p3MIblPjw+kOUK5m4WMinJL7GZk
         DC/HyGpaLuYa6G9oty1Rn9hJHtgzqTvNXjSpA+C5WO+cchWgRZbWbLxscwRdfdY0VcWg
         ZOVVGNjjW3BgJPZa5GYx4Jl4cXEcpFkS46XDJ8ZwO5RLYCWND0N2Q1JAoASJQebcW+Oy
         KFsQ==
X-Gm-Message-State: APjAAAUsBhP7yc8JHRj0imoOsa1imLQAUzTboJ9J11FxEn0uYnyZJx+0
        IRoaA6NINYkdolMEgZ4v9bZ2+AkngnFzvYo1UH1W3iI=
X-Google-Smtp-Source: APXvYqzPXJdkmRSSXKy8sLFVHAoz7nCVQDueiBs/U4am/5vjpTX96878W7/2eekHamHsI+GLYOxe/wa3wvRwJueXQDs=
X-Received: by 2002:a17:906:f251:: with SMTP id gy17mr4577220ejb.308.1582904398494;
 Fri, 28 Feb 2020 07:39:58 -0800 (PST)
MIME-Version: 1.0
References: <CAHC9VhQ=W4R2LGCxaKzVEx4J31m4-F7mDo2BOMTqso2JdScHzw@mail.gmail.com>
 <101039.1582904234@warthog.procyon.org.uk>
In-Reply-To: <101039.1582904234@warthog.procyon.org.uk>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 28 Feb 2020 10:39:47 -0500
Message-ID: <CAHC9VhQ_ajha6my_9aksXWhiT+nMs7P-P5sxmV_eXTm37b8fgA@mail.gmail.com>
Subject: Re: Please revert SELinux/keys patches from the keys linux-next branch
To:     David Howells <dhowells@redhat.com>
Cc:     selinux@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Feb 28, 2020 at 10:37 AM David Howells <dhowells@redhat.com> wrote:
> Paul Moore <paul@paul-moore.com> wrote:
>
> > For some reason we haven't been able to get your attention on the
> > related SELinux mailing list threads, but we need you to revert commit
> > f981a85690dc ("security/selinux: Add support for new key permissions")
> > from your linux-next branch.  Can you please do that?
>
> Sorry, I had to squeeze out a new version of notifications and fsinfo before
> disappearing off to Vault - and then I disappeared off to Vault.  However, I
> can do that now.
>
> I can drop keyring ACL patches for the moment and pick them back up after the
> next merge window.

Great, thanks.  For future reference, I would *really* prefer if
patches like this one went up to Linus via the SELinux tree as it
changes the SELinux kernel ABI (the keys and selinux next trees
currently conflict because of this).

-- 
paul moore
www.paul-moore.com
