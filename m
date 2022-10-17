Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54D83600D47
	for <lists+selinux@lfdr.de>; Mon, 17 Oct 2022 13:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbiJQLAh (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 17 Oct 2022 07:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbiJQLAK (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 17 Oct 2022 07:00:10 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE9961DA9
        for <selinux@vger.kernel.org>; Mon, 17 Oct 2022 03:59:02 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id ot12so24056908ejb.1
        for <selinux@vger.kernel.org>; Mon, 17 Oct 2022 03:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h6TAvh2KhlPwZbZl975on9cPhNtC4Qh0FGtOTBu2EFs=;
        b=PDjiHM7bGIhQTP/Turi+vuI1BFgexsVbEG+L89/lbncumznjbfUJFa1/0Gz62grn/9
         Y2QLrxnBYBUWjf/MvcMnhmj+sVg173QqtzJ7Q1XnfbYRxlgIdzO5l7vkEtyhMLeFSSR/
         6j2Sbb/VRTjDGhrHxw6wCiY5FhuyLLVnZ2bqJXEDorRvnDLVg3cuXI4sgP+DSCEMCqMc
         hnUA304202r1Qjo4lnbg0t3Xdv8SONA9lQqanLqLQPoqJE2vDqEqhw/NJzVJNWJhKixm
         X9hLhg+S0C+Eu0oeoz3b/9lFcb61u9nRRDrgCxRliILqlV5qJynxjdw0BtUDHvmE4tN/
         /ROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h6TAvh2KhlPwZbZl975on9cPhNtC4Qh0FGtOTBu2EFs=;
        b=Lh+xQEKdRMkDXFkWr+A4mt9Xmz2TH6VHmqOJpVb5+Nkcaycdo/iVn/WnXOuTCHomo3
         SPBA6fKAp9ygWwgJ+/tFvD2o4s4vnyiZ9XZ3g/oStWhkYCt0e4BcEa4/48HX5ZDjyZNG
         MNF5PLHGigKQunSthOItCflSSGPE52+5hj94jtkhTgXjaYPMd0FbqgZ/tXLRbJnutjtX
         qMDM9dJNPjk1M6oV5X0uek2a1Ezb7On+ykDS0sa6fJTKNWeWDL3nmrJTDEpSXN2qyXDK
         CcApyA06ZVKOYLONwy/WsMCjpwh21lGHIwVS5bjev0H5GzxZQ6xGRD265g9O+MyoU07Q
         FuYQ==
X-Gm-Message-State: ACrzQf24VltuYl1osfTK6RwxB+LOUiDQx3A9qJWqPIwudOe4DgE9pSvN
        WPvb++1FLlLABFHDCtnEAi8fIOzM/RAp5F3DXJs=
X-Google-Smtp-Source: AMsMyM6l8n/aSHAoC59UwKtZX+xbq6KQythXIhXEFLyWseZNn1h2u78aMKDqYef8hiTT0XRHemZ8WnR5rDUwnv1mA/A=
X-Received: by 2002:a17:906:36d1:b0:76c:a723:9445 with SMTP id
 b17-20020a17090636d100b0076ca7239445mr7809869ejc.548.1666004337624; Mon, 17
 Oct 2022 03:58:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:71a:0:b0:1df:c5cd:1b43 with HTTP; Mon, 17 Oct 2022
 03:58:57 -0700 (PDT)
From:   M Cheickna Toure <metraoretk5@gmail.com>
Date:   Mon, 17 Oct 2022 11:58:57 +0100
Message-ID: <CACw7F=aNX0Xz1KovRx7K3MtpP7sAjRGXxDvPLF8K5-3WjDRDMg@mail.gmail.com>
Subject: Hello, Good morning
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
Good morning and how are you?
I have an important and favourable information/proposal which might
interest you to know,
let me hear from you to detail you, it's important
Sincerely,
M.Cheickna
tourecheickna@consultant.com
