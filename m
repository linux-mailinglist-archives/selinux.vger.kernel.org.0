Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE8D3F8E85
	for <lists+selinux@lfdr.de>; Thu, 26 Aug 2021 21:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243427AbhHZTPD (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 26 Aug 2021 15:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243400AbhHZTPC (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 26 Aug 2021 15:15:02 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C29C0613C1
        for <selinux@vger.kernel.org>; Thu, 26 Aug 2021 12:14:14 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id i6so6248628edu.1
        for <selinux@vger.kernel.org>; Thu, 26 Aug 2021 12:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rx0FUZ0y/4cX/RB/wrUdWs+Xu2SixTxkAb51quz7jo8=;
        b=gnWwUt3JdlTv8VP9sot3kjTMSbk6xwqrxgCgHZylW8hKKqckrTGkz0muKu4CBOEHn7
         wG6JLCceDpcYIpIo5EF/oBtz+SiHUfn/Qa909EqNs0kW2jo1foPRy+rCIamGkla+QT9S
         6ZM1JxJVo1tT6oeX8u3OUOeJJ6zaEf9Q28JJhmMaDgCglfm2bOtEn5qjrgtqpVaucGdZ
         LI267o4R1RTs5O4tS2zWmwEQpTA9ZAmgRK5EU/B9I4xcBeINEDvGPQMGe0vPsT70C/HL
         OVy77vIjlo6NdxsB4/rJ5nTmgISGdu1vTD12Avv/kDgks2NHFxXy86bmK5+2Y3hrWB1F
         irSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rx0FUZ0y/4cX/RB/wrUdWs+Xu2SixTxkAb51quz7jo8=;
        b=ZE2A1dN2RjL8Xf7IoHxhCGK52+uifgNpvJP7kt49JMxWFvtOKPwrsTxSkml7Su7SpS
         ullBpT3PXbox46Obta+Kd5dJjdTSBmDvezWckcFEGlhceUhPELpjHI523mGareVnDaqS
         UvBnBWY/oZTbAeCoSXXXb5Iev4UE1HmkueVlP8E+LBtFj8mUU23trqgpGJnuXWTAyXNM
         2XyCZ7Le6Q/dlM+QmLMl6ke48oDcFZgTs8dtTdUseZ+0V2NI9VfO59IvHSGl5sYhPP71
         6VwsoV/9kkrT4CotS6x2yjc+CKsaORTlO39RTJ+cSxvrhmwLZj1z+Ti9tPiJ20oGrGq4
         0z7Q==
X-Gm-Message-State: AOAM530xgoB0GePQurOgPskRcN8qUCVQanafUeKnF8t2nmfNGhqIlOEL
        IBgm6H9nnCLgQa0VoxZN0TUsdATwglShDG/ytC7F
X-Google-Smtp-Source: ABdhPJwW5wBqVh+ZTgsyTSWJmX+Kmrj84VmvqS9Yc/10HktwgbbDnwLo41tBgtnkP5vc5wtH1HUiC5RxqSWTlGMKY1E=
X-Received: by 2002:aa7:d9d2:: with SMTP id v18mr5927880eds.128.1630005252910;
 Thu, 26 Aug 2021 12:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <162871480969.63873.9434591871437326374.stgit@olly>
 <20210824205724.GB490529@madcap2.tricolour.ca> <20210826011639.GE490529@madcap2.tricolour.ca>
 <CAHC9VhSADQsudmD52hP8GQWWR4+=sJ7mvNkh9xDXuahS+iERVA@mail.gmail.com> <20210826163230.GF490529@madcap2.tricolour.ca>
In-Reply-To: <20210826163230.GF490529@madcap2.tricolour.ca>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 26 Aug 2021 15:14:02 -0400
Message-ID: <CAHC9VhTkZ-tUdrFjhc2k1supzW1QJpY-15pf08mw6=ynU9yY5g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/9] Add LSM access controls and auditing to io_uring
To:     Richard Guy Briggs <rgb@redhat.com>
Cc:     linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        linux-audit@redhat.com, io-uring@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Aug 26, 2021 at 12:32 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> I'm getting:
>         # ./iouring.2
>         Kernel thread io_uring-sq is not running.
>         Unable to setup io_uring: Permission denied
>
>         # ./iouring.3s
>         >>> server started, pid = 2082
>         >>> memfd created, fd = 3
>         io_uring_queue_init: Permission denied
>
> I have CONFIG_IO_URING=y set, what else is needed?

I'm not sure how you tried to run those tests, but try running as root
and with SELinux in permissive mode.

-- 
paul moore
www.paul-moore.com
