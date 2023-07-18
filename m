Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78C6E7587ED
	for <lists+selinux@lfdr.de>; Wed, 19 Jul 2023 00:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbjGRWBU (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 18 Jul 2023 18:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbjGRWBR (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 18 Jul 2023 18:01:17 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0291995
        for <selinux@vger.kernel.org>; Tue, 18 Jul 2023 15:01:16 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-765a5b93b5bso565400385a.3
        for <selinux@vger.kernel.org>; Tue, 18 Jul 2023 15:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1689717676; x=1692309676;
        h=in-reply-to:references:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5u8rf6YcuhUx0bAV6M5NJKe6fFdJ31NMIG3OGKzC1iw=;
        b=MtC4IxPZlQ5NdOu3NrmtRF0XJHMdQP5wjUTvI/pGec5UCKUdl5xGJ/OE3zycYrbwJm
         UW20uG4KmyHE87Qn43YqYXp8NlocGepmO2SPJekKWOGx1DjBpJsPx4+Ftnmhm0zIgLTj
         h8n+mxkrf2qQNWJxXttdqYmaPTp6rUR34pwyXTTFsovRihA9mCvh9Crr1BesBEWyEK+a
         Ln4b3ZOyYbNaSIaCHz7BYhztDlu2kKt6ylyQ0FAVuvn1xMgb5Ic4ZKl+RPGG2lHI8WUr
         nKPmxIScGYJaZR71u7+W5fRZKm9QxPe2TCvPXGxZSeKaPlB7MEUxO9idfPb1ppy38XxR
         QEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689717676; x=1692309676;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5u8rf6YcuhUx0bAV6M5NJKe6fFdJ31NMIG3OGKzC1iw=;
        b=L2/Z+yDl1bpuNcQq3Z807O/qI0XFzQs5CcgwHOU8AR6xuEQ8UPo6VOEdUUtZj1u/L/
         oPeRokjkbt+BMzZB02K6bJSAr0NxtKTtWbmhY/mXs5Mr6L215oWScym9YAKYxeS+Smhy
         IrnDEG/o0IRFDmMPKCMTpV2qz28v/csltAPFn5wazg3oq0KUZ2K3NIrCAIg0eAsdTv8O
         7eBKbs5vGiTNTYrQ3SxGQIUNUlVQAT1i38DJ7czH4gDLqxdbPUsDhlIHLNa80Zjk4Ezx
         VzmT3bSUDkRq6v8NmzJOmJqzF3SW8ps30m6jLtneUeHinwo0JygCHWjQ1ASAJAQHPLOL
         ph6A==
X-Gm-Message-State: ABy/qLbSWsECbELV6RBzBjJW5RJtAfiRPqfBS/mqMFwm4oee2lR+elNC
        9pZvy88t3raxTjdH/YQkSu/B
X-Google-Smtp-Source: APBJJlF93PVfL17b/Rmo8O4paOMqfJW30sST0Oxq4VivzOMjEenDVQ2ZU5K7/x+tNH+0nfEdSboFUw==
X-Received: by 2002:a0c:e64c:0:b0:636:1bcf:7aa5 with SMTP id c12-20020a0ce64c000000b006361bcf7aa5mr14003670qvn.21.1689717675867;
        Tue, 18 Jul 2023 15:01:15 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id pz10-20020ad4550a000000b0062feb88e56fsm991901qvb.140.2023.07.18.15.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 15:01:15 -0700 (PDT)
Date:   Tue, 18 Jul 2023 18:01:15 -0400
Message-ID: <2f0958af087bcccd8b8f75fa641d9787.paul@paul-moore.com>
From:   Paul Moore <paul@paul-moore.com>
To:     =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>,
        selinux@vger.kernel.org
Cc:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 4/20] selinux: ebitmap: use u32 as bit type
References: <20230706132337.15924-4-cgzones@googlemail.com>
In-Reply-To: <20230706132337.15924-4-cgzones@googlemail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Jul  6, 2023 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com> wrote:
> 
> The extensible bitmap supports bit positions up to U32_MAX due to the
> type of the member highbit being u32.  Use u32 consistently as the type
> for bit positions to announce to callers what range of values is
> supported.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/selinux/ss/ebitmap.c | 32 ++++++++++++++++----------------
>  security/selinux/ss/ebitmap.h | 32 ++++++++++++++++----------------
>  2 files changed, 32 insertions(+), 32 deletions(-)

See my previous comment about loop iterators.

--
paul-moore.com
