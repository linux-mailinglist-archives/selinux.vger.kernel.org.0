Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6778660F794
	for <lists+selinux@lfdr.de>; Thu, 27 Oct 2022 14:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235337AbiJ0MkQ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 27 Oct 2022 08:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235636AbiJ0MkL (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 27 Oct 2022 08:40:11 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E761D673
        for <selinux@vger.kernel.org>; Thu, 27 Oct 2022 05:40:10 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id h9so1995317wrt.0
        for <selinux@vger.kernel.org>; Thu, 27 Oct 2022 05:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eQtHVIh1aNe4Qh0x0ragWBnOPchUE+ZIYXzmSXO/abc=;
        b=AeFqGM1Jxb71fdFBvc6Ql1bK+qMx9qKTYC8onAUectCSWFtnW+wouF78xU2yqV/bPP
         2+S597/ba27ZgtZ7gY90aWdwaAGTmX0MG8MoeixQLtGcq11PUu/0zHSKGYZ9RzwhOGta
         phqrr+AZRPQOGVfiZ/553ZSX6ApbN3VbDB5EkLPPQNZ4EA3isGq3Yisd/Pfh0+xJm4yw
         fuUYOHoeRijxea+HQjl3nsmaXCduwEziWgG1jXolHh8Go/jA3tqU1cgXRKgBn8dxj4Pr
         cf+dehDzifMXSYfG2gyZmsMmmQmQX1uYNAeI9exyr+gaEEIkgLwz369CpOjP/u9vwqNS
         HBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQtHVIh1aNe4Qh0x0ragWBnOPchUE+ZIYXzmSXO/abc=;
        b=6+2cYb1sVlPkh05Dq2lk2RXzFiT21CK6rvyDOPBNVurC7g+ovORvDVIYuecqMtnGjZ
         TOM+ULMzKGOv0WMK2rb0treSzX5RZe8HbGB4KLz9+xKKA8GT7Pq3gyTejpgIzPQqbYrV
         mjvXaCXNB5RCxrRtnmy1i8tuFxt3bxuKo3FRJgo7Uw7xAnGB71EnsJ1ar5CsSnXLODGM
         PFu4MkGAizXVewQbuu6k8bvAyvQ4sWhc8/IGuHcA8Dk2Jf213XeWoTOJZa9VmToJKg7+
         RMnxVI0ViDehF11ZQiuV8iPEbLZKvqP0KH79tUQ3tWhVbDHi/ACKYQhfkiWCLEtNf23u
         cWQw==
X-Gm-Message-State: ACrzQf1TnMXcbbLtNPTeWf4VRWWsgOJwNSKoy2St7P6p7T14iDCYEBi0
        ymLqJnzJIjCFzI0k+4Yduw4rXhFgsx0SIkUJbuI=
X-Google-Smtp-Source: AMsMyM5K81HzvgcLvCCs9jl1M9LRalQ1qIwD13+egy60syW1mH8XEu5noa1t/10l60zj2s/igDRcKWBZ/N34qbA1OpE=
X-Received: by 2002:a5d:6d8a:0:b0:236:6123:a8a5 with SMTP id
 l10-20020a5d6d8a000000b002366123a8a5mr17349585wrs.229.1666874408348; Thu, 27
 Oct 2022 05:40:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:4682:0:0:0:0:0 with HTTP; Thu, 27 Oct 2022 05:40:07
 -0700 (PDT)
From:   "M.Cheickna Toure" <metraoretk1959@gmail.com>
Date:   Thu, 27 Oct 2022 13:40:07 +0100
Message-ID: <CACi=TC4h6zab6YY9oxwj4cpkjApQ0bAnCM7Qrt2DCjsuhtkakw@mail.gmail.com>
Subject: Hello, Good afternoon
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hello,
Good afternoon and how are you?
I have an important and favourable information/proposal which might
interest you to know,
let me hear from you to detail you, it's important
Sincerely,
M.Cheickna
tourecheickna@consultant.com
