Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70362381042
	for <lists+selinux@lfdr.de>; Fri, 14 May 2021 21:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbhENTGQ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 14 May 2021 15:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232990AbhENTGQ (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 14 May 2021 15:06:16 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A625C061756
        for <selinux@vger.kernel.org>; Fri, 14 May 2021 12:05:04 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id v11-20020a17090a6b0bb029015cba7c6bdeso308437pjj.0
        for <selinux@vger.kernel.org>; Fri, 14 May 2021 12:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2oyWB47DVh2Z1QlH8RDV8bFzaQjwvqlwdoVeOlHpTjY=;
        b=N7xVGKEZAXnH63GpXE5YnML5NzFhi5pHSpODhdP/+SHXypBf+ks4urojkWF+Ax4bXJ
         H9elgm+fGXV0S5oqzNOAJNQmqcxAsHqbr2rN+1FBkvyF2WznF6gFOSPjTXX5SglQyi2y
         LXNsTtw2ir4m0hJtlXyLOuM593MKZvmymmOBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2oyWB47DVh2Z1QlH8RDV8bFzaQjwvqlwdoVeOlHpTjY=;
        b=TOTxhL9zwLFfpevzWlTCi9S85FvaYTfBB32qs7SPX+rdP6QYy3RVIfOlale9kPxnnW
         iuwJW7CtPpQUicdLIYJfhKb2TE0gnccVI+FY22pxGIYQzhTz9lD/u0y7hCeyTCXMnNwx
         +pXBxlrCCyP3pTjZyx3NCh7QQqdPxAUn/TVdk7NhF4yepXJv6SuL4OTVIwwGW+QO328E
         MyJRJGHsnaz/xmjuZDJbISEq/RfHcq9m+FsQ9d1ytw2zX6jMiLmNJRJaA4Jmuk7vdJ+3
         Z6M+53XdGBuXehSQBG48FM8iS+uWkqoMNnfC1Y2Qti+c2KFMS/y6FwrRQKB47sY4hCWK
         VkPw==
X-Gm-Message-State: AOAM532bQJKeTVBDYGOtBKFdM0JJaf7XzBE+iXC9KrT4NE27k2TgYkHd
        nPiYcLVcpiXpY/eeEJG3qDp3Ug==
X-Google-Smtp-Source: ABdhPJyUObluMNbfEqWcZJnBSUzUGr8HvBPdxmzJ89o/blQ7U0kb+Fxmtnzn6tpGLVDTKLmFXMSQzQ==
X-Received: by 2002:a17:902:860b:b029:ef:46b8:886e with SMTP id f11-20020a170902860bb02900ef46b8886emr24070539plo.18.1621019103903;
        Fri, 14 May 2021 12:05:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v67sm4506950pfb.205.2021.05.14.12.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 12:05:03 -0700 (PDT)
Date:   Fri, 14 May 2021 12:05:02 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        linux-audit@redhat.com, john.johansen@canonical.com,
        penguin-kernel@i-love.sakura.ne.jp, paul@paul-moore.com,
        sds@tycho.nsa.gov, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, netfilter-devel@vger.kernel.org
Subject: Re: [PATCH v26 08/25] LSM: Use lsmblob in security_secid_to_secctx
Message-ID: <202105141204.B7691DAD26@keescook>
References: <20210513200807.15910-1-casey@schaufler-ca.com>
 <20210513200807.15910-9-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513200807.15910-9-casey@schaufler-ca.com>
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, May 13, 2021 at 01:07:50PM -0700, Casey Schaufler wrote:
> Change security_secid_to_secctx() to take a lsmblob as input
> instead of a u32 secid. It will then call the LSM hooks
> using the lsmblob element allocated for that module. The
> callers have been updated as well. This allows for the
> possibility that more than one module may be called upon
> to translate a secid to a string, as can occur in the
> audit code.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>

This looks sensible.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
