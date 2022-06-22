Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAAC2554E94
	for <lists+selinux@lfdr.de>; Wed, 22 Jun 2022 17:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbiFVPFL (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 22 Jun 2022 11:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358978AbiFVPE6 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 22 Jun 2022 11:04:58 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA09DFF3
        for <selinux@vger.kernel.org>; Wed, 22 Jun 2022 08:04:58 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id d14so12742407pjs.3
        for <selinux@vger.kernel.org>; Wed, 22 Jun 2022 08:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=DR3IdHGkwFG9d1wTEwVxiW6CRtLOePWyl41YEnPf16V9ffh4DPepf3Olj0p8Txqxaw
         Wp02j9s9xh44OtvIUZWfBgpYRdfRoiukh3w2LAvJ2hBLOT+9Br2oo4W05d9BFKLMuWrl
         px+WYkrfcPH1NQ/4vpDSjLe49eJSIMr2/RsbJdQTBo1O6kKcmodGZeWSiDQ05vPK+Pdk
         A0ZwzV5kZpv9EaR+7z6gVYjz4wozAULp0EQlqbTcc7LY/yrmtCwTMiAI9JoxkUo8kYRD
         PJE3/DExP1r2CCX+y3vsBzTsB4/GWIDZkP95RjxjMFaZ647ySJjlKz8q/pqLb8RtzAlk
         1FpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=O8yMgmTEYlI1TXdwdvbn03QYTIpWSqiwOriI5VlovwHWiuwkp2DUG7MzffVjSP7jk3
         D9dJOwvtLBz0rLrP3oqyTkufr3Jx4ulfQaXlq2jQrQAsvvefCCxUYNb/bJnYvtynIwJx
         ZSJxPlChkiydP8gXg6aDqTbM2TiuflbKnl8WKh4IqmTfFedYVr74DXQNg/97C3YUYOum
         z3dDtqSFbVauZz0dVpg7Ep4ublLRLnpcEGBPPJE6dbBk99YqasmQTMfghIKGdk+XGBE7
         hWU7IkTQPOQP4/BNtopcqlPVJcskPB3iJAzIWs8WQDll7MY+lU14O3lDhT+cULX7tTC2
         t0lQ==
X-Gm-Message-State: AJIora/DLFRDtLlEcpFxuKtUaeShXLLEOjO4byhKbaWLycrr4XDr4nU0
        FqtlYIhE+qoLdGRevHTrtSx3p2Suffl29Tqyyb4=
X-Google-Smtp-Source: AGRyM1uE4sBiWoGyz5+EOoceSsD9FZJLY4ZhCPzpyr2X7cFzoNKR4X0ufj5JU8cLF9vmhgWE3YAZay0cF0lSlodzVTM=
X-Received: by 2002:a17:903:2cf:b0:151:a932:f1f0 with SMTP id
 s15-20020a17090302cf00b00151a932f1f0mr34632956plk.130.1655910297633; Wed, 22
 Jun 2022 08:04:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:903:2308:b0:16a:1b3f:f74b with HTTP; Wed, 22 Jun 2022
 08:04:57 -0700 (PDT)
Reply-To: sales0212@asonmedsystemsinc.com
From:   Prasad Ronni <lerwickfinance7@gmail.com>
Date:   Wed, 22 Jun 2022 16:04:57 +0100
Message-ID: <CAFkto5vCDZkU==9+9aihPS90tjj_ar3eNGLJ=eL5+Rti8Re6=Q@mail.gmail.com>
Subject: Service Needed.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

-- 
Hi,

Are you currently open to work as our executive company representative
on contractual basis working remotely? If yes, we will be happy to
share more details. Looking forward to your response.

Regards,
