Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDCF21E053
	for <lists+selinux@lfdr.de>; Mon, 13 Jul 2020 21:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgGMTB3 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 13 Jul 2020 15:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgGMTB3 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 13 Jul 2020 15:01:29 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBBEC061755
        for <selinux@vger.kernel.org>; Mon, 13 Jul 2020 12:01:29 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id e64so14659932iof.12
        for <selinux@vger.kernel.org>; Mon, 13 Jul 2020 12:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uYjzOy0qohLvsvQNlKQ9F0Tw5otJXR/YOjY9zdSrhdQ=;
        b=LH/8OlZsWcnBpz0n7v6mBU/xWrPV3ybZkp1lOCcTFNc7spmY8F2bStZHeRpLp2VvkT
         w244qu6K/pRApmX+Q052Z8wTPXwkKtwFwrGqjWj+eTyOcw1xBH4uoQeaOPxOyd5DepXR
         Mk5LTTC63LyuxVUjZtKWNTEfG5aXtuObnR95Gjqo82P8uOg7hcJ9ECSK16JnWAUg3nCi
         KasG8/qUEAgvCkVRoAbflXfh68qXB8PwcTxiS6yXb3iAxIkB6uOLT73BHMwhE5zPpEXl
         chaAjDAJ8SZbG93VKY3WXJNMAYaMEQhdpA5PuBHg16mHNUIEcEgt67+IWghHHoekdZx+
         aihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uYjzOy0qohLvsvQNlKQ9F0Tw5otJXR/YOjY9zdSrhdQ=;
        b=MIKxOHF5sJO2z09qAql/YTI5JMt74duIslPVWHM596IX9vgxhVlraPC287C9o0VXsQ
         XzDxdaeDsppkoLzOBXj2MzyVYYi2tHtxdBd7Xg+ZsTeYhQOMDqq+Y0OnpOCu0kMkdzxt
         etWKTfMcy/ZWGDt2xLeYqJEytus7p2jk8GhAn43APzo1mcauoudH1t3+FT9XujTxvncB
         1JgOJD9Pwgn1flCR/hpyaWUqNcw7gxZxP8C8HRC+gYwuvTipG64EtfmVCZaB6/D1+tNA
         rr1JsYYK8CY1YHdj9MXE1zLaTYiDzCDoSdYDYlC9LcdT4DYmt5X0nn/6CFhbaCvyBUKB
         QD3A==
X-Gm-Message-State: AOAM532Z0z7yZjwejvEdUAoqQGNsMw+VF4M/26gI7L3wgZCw+cXCgzAT
        xoQDtcTl+7Gd/NmWoQ5gIwHjSuNF7iQhm288q/A=
X-Google-Smtp-Source: ABdhPJxhN1JVgSTdiPF6CePJSSlyMCnCKZLskcOvJ87Jl35SEky2KA2GKaHQGdjNGBoOTdqbBfKSwkz9mHmTvHN5VQs=
X-Received: by 2002:a5d:8f98:: with SMTP id l24mr1181859iol.141.1594666888281;
 Mon, 13 Jul 2020 12:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAFftDdpDN+8c2hQ+OoX8z+Fx3s-7-g2sn7ZV+Y=D=NZqqFwr6Q@mail.gmail.com>
 <CAHC9VhQkTgYFQ5ncLDJpOcqynWam3QY7udLQoUYSb3HgkvdboQ@mail.gmail.com>
 <CAJfZ7=kyieBs6_NPE3k2tyNSydrwmVT7k3kcmd=0Xsi7JoD2Zg@mail.gmail.com>
 <CAFftDdp=4nB1CfmAQXBbN_BODHMaXaVbLGsh7+mHLt6GpTGMZg@mail.gmail.com>
 <CAJfZ7=mUXwwhFXAnztCp-dO=rLfqUZGH4omGKpnqZGnrCdEtRw@mail.gmail.com> <CAFftDdqhO5_ZEGOAHGVZHdB9j4B86od12R1dicbTBmfwHEQS1Q@mail.gmail.com>
In-Reply-To: <CAFftDdqhO5_ZEGOAHGVZHdB9j4B86od12R1dicbTBmfwHEQS1Q@mail.gmail.com>
From:   William Roberts <bill.c.roberts@gmail.com>
Date:   Mon, 13 Jul 2020 14:01:16 -0500
Message-ID: <CAFftDdpTDXY_2dzdiEtRJzeSx-PbzBzGVhrg3+XwatTTvDtkgg@mail.gmail.com>
Subject: Re: travis: any reason we have keep going on make commands
To:     Nicolas Iooss <nicolas.iooss@m4x.org>
Cc:     Paul Moore <paul@paul-moore.com>,
        SElinux list <selinux@vger.kernel.org>,
        Stephen Smalley <stephen.smalley.work@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Sat, Jul 11, 2020 at 2:28 PM William Roberts
