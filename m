Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A58C53110E
	for <lists+selinux@lfdr.de>; Fri, 31 May 2019 17:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbfEaPQR (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 31 May 2019 11:16:17 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40553 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbfEaPQR (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 31 May 2019 11:16:17 -0400
Received: by mail-lj1-f195.google.com with SMTP id q62so9974969ljq.7
        for <selinux@vger.kernel.org>; Fri, 31 May 2019 08:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bgozB8phIRgNTdO4dj1xJ/jQsH51NT7/N9f0Igt721s=;
        b=ryVvHkZwTIxrIJssk3ZiIOx1zO9BpuJft34UZddYbZiIPZNQBsmyZQeCXhtLgQEyOt
         T9JvirVRgWUKLVggXB6alQ0PQsKil6Fe9j4OMDd+7rZUgA4Cp3I/qtXq34jdIORmP7+Q
         5HVy1k4Vt/mHHqCxbtk+5nht2yekJcRR5L0m454bR2NbIPoUOad3Q7OFEvKZT3Q4apX/
         ZzIOYhfOvMnEeetc62q7TpMTY4xMgaVYwNc+wKVT1H45JtHK7RmNf2f2B0SH/Zhu23zZ
         fhtzfdYF+55/LLGFdZV+tM6BJE9xDrhOQAeFck+oFeJBw5DNq6Ds+rvuiUeeSbtjTKKf
         y65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bgozB8phIRgNTdO4dj1xJ/jQsH51NT7/N9f0Igt721s=;
        b=eUmY2uKuSfTeMPYvxiZZQV2WOwhesfE8rBfmQfF2mvUbXss5p4JZCAaMLbBjq19J18
         YmytT3Lb2OmRDPhEQc2ipl0ak8GfX/opO9IonN2ptRCqDfUbK8bNVHDo5jz4sp4zWkyh
         VDivm3t6pky+Df1+yFbE9nFNtTrEe5H0goalr4Eb7XHrOknB6hHIjDYYaqEnXVLEcM8p
         /iF5xUIZC0jq0kgjwT9wr5o45HFHsJbjMG0YupwKUykhMeTyOKbrJ9h4zgpmSil0+dP3
         6e2iUmRmJ1kis1IlSmcsa6tNhMfJAlOOKWRf4Gmn8WMzfY2AAJ0Dy5+Z5Q/sYqQQhJDI
         LLxA==
X-Gm-Message-State: APjAAAWShKIoo1YOj+bXia94/SAYmuqr1LxadV6olGUWdZVTwIJPyFfj
        9Zr+FpHc+rDq7M0M2axa7P33IDcDwzjAZHjqvDCX
X-Google-Smtp-Source: APXvYqw5bHrrkE5u8/ev0wYBFp7z6D44bZLTw3XGX1kEkh3sIj8h+UyG20qamwyku0jiu9bS/CvKm9sAyMgfpQQKP3E=
X-Received: by 2002:a2e:9b46:: with SMTP id o6mr6030061ljj.76.1559315774774;
 Fri, 31 May 2019 08:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190529160337.4672-1-plautrba@redhat.com> <CAHC9VhS8+h5TW1fAsss0uq=XspPun+SWzxRquusP6gLe7FMG7Q@mail.gmail.com>
In-Reply-To: <CAHC9VhS8+h5TW1fAsss0uq=XspPun+SWzxRquusP6gLe7FMG7Q@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 31 May 2019 11:16:03 -0400
Message-ID: <CAHC9VhQcuQ8+eoxXXqtEL4+PyxrWdpVvgMG9FDKnmr_XfaBsiA@mail.gmail.com>
Subject: Re: [PATCH] Add CONTRIBUTING
To:     Petr Lautrbach <plautrba@redhat.com>
Cc:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, May 29, 2019 at 12:05 PM Paul Moore <paul@paul-moore.com> wrote:
> On Wed, May 29, 2019 at 12:03 PM Petr Lautrbach <plautrba@redhat.com> wrote:
> >
> > Based on https://github.com/SELinuxProject/selinux/wiki/Contributing
> >
> > Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
> > ---
> >  CONTRIBUTING | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> >  create mode 100644 CONTRIBUTING
>
> I would suggest updating the wiki to point to this file if/when it is
> merged upstream.

Sorry, one more thing: you might consider adding the ".md" suffix so
that GitHub and others will treat it as Markdown.  I know that GitHub
also treats the CONTRIBUTING.md file in a special way and presents it
to users in various parts of the web UI, for example it show up in the
sidebar when creating new issues.

-- 
paul moore
www.paul-moore.com
