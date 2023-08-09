Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1610A776C9F
	for <lists+selinux@lfdr.de>; Thu, 10 Aug 2023 01:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233473AbjHIXHv (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 9 Aug 2023 19:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233425AbjHIXHs (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 9 Aug 2023 19:07:48 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB87E72
        for <selinux@vger.kernel.org>; Wed,  9 Aug 2023 16:07:48 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-40fe9c38800so1683331cf.0
        for <selinux@vger.kernel.org>; Wed, 09 Aug 2023 16:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1691622467; x=1692227267;
        h=in-reply-to:references:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VQfbTJjCmWtBg4hUJgylVyeXYXRezvNJemGqAd+CqWA=;
        b=LMBAsoT/usMLBrWGd02ra/MOtXialMrN58l9fgwcVGEWTd4cRsEpdtUJLGx9K8Fcb/
         92kkrp+3o+tnecU0QQHnRbqBRXq2ZwUplhkMcVc8Iuod/mEITE5u4HAvNLMr0JAXnVZJ
         0OQon0Xq/Vi7bsyuHunaKBQoRSy7Y7rDX0v7epanJJ+t3pR7H82ToQgNdFJ3pAgsYXib
         OUJ5UqaMvCASGyERRDEcNkLN+iFe0Eu5t7LgW2Wz2aO5I7B/Xp+voVM3iS1U6Y7Ezu/6
         Pg+RQg43AC6kOUEKcWazfMujy5MrU8Y9uB2ReHyDTER9BipTIz8gZinH+xMC05gsP2+6
         /JqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691622467; x=1692227267;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQfbTJjCmWtBg4hUJgylVyeXYXRezvNJemGqAd+CqWA=;
        b=JHH/lyT9M987XYLf+MxeduOf3fDrclsag+R3lOacJbIuK9lUGg4n//iiaaP67/wnNE
         /bQlNGiGXcYfkTWmi2s2488AA0vu1srOfHcqYN/rm/6D++bLuvuXF0LzObtiKMfo6TJc
         qvFfUYfCwt/YkU/y+PEH7UaqGmckSEHgSYlFmRXuRUkGBaG307iZXhSF8AafNeCETkhu
         vOW2ekyBr1Ci9g9mWQ6Q2+hvWuptwp7Zo7E4JR8WWvF6mk/paXQmJDPxGr/xafqT4mAq
         LsGHsc1LVGDitBrkLQ19WIr63/DKTEGZqurrEh6E/ncnM6oBRyk5uCmxxvnU01tSI/+a
         E8Cw==
X-Gm-Message-State: AOJu0YwUHz8JhZnvrc20onAitOJ/Nw3AjQxA16dft/rbp2NrbxwFP1mb
        Ibyf9Di3Z+StHUjOZ4TbeiKQ
X-Google-Smtp-Source: AGHT+IGta8kX3NP9TyOIqpPKp9v3hFUKdqezlZIgikd2k0YOZxLAd2CgfO8A59oDRwxstSV1zkclOg==
X-Received: by 2002:a05:622a:5:b0:40f:c886:ef33 with SMTP id x5-20020a05622a000500b0040fc886ef33mr969279qtw.16.1691622467232;
        Wed, 09 Aug 2023 16:07:47 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id iv10-20020a05622a6f0a00b00405502aaf76sm70448qtb.57.2023.08.09.16.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 16:07:46 -0700 (PDT)
Date:   Wed, 09 Aug 2023 19:07:46 -0400
Message-ID: <3ad619ce17895bb49eb02853da5a2f85.paul@paul-moore.com>
From:   Paul Moore <paul@paul-moore.com>
To:     =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>,
        selinux@vger.kernel.org
Cc:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] selinux: use unsigned iterator in nlmsgtab code
References: <20230807171143.208481-6-cgzones@googlemail.com>
In-Reply-To: <20230807171143.208481-6-cgzones@googlemail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Aug  7, 2023 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com> wrote:
> 
> Use an unsigned type as loop iterator.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
> v3: use unsigned int instead of u32 since the loop bound is known at
>     compile time and small (<100)
> v2: avoid declarations in init-clauses of for loops
> ---
>  security/selinux/nlmsgtab.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Merged into selinux/next, thanks.

--
paul-moore.com
