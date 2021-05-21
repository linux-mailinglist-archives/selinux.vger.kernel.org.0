Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E249E38CEEC
	for <lists+selinux@lfdr.de>; Fri, 21 May 2021 22:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbhEUUVX (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 21 May 2021 16:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbhEUUVK (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 21 May 2021 16:21:10 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98540C061350
        for <selinux@vger.kernel.org>; Fri, 21 May 2021 13:19:34 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id j10so7132295edw.8
        for <selinux@vger.kernel.org>; Fri, 21 May 2021 13:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sSrJSQySUjx6FPqWl2/q5eAJB4T53E7fGvZWzpBPOis=;
        b=MjlAT5npheGS9uTNSbjiOXadoRxl/8jmvEI8G9aDhy7xqJUrdNYvGpkA8Xm60gTQkp
         K1BTWZE6r1FxeohLoTpdGsCICxR7jyT3hPcrIezLSGjSPrEyfdMzPjpvhdY5crrXj9PC
         ZASC00zQwWpR4VeG7cqgBg0ZjGjrhYqZy+27ZMUEx5VwUPTIk/A9DOkA6TZyuDrRvWl+
         FEk48QpMRPHZOZbfa8x1807awJmoQeWYH3h1c4zRDqv5HtJkTwnMWrPLROjBgOSyO482
         tVpmtr+pj2RPNNlrZekE6tP+JfVVvamRFyz3wtLUMNYKGfz4Z1EciHFs1ZXFoefUOE0h
         1/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sSrJSQySUjx6FPqWl2/q5eAJB4T53E7fGvZWzpBPOis=;
        b=L6+Tv7Wz6kVV++LCF7nAf796ppyZyQK/CLvRNconKgW0Zl47qyMVwrqNLUEAsdv//b
         YjhlYPbIXHODoZ3Nmu1TPBXbR41USJkBeFuDVBrQ10JGeyu1zjbFJ8J145Nc05svPdpt
         NzHYEigOnny04hwKH5cqZZHTZ0JNZSqJkFLAoOnlkwuLnh3kOfiJFF+m5J/nJz4+fjRG
         qD0le0/doR5Y03bosG7LXSy25s3E+P6sRN3b+1uMufzD4Vqxw/yPxr/FPNLYT3RmXXWt
         SJIX7f1dFYP6T1bdNnpOc8mSIltapgIR6K8m7fnu+2e/j+IDn+8KwUaccFmntyoGU2VO
         /wxw==
X-Gm-Message-State: AOAM53024NSKjRyO5ekZa48LWSAw2bkRtYTEksUZOHVbEP2MUdn64n2Q
        kRuhgMQnvQqxRKF4b0F5e02eUuBLCFt+OkdQQ5Fx
X-Google-Smtp-Source: ABdhPJz6+FmIEqBgSBEqq6zFfzmDtBhxn7muf+nqqkYrZjNmBPvdA78mgrLy76fm/YjN7a+/ZdDseuAERhUF84zi9CQ=
X-Received: by 2002:aa7:cb48:: with SMTP id w8mr13109201edt.12.1621628373077;
 Fri, 21 May 2021 13:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210513200807.15910-1-casey@schaufler-ca.com> <20210513200807.15910-19-casey@schaufler-ca.com>
In-Reply-To: <20210513200807.15910-19-casey@schaufler-ca.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 21 May 2021 16:19:21 -0400
Message-ID: <CAHC9VhR6uQwh5utg1qUrs2U3-OdwavzVNmcWG9Lmmqj3-Nbzsg@mail.gmail.com>
Subject: Re: [PATCH v26 18/25] LSM: security_secid_to_secctx in netlink netfilter
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     casey.schaufler@intel.com, James Morris <jmorris@namei.org>,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        linux-audit@redhat.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        Stephen Smalley <sds@tycho.nsa.gov>,
        linux-kernel@vger.kernel.org,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        netdev@vger.kernel.org, netfilter-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, May 13, 2021 at 4:28 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Change netlink netfilter interfaces to use lsmcontext
> pointers, and remove scaffolding.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Acked-by: Pablo Neira Ayuso <pablo@netfilter.org>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> Cc: netdev@vger.kernel.org
> Cc: netfilter-devel@vger.kernel.org
> ---
>  net/netfilter/nfnetlink_queue.c | 37 +++++++++++++--------------------
>  1 file changed, 14 insertions(+), 23 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>


--
paul moore
www.paul-moore.com
