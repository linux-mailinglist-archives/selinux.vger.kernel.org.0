Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63D8662AE96
	for <lists+selinux@lfdr.de>; Tue, 15 Nov 2022 23:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238662AbiKOWtF (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 15 Nov 2022 17:49:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238692AbiKOWs3 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 15 Nov 2022 17:48:29 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9519C32BB3
        for <selinux@vger.kernel.org>; Tue, 15 Nov 2022 14:48:16 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id b1-20020a17090a7ac100b00213fde52d49so540181pjl.3
        for <selinux@vger.kernel.org>; Tue, 15 Nov 2022 14:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fwghFAmuNJoGE60qafO5U3nieSvWd6hYAK15slWenZ8=;
        b=VLta2v9Q2fPfm7IYpqH7MJD2D2KvL8Zy16EaLSLUIFYmkNU0nUpTEKGSAvAYgVU5Km
         EsPhbghFKriAKvzsWuain9kOxCEKCXPHcjRuCUcm5LQQfZ0P8Mz0mFhn+Q8j4q9RAexl
         POmMQ9+EvvDz1xxXCOVhaQzA/TmXAGAH9khs5ueKPVJ6jwPrEkMxw+8/ku0o8W23yM+H
         DGyj5OwInRHYmBirGctT8gkA6x7YkLcr5Vs29iirDw2bUlx/l/rS/8li3vy6cZP3bwNQ
         4dOYIcvUJJr442c1F1bTcah+pXNkxasOgIX9Dh2cPjXF4SJpPw6wR0WiIYvBxV6jGpq9
         0f6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fwghFAmuNJoGE60qafO5U3nieSvWd6hYAK15slWenZ8=;
        b=HcLcF3ogFWJY1tdP+f+pgTWDyaHTVEQFnO7wgx2dBao6fp7ZY2quqk1DkExKi4x+md
         LE5BypnW2149MVRah0khcEzlIBoZ2Uiv2+rF9vHnT3rtMoWKukPSWZA4vzdgtUrJsmdV
         5WtGjdMNK796JUrMhaA+8ytNZcNEiaaJZbAGAtg05RcQ0axfwka+wX9wKwStP9yD+Wrp
         nCVMSO1lOsS6ycopHIZsOgNiyCFtXW/jmTXolT1aBI5UYJjdM9fLlAh+RL0HdVLxBZ0w
         QK2p9NWpsKSy4B1oRhH1KVw9TELD2XOZlV6Ju5rS4WMnis99kydBRPoFNmsBy0QOGU9E
         8D9w==
X-Gm-Message-State: ANoB5pktMEPVB7FMWeATiBAFPsuvnnvsiQwEeJRW6eKEhpOcM9ElNMA9
        aiOjZayq0Z5A56RKGJ4DkBvCPMwPaC0k3Hsh2MpzWXPllw==
X-Google-Smtp-Source: AA0mqf75OIkPFLJbWVjG7sCkVNXIrPkpw94A2T61XRllRxzO4dDuMoF3hOzil3qwD+wswJTp9bG4iSC5gIhAnSVYtu0=
X-Received: by 2002:a17:902:bf4a:b0:186:e568:3442 with SMTP id
 u10-20020a170902bf4a00b00186e5683442mr6151547pls.56.1668552495175; Tue, 15
 Nov 2022 14:48:15 -0800 (PST)
MIME-Version: 1.0
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 15 Nov 2022 17:48:03 -0500
Message-ID: <CAHC9VhQSqN-9Y=Cc0L5uSXGH4dP3VhcpSZJVRCRi8_0JoT3z1g@mail.gmail.com>
Subject: New SELinux Notebook release?
To:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hello all,

It's been a while since we've cut a release of The SELinux Notebook
and I'm considering making a new release.  Does anyone has any changes
sitting in a personal repo that they would like to include?  Is anyone
aware of any bugs/problems in The Notebook that they would like to fix
prior to this upcoming release?

-- 
paul-moore.com
