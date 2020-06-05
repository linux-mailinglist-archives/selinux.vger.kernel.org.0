Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 187CD1EFBCF
	for <lists+selinux@lfdr.de>; Fri,  5 Jun 2020 16:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgFEOtV (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 5 Jun 2020 10:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727839AbgFEOtV (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 5 Jun 2020 10:49:21 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FCAC08C5C2
        for <selinux@vger.kernel.org>; Fri,  5 Jun 2020 07:49:21 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id n24so10425549ejd.0
        for <selinux@vger.kernel.org>; Fri, 05 Jun 2020 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EHmXYqTpGlxwly9jNPtKx9hnbvE0IszXHF09ZRQG5pw=;
        b=dvgqgY+cIMuMVucE0KtAC8VAyhqNgjRf5dmkTZBFCX4D+1XfS+IucP7MmpWhqESaEB
         isVTLjLv5Nqv/gikwnE1RNRKWoHfSZ2mhDrrXBauI8IR8Nr+1fzxMVQ42npdjXoIz1nU
         9QLza/yz7xpOhq7skws6pbiYpCQp5RFLHGGl2ZGXCCNaMlk+0xQ9hHNaNzCdzMEuDuPg
         9IDJDlteCTzElGuOqYSm6+QM1THfZq1zbIO2E255e3FTyuLo+oeqBWNlgQl9YHAm/aHM
         a2hKk4V8L/Pqzgi3Rw8DKBBMcr10HPdDttTs1pSX9iCqjuj3S9r833s7Grv68IZrDCoR
         8Ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EHmXYqTpGlxwly9jNPtKx9hnbvE0IszXHF09ZRQG5pw=;
        b=rbjiJ1E/Q6njd9GlGmQaDibnYNWMT6Ylftukdbvqqh+bLsbvCe1pUQfSAlaFTIEPAv
         FEvHK5V0dOolNk5rPFQdlvN7QRwhAw/iZrQ6xF5QH/XqjwEJ29wpEuYuVlUAaUin/0dU
         FJ2LWPMbcb2uOGmmjuyC4uI1llc0Dmdcr/UwIXGsG0JgNQZxWJ5Klt2daRItAT+ENxFH
         HvII5KFfSQzDvcrngzIxFab+hqlnh8/w3WSF2pKqAt59m8u43z41M+cwSrVbpP8WHfDg
         AbDohuNVgm3TSaS7UIOxei+xm9WyqHmC2GzbE4+XkgtnAxywoCmRq9MBZp3PwCWaLIT5
         d8pw==
X-Gm-Message-State: AOAM532UqkEhV6jIALCuTWL1ioup7bE6nr7pgqvyqbl4QrxV6U2lkdPc
        +7ODiY5JsCeWNbRBXMy5L55TmkMS
X-Google-Smtp-Source: ABdhPJzyioU+owbr9J80KSY01FnE+oZoKnhyYudr4YKbzSx+s+yIwQHgVc5N14vCHvBJwI8nLglo8g==
X-Received: by 2002:a17:906:fcae:: with SMTP id qw14mr9614893ejb.166.1591368559655;
        Fri, 05 Jun 2020 07:49:19 -0700 (PDT)
Received: from debianHome.localdomain (x5f70b03c.dyn.telefonica.de. [95.112.176.60])
        by smtp.gmail.com with ESMTPSA id a9sm5060948edr.23.2020.06.05.07.49.19
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 07:49:19 -0700 (PDT)
From:   =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To:     selinux@vger.kernel.org
Subject: [PATCH v3 1/3] sepolgen: parse gen_tunable as bool
Date:   Fri,  5 Jun 2020 16:49:10 +0200
Message-Id: <20200605144912.22522-1-cgzones@googlemail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200528125128.26915-1-cgzones@googlemail.com>
References: <20200528125128.26915-1-cgzones@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Currently sepolgen-ifgen parses a gen_tunable statement as interface
and reports in verbose mode:

    Missing interface definition for gen_tunable

Add grammar for gen_tunable statements in the refparser

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
v3: no changes

 python/sepolgen/src/sepolgen/refparser.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/python/sepolgen/src/sepolgen/refparser.py b/python/sepolgen/src/sepolgen/refparser.py
index 2e521a0f..f3e0ae87 100644
--- a/python/sepolgen/src/sepolgen/refparser.py
+++ b/python/sepolgen/src/sepolgen/refparser.py
@@ -126,6 +126,7 @@ tokens = (
     'GEN_REQ',
     'TEMPLATE',
     'GEN_CONTEXT',
+    'GEN_TUNABLE',
     #   m4
     'IFELSE',
     'IFDEF',
@@ -192,6 +193,7 @@ reserved = {
     'gen_require' : 'GEN_REQ',
     'template' : 'TEMPLATE',
     'gen_context' : 'GEN_CONTEXT',
+    'gen_tunable' : 'GEN_TUNABLE',
     # M4
     'ifelse' : 'IFELSE',
     'ifndef' : 'IFNDEF',
@@ -518,6 +520,7 @@ def p_policy_stmt(p):
                    | range_transition_def
                    | role_transition_def
                    | bool
+                   | gen_tunable
                    | define
                    | initial_sid
                    | genfscon
@@ -844,6 +847,17 @@ def p_bool(p):
         b.state = False
     p[0] = b
 
+def p_gen_tunable(p):
+    '''gen_tunable : GEN_TUNABLE OPAREN TICK IDENTIFIER SQUOTE COMMA TRUE CPAREN
+                   | GEN_TUNABLE OPAREN TICK IDENTIFIER SQUOTE COMMA FALSE CPAREN'''
+    b = refpolicy.Bool()
+    b.name = p[4]
+    if p[7] == "true":
+        b.state = True
+    else:
+        b.state = False
+    p[0] = b
+
 def p_conditional(p):
     ''' conditional : IF OPAREN cond_expr CPAREN OBRACE interface_stmts CBRACE
                     | IF OPAREN cond_expr CPAREN OBRACE interface_stmts CBRACE ELSE OBRACE interface_stmts CBRACE
-- 
2.27.0

