Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73A7DB656C
	for <lists+selinux@lfdr.de>; Wed, 18 Sep 2019 16:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731139AbfIRODg (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 18 Sep 2019 10:03:36 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:44138 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730943AbfIRODg (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 18 Sep 2019 10:03:36 -0400
Received: by mail-wr1-f50.google.com with SMTP id i18so7018354wru.11
        for <selinux@vger.kernel.org>; Wed, 18 Sep 2019 07:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M4G957JGpKOHEDBID9IeIQbzep/r56sPFj9ocCybTa4=;
        b=EYnYtloup0Iaj3DchK4e8FmY5NjspgPr+5kpbkFZAQMHPeocg77Rj1+Ug5Gu90EZuW
         g16NgqSQ0wZFVA/iQP+L735xtZ9kMTi/D6MxkXKaKE4IvSEMD6/9Vxb9hG10Ed2KBUUX
         bjnrMsLSOdK54SiyK3zgfzYxn4rNl11zvyn6mpSeJCGocd7e0o1ITbUP3IcSNlH50gFv
         VwsDpgXDTK/JmriGCowtNZlMVr3anjh+J7sQ2vpeuhxG4OXwPpyk1syOH4M83paT1Put
         PAdUd0dLyz20vhyxunGXa0SFlfit9ugHuDYu+WNhudqvEx762jq+mKxLYBtPoYQDY6ul
         RyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M4G957JGpKOHEDBID9IeIQbzep/r56sPFj9ocCybTa4=;
        b=lH0/bzvp2WGxS5SCUIOZBeN9rtKfhyxX/HTqlFO6Y9UpET6LmvBoxUpyE7oi7XAZ7F
         EuM2pY66AHnINpOOX5X06K6czvQ7fv6+D+keq5QrB5WiuUayB9afVWdNjgyx6G8tP7T4
         AZ9P+urXQlkPGUsYQYoW9u08pSOnhIiuR6hvNvH2gRAx0daC1S8g3PhX30lvlr9kNgVg
         xjrzasuhgwR2ucQC7V5dwPyRdTP8m+7xuUakLvS7sefgQz9S4eEo6asTmxa63wRRTw+r
         ymym89wEcjpqCS4tTcMmLwpS4RzDjNi4cEYAuNtXDu5ci9r9WbTsBUjgSw/FqMAilVc8
         ZmZQ==
X-Gm-Message-State: APjAAAWQmu1O3hojljm760MIJ+goOzXoYLars37puUyptjLHcT6kl0A8
        ggGIZGLBh6TisV+HzJP6apfxleklTV8fzBp+zg0Ypg==
X-Google-Smtp-Source: APXvYqxm0mXjR9+B/3UT+mo980LhjtrGmLynZfPiGy7JyhKkV/AKPIeO9DYOCUyzcZj20fyXywgM67snIB7Aj66UhzY=
X-Received: by 2002:a5d:4c92:: with SMTP id z18mr3043665wrs.111.1568815414191;
 Wed, 18 Sep 2019 07:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAFPpqQFwGgEKU9KY2kif4C95fZPvLH0TGdTxLKUAXuRgK2zxBw@mail.gmail.com>
 <ac6433e2-88a4-747c-66f5-d241499f40d6@tycho.nsa.gov>
In-Reply-To: <ac6433e2-88a4-747c-66f5-d241499f40d6@tycho.nsa.gov>
From:   Ted Toth <txtoth@gmail.com>
Date:   Wed, 18 Sep 2019 09:03:23 -0500
Message-ID: <CAFPpqQGfAifnShcWTMs1pJe1m7W_4wM8AUqFsvj4Zts5-9QiCQ@mail.gmail.com>
Subject: Re: strange tclass in AVCs
To:     Stephen Smalley <sds@tycho.nsa.gov>
Cc:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Sep 18, 2019 at 8:53 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
>
> On 9/18/19 9:35 AM, Ted Toth wrote:
> > I'm seeing things like tclass=context#012 in some AVCs what is this telling me?
>
> Just a guess here, but octal 012 is '\n' aka a newline character, and
> libselinux/src/avc.c:avc_audit() appends a "\n" at the end of the buffer
> before calling avc_log() to log the entire string.  avc_log() will call
> the logging callback, and dbusd does define one, which calls
> audit_log_user_avc_message().  Maybe audit_log_user_avc_message() is
> escaping the newline character in its output as well as appending
> additional data.
>
> I'm a little unclear though on why dbusd is checking a context contains
> permission?

These appear to only occur when systemd is starting the dbus daemon
and they end up in /var/log/messages not /var/log/audit/audit.log as
I'd expect.