<bill.c.roberts@gmail.com> wrote:
>
> On Sat, Jul 11, 2020 at 11:57 AM Nicolas Iooss <nicolas.iooss@m4x.org> wrote:
> >
> > On Fri, Jul 10, 2020 at 5:23 PM William Roberts
> > <bill.c.roberts@gmail.com> wrote:
> > >
> > > On Fri, Jul 10, 2020 at 4:10 AM Nicolas Iooss <nicolas.iooss@m4x.org> wrote:
> > > >
> > > > On Thu, Jul 9, 2020 at 8:00 PM Paul Moore <paul@paul-moore.com> wrote:
> > > > >
> > > > > On Thu, Jul 9, 2020 at 10:33 AM William Roberts
> > > > > <bill.c.roberts@gmail.com> wrote:
> > > > > > So Nicolas initially created our travis script in commit c9adfe2d2653
> > > > > > and has -k, or keep going, on the make commands. This causes make to
> > > > > > plow ahead and bury the errors in the logs. Stephen noticed this the
> > > > > > other day, and we have been chatting about it out of band and wanted
> > > > > > to pull in the community.
> > > > > >
> > > > > > Are their compelling reasons for keeping this behavior? I am also
> > > > > > concerned that we could get false positives on travis success results.
> > > > >
> > > > > In my opinion the whole point of automated testing is to catch
> > > > > failures early and often.  For that reason I would want the test to
> > > > > fail and stop, both because I find it easier to identify the failure
> > > > > that way and also because I'm not sure I would trust much of the
> > > > > testing that occurred after an error condition.
> > > > >
> > > > Hi,
> > > > There seems to be some confusion:
> > > >
> > > > * "make -k" does not stop the "make" command at the first error and
> > > > allows seeing all the errors when there are several ones. In my humble
> > > > opinion, it makes sense when compiling ("make all") and not when
> > > > running tests ("make test"), and this is actually what is right now in
> > > > Travis-CI. "make -k" returns a failure exit code when an error
> > > > happens.
> > >
> > > Ahh I thought it returned to 0. Not sure why I assumed that.
> > >
> > > >
> > > > * Travis-CI does not stop the job as soon as a sub-command fails. If I
> > >
> > > Depends on the stage:
> > > https://docs.travis-ci.com/user/job-lifecycle/
> > > If before_install, install or before_script returns a non-zero exit
> > > code, the build is errored and stops immediately.
> > > If script returns a non-zero exit code, the build is failed, but
> > > continues to run before being marked as failed.
> > >
> > > I put a false command in the script section and it kept plowing ahead
> > > as you foretold.
> > >
> > > > understand correctly, this is what really bothers William, and I agree
> > > > this is a behavior that can be improved. According to
> > > > https://github.com/travis-ci/travis-ci/issues/1066, a possible
> > > > solution could be to use "set -e", which could have unexpected
> > > > side-effects in launched commands. It is possible to "emulate set -e"
> > > > by adding exit statements, such as :
> > > >
> > > >     - make install $EXPLICIT_MAKE_VARS -k || exit $?
> > > >     - make install-pywrap $EXPLICIT_MAKE_VARS -k || exit $?
> > > >     - make install-rubywrap $EXPLICIT_MAKE_VARS -k || exit $?
> > > >     # ...
> > > >     - make test $EXPLICIT_MAKE_VARS || exit $?
> > > >
> > > > I have not tested whether this works on Travis-CI, but if it does, it
> > > > would be a nice improvement. I will take a look this week-end.
> > >
> > > I think the scripts are more maintainable outside of travis yaml files
> > > as separate build scripts,
> > > for two reasons:
> > > 1.  One can just execute the script locally, you can't, AFAIK, do that
> > > with a travis yaml file.
> > > 2.  The issue can be avoided as they afford more control. Some other
> > > projects I am a part of we only
> > >      use script and after_failure. The bash scripts are set -e. I also
> > > used this approach for the KVM
> > >      selinux test run.
> > >
> > > script:
> > >   - ./.ci/travis.run
> > > after_failure:
> > >   - cat build/test-suite.log
> > >
> > > We could adopt like what's above...
> >
> > I did not understand the part about using "cat build/test-suite.log",
> > but otherwise the idea of putting the commands into a dedicated script
>
> Oh ignore that, that's a particular artifact of using automake's test
> log compiler
> for my particular project. You won't see that in stdout so on failure to see
> the details of each test run I have to do that.
>
> > file sounds good, as this allows more flexibility. In order to know
> > which command failed (and fail as soon as a command fails), I suggest
> > using "set -e -x" in these scripts.
>
> Yep, exactly.
>
> >
> > By the way, about the issue with "make", there is another thing from
> > your initial message that I understood only after sending my first
> > reply: a consequence of using "make -k" that can be considered
> > undesirable is the fact that when an error happens, its message can be
> > drowned among the flow of other messages. I disagree with removing
> > "-k" because this would only show one error, instead of all the errors
> > that occur during a build. Nevertheless it is possible to achieve the
> > best of both alternatives by using constructions such as:
> >
> > if ! make install $EXPLICIT_MAKE_VARS -k ; then
> >   echo >&2 "Error in make install $EXPLICIT_MAKE_VARS:"
> >   make install $EXPLICIT_MAKE_VARS   # This command shows one error,
> > at the end of the build logs.
> >   exit 1
> > fi
> >
> > Would such constructions be helpful?
>
> I was thinking initially that -k caused make to return 0 not 1, and
> that -k was the
> root cause. That's not the case as you pointed out, so I think we can
> ignore that
> part. I think N errors in a make build are fine, so long as the rest
> of it doesn't
> attempt to run.

FYI I filed a bug on this:
https://github.com/SELinuxProject/selinux/issues/256

So we don't lose this.
