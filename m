Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87B012EBF31
	for <lists+selinux@lfdr.de>; Wed,  6 Jan 2021 14:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbhAFNtg (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 6 Jan 2021 08:49:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbhAFNtf (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 6 Jan 2021 08:49:35 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6810C06134C
        for <selinux@vger.kernel.org>; Wed,  6 Jan 2021 05:49:02 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id r4so2671933wmh.5
        for <selinux@vger.kernel.org>; Wed, 06 Jan 2021 05:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=Q/nh8a+OvCmc6eIe9NgRxtdJrH6odstdL4CFJuaMinM=;
        b=DuHeUrabaui+zL+q7bDxwROr4Evxrh4p1kOy8M85xbhGG8sh6FNIg4dLbFpVKbMqho
         VFYh2O8s2xuwSkGb38xa/oNW2nJygQQxDspR7M6C+iQOIFMSUS8u0xmy6O4mJ+YVt9iN
         FQOfNsMYsnUsT+MlTgRScosrQU3n8HFwa/jFyE6oj9rpVi3Gso61aaFO5ESEnBwXSEBD
         q0jxkqAntJ+EFmgYPRj/owTvkJBWBSCfZ1Nou08yhzxP5M0xWhWKy7aw9mC4U1JCrWUJ
         63lVgYJirtn3usKTFjFbOfREHWldmnmz2WhPf9nubbeTRZ6hvFWAWp8H4ha8LhZM7WG5
         Zv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Q/nh8a+OvCmc6eIe9NgRxtdJrH6odstdL4CFJuaMinM=;
        b=TiFBZLHRsOV1aj64yh2MgO8MTeBu0qt7qJP8+NIYDQRIWk52GmMuO1hMUuVCq0vYWb
         xe3anAcjhW6hPrwScJXOr1RBdUTK5uG7yl3nTJFMBLkbnl8c7kn4WaG3UlX5PrC+DTv0
         LFIMmP/E5FM3Xqu1zaTzI/Sa9AyJRtx8c1ttIzL6341ciqMsIXskgp2cInzLTjmTFjqS
         zgK24J3IhYn/xYQfQP/l1CC2/y0uWzXBngNWX/sWdfjG9ChI/ScRzHhHcHXBZ7Ksp9jG
         ZDcl1vc/TU1Km6lBqSVIneMN7nG1XdCiERsnOk8LRqKmPvVFLMUUFRPfz8VVpRAdMsCe
         2Kbw==
X-Gm-Message-State: AOAM532ett+d2lwcyhkwt7Qo/kxghRdoxDkjlBiTrX2pfBhbF72ard3E
        YUETFxoGaN4/8Ox77+wmdlGQdGtdF/K4ObiP9MRfR2NWQvbF6la2
X-Google-Smtp-Source: ABdhPJyDz3l3AfRwLNf1yMonteW7XytyQ1DaiMWNlraSzvmSeiYAP5UGiQNS2RV8mWo4EGcM6UUmDoz3fCMNTKN6Hgs=
X-Received: by 2002:a1c:e342:: with SMTP id a63mr3885793wmh.64.1609940941147;
 Wed, 06 Jan 2021 05:49:01 -0800 (PST)
MIME-Version: 1.0
From:   Ashish Mishra <ashishm@mvista.com>
Date:   Wed, 6 Jan 2021 19:18:50 +0530
Message-ID: <CAP2OjcieTJAmeuZX_uGQjjsqCZ7x208aHAVSzHfZxS9uzyBAzg@mail.gmail.com>
Subject: Git link to get semanage , sesearch source code
To:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hi Senior Members ,

Good Evening.

I am trying to get SELINUX on our custom SDK for which we have added :
a) Userland libraries and tools projects from
https://github.com/SELinuxProject/selinux
b) Refpolicy from https://github.com/SELinuxProject/refpolicy

With these added , I can't see binary for applications like semanage &
sesearch .
Further looking I tried to get the packages mentioned below which
provide these binaries.
Can members please let me know which stable source code for
       a) policycoreutils-python    ( to get semanage on target )
       b) setools-console              ( to get seinfo / sesearch on target )

Since I came across these while working for another issue , I thought of
creating a new thread just for this to keep it separate .
Please do let me know if this is violating any accepted norms of
community here ,
I would align with community rules.

Thanks ,
Ashish
