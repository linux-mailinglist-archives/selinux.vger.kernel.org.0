Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C94918FCAB
	for <lists+selinux@lfdr.de>; Mon, 23 Mar 2020 19:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbgCWS1A (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 23 Mar 2020 14:27:00 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43653 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727141AbgCWS1A (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 23 Mar 2020 14:27:00 -0400
Received: by mail-wr1-f65.google.com with SMTP id b2so18333252wrj.10
        for <selinux@vger.kernel.org>; Mon, 23 Mar 2020 11:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KErY0mdQ8xlxh5QWsefnC72AyinB+h9YtpAmpAgrUmw=;
        b=lTTel+hfd4WdRKnlhH6QBbSgFVyvyxFHYeHqtN/yLXenrCdO5GmWft1dyOBY4UsCNU
         W6u0brqEwZEx30/kdq2nb5a311r+4WEVNZF3NHlVaBsC2MUfbmGX6qIcX3wrRsZe67Fg
         Bnl1Fl7xd3P7JgNvtAItSFr9jwk6IJlw/JuwaFFgE9k/x72xYeAE9HtiMYxlyD+H3nxW
         itVoNE8rmATXdydmek1sU91qwWBzPZ5F6Iqi6edCjL+r1AuYF0yrSo/PDnelhdfx71ZO
         bEuKjeLYdNOR2k/RbiockicYSVW/bSyGeBVYPQrpW2gmthGPEpP/pXMf8eNX5QHUY7o5
         oe0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KErY0mdQ8xlxh5QWsefnC72AyinB+h9YtpAmpAgrUmw=;
        b=mKu00xqKwhg6PvWQWqK5iPxHVC3bx5DnihWkbGByDOGlvZdpfIfGcc61TBm0Psbzxh
         qXHjCYsZ7ciYwi0kIsKuVqoWgtAWK9VoOFianiWc7OT4DpAMFd4CHbtteIcLpjg8X2RL
         wdLaq06otKP9n2DZrct5O1RZNzuJfKexP+gpjG9YWaNeuCuXaKANkDkPM2N4JB0XlMXh
         ZxEQAILOax8y64wRahYsDt+4DnZzOYAFyNwBRb8+drdq5ECK/GjeEW6kWNRgfKH2Z4Oa
         vlhnrTrmgRaA2wNvrPudyYS8xxgrDoMgtsQVd1okt9rp6ufa3mSygN5VOkTW54HXswSz
         uoLQ==
X-Gm-Message-State: ANhLgQ1azVkQHdXl7DtChq+1bijSVD27Waur6I3R/F9lbw3LfgrMEywH
        mGJapcmNX/l5eiSvbyXxFeISHas7
X-Google-Smtp-Source: ADFU+vvqHZNkeBOEotAMYWTVOi0YHSyQ6I5o/3C5ncz7O10APdat94wKTqe9p2rJoPnPoMJAtZy2qg==
X-Received: by 2002:adf:f14a:: with SMTP id y10mr10023229wro.43.1584988018302;
        Mon, 23 Mar 2020 11:26:58 -0700 (PDT)
Received: from debianHome.localdomain (x4d004a48.dyn.telefonica.de. [77.0.74.72])
        by smtp.gmail.com with ESMTPSA id o26sm490534wmc.33.2020.03.23.11.26.57
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 11:26:57 -0700 (PDT)
From:   =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To:     selinux@vger.kernel.org
Subject: [PATCH] checkpolicy: add missing forward declaration
Date:   Mon, 23 Mar 2020 19:26:33 +0100
Message-Id: <20200323182633.12384-1-cgzones@googlemail.com>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

policy_scan.l:294:3: warning: implicit declaration of function 'yyerror' is

      invalid in C99 [-Wimplicit-function-declaration]

{ yyerror("unrecognized character");}

  ^

policy_scan.l:294:3: warning: this function declaration is not a prototype

      [-Wstrict-prototypes]

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 checkpolicy/policy_scan.l | 1 +
 1 file changed, 1 insertion(+)

diff --git a/checkpolicy/policy_scan.l b/checkpolicy/policy_scan.l
index 094645d1..4067268b 100644
--- a/checkpolicy/policy_scan.l
+++ b/checkpolicy/policy_scan.l
@@ -37,6 +37,7 @@ typedef int (* require_func_t)(void);
 static char linebuf[2][255];
 static unsigned int lno = 0;
 int werror = 0;
+int yyerror(const char *msg);
 int yywarn(const char *msg);
 
 void set_source_file(const char *name);
-- 
2.26.0.rc2

