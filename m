Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 141EE77651C
	for <lists+selinux@lfdr.de>; Wed,  9 Aug 2023 18:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbjHIQbP (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 9 Aug 2023 12:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbjHIQbM (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 9 Aug 2023 12:31:12 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CCF21FF9
        for <selinux@vger.kernel.org>; Wed,  9 Aug 2023 09:31:10 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3a426e70575so4153294b6e.0
        for <selinux@vger.kernel.org>; Wed, 09 Aug 2023 09:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691598669; x=1692203469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chHhdLscKETf/Gevo28yCeGUdA/NXCmqf9Ulries4zE=;
        b=csXTtzGL4pJlzlqwVEOz14Mxte/kv47rjYmHkIKYrd0l48Qj5o5jKyyKXWq5+JBW8u
         63xZggUBPG6vA2ILDwKAZvStHrGpYtlGLuAGBgr91qUPBd/fHyW+pk9bqHEWAa0zr4Sy
         jFK44z6+6gH/8WmA04dqO8MGxbPgBahmgw1ReRXKQyN6+ZVEsOkEne/SU+L0nfMjeZ5p
         nsaX103tL3Z3GyLlsWGpH7jHha7Fps9NNX0SeQ1EEhNFVLg1wnVT3vDeNytjIrQEn2M6
         XYKlEBi2NuDA1gaEIvr4KfSNL3QuZ1WNMnVIjHYMT/mrgVhkpdpdnXAUf/M0ncp1Xm53
         nzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691598669; x=1692203469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chHhdLscKETf/Gevo28yCeGUdA/NXCmqf9Ulries4zE=;
        b=cQW+gcP8K1XxuAHzaQ3LcjNtRbu6OHEaPIu4nMk91kYWzPlvTXhBYgIbUMCilzicvC
         NJW6vSrKKZMD5W2xxvwwwN+6EvSMpWv3JVoUaIcK8sQJP6SqZDE4lBsyHBwtjh6TWhR9
         CVUTZgD+0jivF+l0nZ9VRa4YwSq0N/n6rj6ZBeOk2xxaJ7jA4S/F1RFWhgK/DraCIZ2V
         KbqevJWUO1ZtthrIJwK+MBayLqOaBPDAK6HYDgHpHe3dnXuCXYT8TiDy4uFkjrNpWrFD
         F6fIX/m0xlkX8gFT4e9q8g2KLPeKSkRgJRoxSYvzP6qXsbW7YytgrGbf1UE6t++I3Eil
         XNDA==
X-Gm-Message-State: AOJu0Yyv7SuxqLBqfTTOlosAFSO1q+NXFIbbat5TkPZSrbLQzsU+CVDA
        QloiC6eaqy4A4/9vJ9tbK+fQUpGGF+w=
X-Google-Smtp-Source: AGHT+IFgt5KfosrnEtkXOoP3Otyeg0zrzbK1vlJBZdH7xb4Nq+dKepezcwu6P/Jne0ixbLzrRxI5ng==
X-Received: by 2002:a05:6808:a1c:b0:3a7:72e2:f6be with SMTP id n28-20020a0568080a1c00b003a772e2f6bemr3016461oij.2.1691598669041;
        Wed, 09 Aug 2023 09:31:09 -0700 (PDT)
Received: from electric.. (c-73-172-54-2.hsd1.md.comcast.net. [73.172.54.2])
        by smtp.gmail.com with ESMTPSA id l7-20020a0ce507000000b0063d2ea55018sm4609570qvm.125.2023.08.09.09.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 09:31:08 -0700 (PDT)
From:   James Carter <jwcart2@gmail.com>
To:     selinux@vger.kernel.org
Cc:     plautrba@redhat.com, James Carter <jwcart2@gmail.com>
Subject: [PATCH 07/12] mcstrans: Remove the Russian translations
Date:   Wed,  9 Aug 2023 12:30:52 -0400
Message-ID: <20230809163059.97671-7-jwcart2@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809163059.97671-1-jwcart2@gmail.com>
References: <20230809163059.97671-1-jwcart2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLY,MIXED_ES,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The Russian translations have not been maintained and are out of
date, so remove them.

Suggested-by: Petr Lautrbach <plautrba@redhat.com>
Signed-off-by: James Carter <jwcart2@gmail.com>
---
 mcstrans/man/ru/man5/setrans.conf.5 | 106 ----------------------------
 mcstrans/man/ru/man8/mcs.8          |  24 -------
 mcstrans/man/ru/man8/mcstransd.8    |  32 ---------
 3 files changed, 162 deletions(-)
 delete mode 100644 mcstrans/man/ru/man5/setrans.conf.5
 delete mode 100644 mcstrans/man/ru/man8/mcs.8
 delete mode 100644 mcstrans/man/ru/man8/mcstransd.8

diff --git a/mcstrans/man/ru/man5/setrans.conf.5 b/mcstrans/man/ru/man5/set=
rans.conf.5
deleted file mode 100644
index 724b206b..00000000
--- a/mcstrans/man/ru/man5/setrans.conf.5
+++ /dev/null
@@ -1,106 +0,0 @@
-.TH "setrans.conf" "5" "13 =D0=B8=D1=8E=D0=BB=D1=8F 2010" "txtoth@gmail.co=
m" "=D0=94=D0=BE=D0=BA=D1=83=D0=BC=D0=B5=D0=BD=D1=82=D0=B0=D1=86=D0=B8=D1=
=8F =D0=BF=D0=BE setrans.conf"
-.SH "=D0=98=D0=9C=D0=AF"
-setrans.conf \- =D1=84=D0=B0=D0=B9=D0=BB =D0=BA=D0=BE=D0=BD=D1=84=D0=B8=D0=
=B3=D1=83=D1=80=D0=B0=D1=86=D0=B8=D0=B8 =D0=BF=D1=80=D0=B5=D0=BE=D0=B1=D1=
=80=D0=B0=D0=B7=D0=BE=D0=B2=D0=B0=D0=BD=D0=B8=D1=8F =D0=B4=D0=BB=D1=8F =D1=
=81=D0=B8=D1=81=D1=82=D0=B5=D0=BC MCS/MLS SELinux
-
-.SH "=D0=9E=D0=9F=D0=98=D0=A1=D0=90=D0=9D=D0=98=D0=95"
-=D0=A4=D0=B0=D0=B9=D0=BB =D0=BA=D0=BE=D0=BD=D1=84=D0=B8=D0=B3=D1=83=D1=80=
=D0=B0=D1=86=D0=B8=D0=B8
-.I /etc/selinux/{SELINUXTYPE}/setrans.conf
-=D0=BE=D0=BF=D1=80=D0=B5=D0=B4=D0=B5=D0=BB=D1=8F=D0=B5=D1=82 =D1=81=D0=BF=
=D0=BE=D1=81=D0=BE=D0=B1, =D0=BA=D0=BE=D1=82=D0=BE=D1=80=D1=8B=D0=BC =D0=BC=
=D0=B5=D1=82=D0=BA=D0=B8 SELinux MCS/MLS =D0=BF=D1=80=D0=B5=D0=BE=D0=B1=D1=
=80=D0=B0=D0=B7=D0=BE=D0=B2=D1=8B=D0=B2=D0=B0=D1=8E=D1=82=D1=81=D1=8F =D0=
=B2 =D1=83=D0=B4=D0=BE=D0=B1=D0=BD=D1=83=D1=8E =D0=B4=D0=BB=D1=8F =D0=BF=D1=
=80=D0=BE=D1=87=D1=82=D0=B5=D0=BD=D0=B8=D1=8F =D1=87=D0=B5=D0=BB=D0=BE=D0=
=B2=D0=B5=D0=BA=D0=BE=D0=BC =D1=84=D0=BE=D1=80=D0=BC=D1=83 =D1=81 =D0=BF=D0=
=BE=D0=BC=D0=BE=D1=89=D1=8C=D1=8E =D0=B2=D0=BD=D1=83=D1=82=D1=80=D0=B5=D0=
=BD=D0=BD=D0=B5=D0=B9 =D1=81=D0=BB=D1=83=D0=B6=D0=B1=D1=8B mcstransd. =D0=
=9F=D0=BE=D0=BB=D0=B8=D1=82=D0=B8=D0=BA=D0=B8 =D0=BF=D0=BE =D1=83=D0=BC=D0=
=BE=D0=BB=D1=87=D0=B0=D0=BD=D0=B8=D1=8E =D0=BF=D0=BE=D0=B4=D0=B4=D0=B5=D1=
=80=D0=B6=D0=B8=D0=B2=D0=B0=D1=8E=D1=82 16 =D1=83=D1=80=D0=BE=D0=B2=D0=BD=
=D0=B5=D0=B9 =D0=BA=D0=BE=D0=BD=D1=84=D0=B8=D0=B4=D0=B5=D0=BD=D1=86=D0=B8=
=D0=B0=D0=BB=D1=8C=D0=BD=D0=BE=D1=81=D1=82=D0=B8 (=D0=BE=D1=82 s0 =D0=B4=D0=
=BE s15) =D0=B8 1024 =D0=BA=D0=B0=D1=82=D0=B5=D0=B3=D0=BE=D1=80=D0=B8=D0=B8=
 (=D0=BE=D1=82 c0 =D0=B4=D0=BE c1023). =D0=95=D1=81=D0=BB=D0=B8 =D0=BA=D0=
=B0=D1=82=D0=B5=D0=B3=D0=BE=D1=80=D0=B8=D0=B9 =D0=BD=D0=B5=D1=81=D0=BA=D0=
=BE=D0=BB=D1=8C=D0=BA=D0=BE, =D0=B8=D1=85 =D0=BC=D0=BE=D0=B6=D0=BD=D0=BE =
=D1=80=D0=B0=D0=B7=D0=B4=D0=B5=D0=BB=D0=B8=D1=82=D1=8C =D0=B7=D0=B0=D0=BF=
=D1=8F=D1=82=D1=8B=D0=BC=D0=B8 (c0,c1,c3,c5), =D0=B0 =D0=B4=D0=B8=D0=B0=D0=
=BF=D0=B0=D0=B7=D0=BE=D0=BD =D0=BA=D0=B0=D1=82=D0=B5=D0=B3=D0=BE=D1=80=D0=
=B8=D0=B9 - =D1=81=D0=BE=D0=BA=D1=80=D0=B0=D1=82=D0=B8=D1=82=D1=8C =D1=81 =
=D0=BF=D0=BE=D0=BC=D0=BE=D1=89=D1=8C=D1=8E =D1=83=D0=BA=D0=B0=D0=B7=D0=B0=
=D0=BD=D0=B8=D1=8F =D1=87=D0=B5=D1=80=D0=B5=D0=B7 =D1=82=D0=BE=D1=87=D0=BA=
=D1=83 (c0.c3,c5).
-
-.SS "=D0=9A=D0=BB=D1=8E=D1=87=D0=B5=D0=B2=D1=8B=D0=B5 =D1=81=D0=BB=D0=BE=
=D0=B2=D0=B0"
-
-.TP
-Base\fR
-=D0=BA=D0=BE=D0=B3=D0=B4=D0=B0 =D0=BE=D0=B1=D1=8A=D1=8F=D0=B2=D0=BB=D1=8F=
=D0=B5=D1=82=D1=81=D1=8F =D0=B1=D0=B0=D0=B7=D0=B0, =D0=BA=D0=BE =D0=B2=D1=
=81=D0=B5=D0=BC =D0=BF=D0=BE=D1=81=D0=BB=D0=B5=D0=B4=D1=83=D1=8E=D1=89=D0=
=B8=D0=BC =D0=BE=D0=BF=D1=80=D0=B5=D0=B4=D0=B5=D0=BB=D0=B5=D0=BD=D0=B8=D1=
=8F=D0=BC =D0=BC=D0=B5=D1=82=D0=BE=D0=BA =D0=BA=D0=BE=D0=BD=D1=84=D0=B8=D0=
=B4=D0=B5=D0=BD=D1=86=D0=B8=D0=B0=D0=BB=D1=8C=D0=BD=D0=BE=D1=81=D1=82=D0=B8=
 =D0=B1=D1=83=D0=B4=D1=83=D1=82 =D0=BF=D1=80=D0=B8 =D0=BF=D1=80=D0=B5=D0=BE=
=D0=B1=D1=80=D0=B0=D0=B7=D0=BE=D0=B2=D0=B0=D0=BD=D0=B8=D0=B8 =D0=BF=D1=80=
=D0=B8=D0=BC=D0=B5=D0=BD=D1=8F=D1=82=D1=8C=D1=81=D1=8F =D0=BC=D0=BE=D0=B4=
=D0=B8=D1=84=D0=B8=D0=BA=D0=B0=D1=82=D0=BE=D1=80=D1=8B.
-=D0=9C=D0=B5=D1=82=D0=BA=D0=B8 =D0=BA=D0=BE=D0=BD=D1=84=D0=B8=D0=B4=D0=B5=
=D0=BD=D1=86=D0=B8=D0=B0=D0=BB=D1=8C=D0=BD=D0=BE=D1=81=D1=82=D0=B8, =D0=BA=
=D0=BE=D1=82=D0=BE=D1=80=D1=8B=D0=B5 =D0=B1=D1=8B=D0=BB=D0=B8 =D0=BE=D0=BF=
=D1=80=D0=B5=D0=B4=D0=B5=D0=BB=D0=B5=D0=BD=D1=8B =D0=B4=D0=BE =D0=BE=D0=B1=
=D1=8A=D1=8F=D0=B2=D0=BB=D0=B5=D0=BD=D0=B8=D1=8F =D0=B1=D0=B0=D0=B7=D1=8B, =
=D0=BD=D0=B5=D0=B7=D0=B0=D0=BC=D0=B5=D0=B4=D0=BB=D0=B8=D1=82=D0=B5=D0=BB=D1=
=8C=D0=BD=D0=BE =D0=BA=D1=8D=D1=88=D0=B8=D1=80=D1=83=D1=8E=D1=82=D1=81=D1=
=8F, =D0=B8 =D0=BA =D0=BD=D0=B8=D0=BC =D0=BD=D0=B5 =D0=BF=D1=80=D0=B8=D0=BC=
=D0=B5=D0=BD=D1=8F=D1=8E=D1=82=D1=81=D1=8F =D0=BC=D0=BE=D0=B4=D0=B8=D1=84=
=D0=B8=D0=BA=D0=B0=D1=82=D0=BE=D1=80=D1=8B; =D0=BE=D0=BD=D0=B8 =D0=B8=D1=81=
=D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D1=83=D1=8E=D1=82=D1=81=D1=8F =D0=B2 =D0=BA=
=D0=B0=D1=87=D0=B5=D1=81=D1=82=D0=B2=D0=B5 =D0=BF=D1=80=D1=8F=D0=BC=D0=BE=
=D0=B3=D0=BE =D0=BF=D1=80=D0=B5=D0=BE=D0=B1=D1=80=D0=B0=D0=B7=D0=BE=D0=B2=
=D0=B0=D0=BD=D0=B8=D1=8F.=20
-
-.TP
-Default\fR
-=D0=BE=D0=BF=D1=80=D0=B5=D0=B4=D0=B5=D0=BB=D1=8F=D0=B5=D1=82 =D0=B1=D0=B8=
=D1=82=D0=BE=D0=B2=D1=8B=D0=B9 =D0=B4=D0=B8=D0=B0=D0=BF=D0=B0=D0=B7=D0=BE=
=D0=BD =D0=BA=D0=B0=D1=82=D0=B5=D0=B3=D0=BE=D1=80=D0=B8=D0=B9, =D0=BA=D0=BE=
=D1=82=D0=BE=D1=80=D1=8B=D0=B9 =D0=B1=D1=83=D0=B4=D0=B5=D1=82 =D0=B8=D1=81=
=D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=B0=D1=82=D1=8C=D1=81=D1=8F =
=D0=B4=D0=BB=D1=8F =D0=BE=D0=B1=D1=80=D0=B0=D1=82=D0=BD=D1=8B=D1=85 =D0=B1=
=D0=B8=D1=82=D0=BE=D0=B2.
-
-.TP
-Domain\fR
-=D1=81=D0=BE=D0=B7=D0=B4=D0=B0=D1=91=D1=82 =D0=BD=D0=BE=D0=B2=D1=8B=D0=B9 =
=D0=B4=D0=BE=D0=BC=D0=B5=D0=BD =D1=81 =D1=83=D0=BA=D0=B0=D0=B7=D0=B0=D0=BD=
=D0=BD=D1=8B=D0=BC =D0=B8=D0=BC=D0=B5=D0=BD=D0=B5=D0=BC.
-
-.TP
-Include\fR
-=D0=BF=D1=80=D0=BE=D1=87=D0=B8=D1=82=D0=B0=D1=82=D1=8C =D0=B8 =D0=BE=D0=B1=
=D1=80=D0=B0=D0=B1=D0=BE=D1=82=D0=B0=D1=82=D1=8C =D1=81=D0=BE=D0=B4=D0=B5=
=D1=80=D0=B6=D0=B8=D0=BC=D0=BE=D0=B5 =D1=83=D0=BA=D0=B0=D0=B7=D0=B0=D0=BD=
=D0=BD=D0=BE=D0=B3=D0=BE =D1=84=D0=B0=D0=B9=D0=BB=D0=B0 =D0=BA=D0=BE=D0=BD=
=D1=84=D0=B8=D0=B3=D1=83=D1=80=D0=B0=D1=86=D0=B8=D0=B8.
-
-.TP
-Join\fR
-=D0=BE=D0=BF=D1=80=D0=B5=D0=B4=D0=B5=D0=BB=D1=8F=D0=B5=D1=82 =D1=81=D0=B8=
=D0=BC=D0=B2=D0=BE=D0=BB, =D0=BA=D0=BE=D1=82=D0=BE=D1=80=D1=8B=D0=B9 =D0=B8=
=D1=81=D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D1=83=D0=B5=D1=82=D1=81=D1=8F =D0=B4=
=D0=BB=D1=8F =D1=80=D0=B0=D0=B7=D0=B4=D0=B5=D0=BB=D0=B5=D0=BD=D0=B8=D1=8F =
=D1=83=D1=87=D0=B0=D1=81=D1=82=D0=BD=D0=B8=D0=BA=D0=BE=D0=B2 =D0=B3=D1=80=
=D1=83=D0=BF=D0=BF=D1=8B =D0=BC=D0=BE=D0=B4=D0=B8=D1=84=D0=B8=D0=BA=D0=B0=
=D1=82=D0=BE=D1=80=D0=BE=D0=B2, =D0=BA=D0=BE=D0=B3=D0=B4=D0=B0 =D1=83=D0=BA=
=D0=B0=D0=B7=D0=B0=D0=BD=D0=BE =D0=B1=D0=BE=D0=BB=D0=B5=D0=B5 =D0=BE=D0=B4=
=D0=BD=D0=BE=D0=B3=D0=BE (=D0=BD=D0=B0=D0=BF=D1=80=D0=B8=D0=BC=D0=B5=D1=80,=
 USA/AUS).
-
-.TP
-ModifierGroup\fR
-=D1=81=D1=80=D0=B5=D0=B4=D1=81=D1=82=D0=B2=D0=BE =D0=B3=D1=80=D1=83=D0=BF=
=D0=BF=D0=B8=D1=80=D0=BE=D0=B2=D0=BA=D0=B8 =D0=B1=D0=B8=D1=82=D0=BE=D0=B2=
=D1=8B=D1=85 =D0=BE=D0=BF=D1=80=D0=B5=D0=B4=D0=B5=D0=BB=D0=B5=D0=BD=D0=B8=
=D0=B9 =D0=BA=D0=B0=D1=82=D0=B5=D0=B3=D0=BE=D1=80=D0=B8=D0=B9 =D0=BF=D0=BE =
=D1=82=D0=BE=D0=BC=D1=83, =D0=BA=D0=B0=D0=BA =D0=BE=D0=BD=D0=B8 =D0=B8=D0=
=B7=D0=BC=D0=B5=D0=BD=D1=8F=D1=8E=D1=82 =D0=BC=D0=B5=D1=82=D0=BA=D1=83 =D0=
=BA=D0=BE=D0=BD=D1=84=D0=B8=D0=B4=D0=B5=D0=BD=D1=86=D0=B8=D0=B0=D0=BB=D1=8C=
=D0=BD=D0=BE=D1=81=D1=82=D0=B8.
-
-.TP
-Prefix\fR
-=D1=81=D0=BB=D0=BE=D0=B2=D0=B0 (=D1=81=D0=BB=D0=BE=D0=B2=D0=B0), =D0=BA=D0=
=BE=D1=82=D0=BE=D1=80=D0=BE=D0=B5 =D0=BC=D0=BE=D0=B6=D0=B5=D1=82 =D0=BF=D1=
=80=D0=B5=D0=B4=D1=88=D0=B5=D1=81=D1=82=D0=B2=D0=BE=D0=B2=D0=B0=D1=82=D1=8C=
 =D1=83=D1=87=D0=B0=D1=81=D1=82=D0=BD=D0=B8=D0=BA=D1=83 (=D1=83=D1=87=D0=B0=
=D1=81=D1=82=D0=BD=D0=B8=D0=BA=D0=B0=D0=BC) =D0=B3=D1=80=D1=83=D0=BF=D0=BF=
=D1=8B =D0=BC=D0=BE=D0=B4=D0=B8=D1=84=D0=B8=D0=BA=D0=B0=D1=82=D0=BE=D1=80=
=D0=BE=D0=B2 (=D0=BD=D0=B0=D0=BF=D1=80=D0=B8=D0=BC=D0=B5=D1=80, REL USA).
-
-.TP
-Suffix\fR
-=D1=81=D0=BB=D0=BE=D0=B2=D0=BE (=D1=81=D0=BB=D0=BE=D0=B2=D0=B0), =D0=BA=D0=
=BE=D1=82=D0=BE=D1=80=D0=BE=D0=B5 =D0=BC=D0=BE=D0=B6=D0=B5=D1=82 =D1=81=D0=
=BB=D0=B5=D0=B4=D0=BE=D0=B2=D0=B0=D1=82=D1=8C =D0=B7=D0=B0 =D1=83=D1=87=D0=
=B0=D1=81=D1=82=D0=BD=D0=B8=D0=BA=D0=BE=D0=BC (=D1=83=D1=87=D0=B0=D1=81=D1=
=82=D0=BD=D0=B8=D0=BA=D0=B0=D0=BC=D0=B8) =D0=B3=D1=80=D1=83=D0=BF=D0=BF=D1=
=8B =D0=BC=D0=BE=D0=B4=D0=B8=D1=84=D0=B8=D0=BA=D0=B0=D1=82=D0=BE=D1=80=D0=
=BE=D0=B2 (=D0=BD=D0=B0=D0=BF=D1=80=D0=B8=D0=BC=D0=B5=D1=80, USA EYES ONLY).
-
-.TP
-Whitespace\fR
-=D0=BE=D0=BF=D1=80=D0=B5=D0=B4=D0=B5=D0=BB=D1=8F=D0=B5=D1=82 =D0=BD=D0=B0=
=D0=B1=D0=BE=D1=80 =D0=B4=D0=BE=D0=BF=D1=83=D1=81=D1=82=D0=B8=D0=BC=D1=8B=
=D1=85 =D0=BF=D1=80=D0=BE=D0=B1=D0=B5=D0=BB=D1=8C=D0=BD=D1=8B=D1=85 =D1=81=
=D0=B8=D0=BC=D0=B2=D0=BE=D0=BB=D0=BE=D0=B2, =D0=BA=D0=BE=D1=82=D0=BE=D1=80=
=D1=8B=D0=B5 =D0=BC=D0=BE=D0=B3=D1=83=D1=82 =D0=B8=D1=81=D0=BF=D0=BE=D0=BB=
=D1=8C=D0=B7=D0=BE=D0=B2=D0=B0=D1=82=D1=8C=D1=81=D1=8F =D0=B2 =D0=BF=D1=80=
=D0=B5=D0=BE=D0=B1=D1=80=D0=B0=D0=B7=D0=BE=D0=B2=D1=8B=D0=B2=D0=B0=D0=B5=D0=
=BC=D0=BE=D0=B9 =D0=BC=D0=B5=D1=82=D0=BA=D0=B5.
-
-.SS "=D0=9F=D1=80=D0=B8=D0=BC=D0=B5=D1=80=D1=8B =D0=BE=D0=BF=D1=80=D0=B5=
=D0=B4=D0=B5=D0=BB=D0=B5=D0=BD=D0=B8=D1=8F =D1=83=D1=80=D0=BE=D0=B2=D0=BD=
=D1=8F =D0=BA=D0=BE=D0=BD=D1=84=D0=B8=D0=B4=D0=B5=D0=BD=D1=86=D0=B8=D0=B0=
=D0=BB=D1=8C=D0=BD=D0=BE=D1=81=D1=82=D0=B8"
-
-.TP=20
-s0=3DSystemLow\fR
-=D0=BE=D0=BF=D1=80=D0=B5=D0=B4=D0=B5=D0=BB=D1=8F=D0=B5=D1=82 =D0=BF=D1=80=
=D0=B5=D0=BE=D0=B1=D1=80=D0=B0=D0=B7=D0=BE=D0=B2=D0=B0=D0=BD=D0=B8=D0=B5 s0=
 (=D0=BC=D0=B8=D0=BD=D0=B8=D0=BC=D0=B0=D0=BB=D1=8C=D0=BD=D0=BE=D0=B3=D0=BE =
=D1=83=D1=80=D0=BE=D0=B2=D0=BD=D1=8F =D0=BA=D0=BE=D0=BD=D1=84=D0=B8=D0=B4=
=D0=B5=D0=BD=D1=86=D0=B8=D0=B0=D0=BB=D1=8C=D0=BD=D0=BE=D1=81=D1=82=D0=B8) =
=D0=B1=D0=B5=D0=B7 =D0=BA=D0=B0=D1=82=D0=B5=D0=B3=D0=BE=D1=80=D0=B8=D0=B9 =
=D0=B2 SystemLow.
-
-.TP=20
-s15:c0.c1023=3DSystemHigh\fR
-=D0=BE=D0=BF=D1=80=D0=B5=D0=B4=D0=B5=D0=BB=D1=8F=D0=B5=D1=82 =D0=BF=D1=80=
=D0=B5=D0=BE=D0=B1=D1=80=D0=B0=D0=B7=D0=BE=D0=B2=D0=B0=D0=BD=D0=B8=D0=B5 s1=
5:c0.c1023 =D0=B2 SystemHigh. c0.c1023 - =D1=81=D0=BE=D0=BA=D1=80=D0=B0=D1=
=89=D1=91=D0=BD=D0=BD=D0=BE=D0=B5 =D0=BE=D0=B1=D0=BE=D0=B7=D0=BD=D0=B0=D1=
=87=D0=B5=D0=BD=D0=B8=D0=B5 =D0=B2=D1=81=D0=B5=D1=85 =D0=BA=D0=B0=D1=82=D0=
=B5=D0=B3=D0=BE=D1=80=D0=B8=D0=B9. =D0=A3=D1=80=D0=BE=D0=B2=D0=B5=D0=BD=D1=
=8C =D0=BA=D0=BE=D0=BD=D1=84=D0=B8=D0=B4=D0=B5=D0=BD=D1=86=D0=B8=D0=B0=D0=
=BB=D1=8C=D0=BD=D0=BE=D1=81=D1=82=D0=B8 =D0=B8 =D0=BA=D0=B0=D1=82=D0=B5=D0=
=B3=D0=BE=D1=80=D0=B8=D0=B8 =D1=80=D0=B0=D0=B7=D0=B4=D0=B5=D0=BB=D0=B5=D0=
=BD=D1=8B =D0=B4=D0=B2=D0=BE=D0=B5=D1=82=D0=BE=D1=87=D0=B8=D0=B5=D0=BC.
-
-.TP=20
-s0\-s15:c0.c1023=3DSystemLow\-SystemHigh\fR
-=D0=BE=D0=BF=D1=80=D0=B5=D0=B4=D0=B5=D0=BB=D1=8F=D0=B5=D1=82 =D0=BF=D1=80=
=D0=B5=D0=BE=D0=B1=D1=80=D0=B0=D0=B7=D0=BE=D0=B2=D0=B0=D0=BD=D0=B8=D0=B5 =
=D0=B4=D0=B8=D0=B0=D0=BF=D0=B0=D0=B7=D0=BE=D0=BD=D0=B0 s0\-s15:c0.c1023 =D0=
=B2 SystemLow\-SystemHigh. =D0=94=D0=B2=D0=B0 =D0=BA=D0=BE=D0=BC=D0=BF=D0=
=BE=D0=BD=D0=B5=D0=BD=D1=82=D0=B0 =D0=B4=D0=B8=D0=B0=D0=BF=D0=B0=D0=B7=D0=
=BE=D0=BD=D0=B0 =D1=80=D0=B0=D0=B7=D0=B4=D0=B5=D0=BB=D0=B5=D0=BD=D1=8B =D0=
=B4=D0=B5=D1=84=D0=B8=D1=81=D0=BE=D0=BC.
-
-.TP=20
-s0:c0=3DPatientRecord\fR
-=D0=BE=D0=BF=D1=80=D0=B5=D0=B4=D0=B5=D0=BB=D1=8F=D0=B5=D1=82 =D0=BF=D1=80=
=D0=B5=D0=BE=D0=B1=D1=80=D0=B0=D0=B7=D0=BE=D0=B2=D0=B0=D0=BD=D0=B8=D0=B5 =
=D1=83=D1=80=D0=BE=D0=B2=D0=BD=D1=8F =D0=BA=D0=BE=D0=BD=D1=84=D0=B8=D0=B4=
=D0=B5=D0=BD=D1=86=D0=B8=D0=B0=D0=BB=D1=8C=D0=BD=D0=BE=D1=81=D1=82=D0=B8 s0=
 =D1=81 =D0=BA=D0=B0=D1=82=D0=B5=D0=B3=D0=BE=D1=80=D0=B8=D0=B5=D0=B9 c0 =D0=
=B2 PatientRecord.
-
-.TP=20
-s0:c1=3DAccounting\fR
-=D0=BE=D0=BF=D1=80=D0=B5=D0=B4=D0=B5=D0=BB=D1=8F=D0=B5=D1=82 =D0=BF=D1=80=
=D0=B5=D0=BE=D0=B1=D1=80=D0=B0=D0=B7=D0=BE=D0=B2=D0=B0=D0=BD=D0=B8=D0=B5 =
=D1=83=D1=80=D0=BE=D0=B2=D0=BD=D1=8F =D0=BA=D0=BE=D0=BD=D1=84=D0=B8=D0=B4=
=D0=B5=D0=BD=D1=86=D0=B8=D0=B0=D0=BB=D1=8C=D0=BD=D0=BE=D1=81=D1=82=D0=B8 s0=
 =D1=81 =D0=BA=D0=B0=D1=82=D0=B5=D0=B3=D0=BE=D1=80=D0=B8=D0=B5=D0=B9 c1 =D0=
=B2 Accounting.
-
-.TP=20
-s2:c1,c2,c3=3DConfidential3Categories
-.TP=20
-s2:c1.c3=3DConfidential3Categories\fR
-=D0=B8 =D1=82=D0=BE, =D0=B8 =D0=B4=D1=80=D1=83=D0=B3=D0=BE=D0=B5 =D0=BE=D0=
=BF=D1=80=D0=B5=D0=B4=D0=B5=D0=BB=D1=8F=D0=B5=D1=82 =D0=BF=D1=80=D0=B5=D0=
=BE=D0=B1=D1=80=D0=B0=D0=B7=D0=BE=D0=B2=D0=B0=D0=BD=D0=B8=D0=B5 =D1=83=D1=
=80=D0=BE=D0=B2=D0=BD=D1=8F =D0=BA=D0=BE=D0=BD=D1=84=D0=B8=D0=B4=D0=B5=D0=
=BD=D1=86=D0=B8=D0=B0=D0=BB=D1=8C=D0=BD=D0=BE=D1=81=D1=82=D0=B8 s2 =D1=81 =
=D0=BA=D0=B0=D1=82=D0=B5=D0=B3=D0=BE=D1=80=D0=B8=D1=8F=D0=BC=D0=B8 c1, c2 =
=D0=B8 c3 =D0=B2 Confidential3Categories.
-
-.TP=20
-s5=3DTopSecret\fR
-=D0=BE=D0=BF=D1=80=D0=B5=D0=B4=D0=B5=D0=BB=D1=8F=D0=B5=D1=82 =D0=BF=D1=80=
=D0=B5=D0=BE=D0=B1=D1=80=D0=B0=D0=B7=D0=BE=D0=B2=D0=B0=D0=BD=D0=B8=D0=B5 =
=D1=83=D1=80=D0=BE=D0=B2=D0=BD=D1=8F =D0=BA=D0=BE=D0=BD=D1=84=D0=B8=D0=B4=
=D0=B5=D0=BD=D1=86=D0=B8=D0=B0=D0=BB=D1=8C=D0=BD=D0=BE=D1=81=D1=82=D0=B8 s5=
 =D0=B1=D0=B5=D0=B7 =D0=BA=D0=B0=D1=82=D0=B5=D0=B3=D0=BE=D1=80=D0=B8=D0=B9 =
=D0=B2 TopSecret.
-
-.SS "=D0=9F=D1=80=D0=B8=D0=BC=D0=B5=D1=80=D1=8B =D0=BE=D0=B3=D1=80=D0=B0=
=D0=BD=D0=B8=D1=87=D0=B5=D0=BD=D0=B8=D1=8F"
-
-.TP
-c0!c1
-=D0=B5=D1=81=D0=BB=D0=B8 =D0=BE=D0=B4=D0=BD=D0=BE=D0=B2=D1=80=D0=B5=D0=BC=
=D0=B5=D0=BD=D0=BD=D0=BE =D0=B7=D0=B0=D0=B4=D0=B0=D0=BD=D1=8B =D0=B1=D0=B8=
=D1=82=D1=8B =D0=BA=D0=B0=D1=82=D0=B5=D0=B3=D0=BE=D1=80=D0=B8=D0=B9 0 =D0=
=B8 1, =D0=BE=D0=B3=D1=80=D0=B0=D0=BD=D0=B8=D1=87=D0=B5=D0=BD=D0=B8=D0=B5 =
=D0=BD=D0=B5 =D1=81=D1=80=D0=B0=D0=B1=D0=BE=D1=82=D0=B0=D0=B5=D1=82 =D0=B8 =
=D0=B1=D1=83=D0=B4=D0=B5=D1=82 =D0=B2=D0=BE=D0=B7=D0=B2=D1=80=D0=B0=D1=89=
=D1=91=D0=BD =D0=B8=D1=81=D1=85=D0=BE=D0=B4=D0=BD=D1=8B=D0=B9 =D0=BA=D0=BE=
=D0=BD=D1=82=D0=B5=D0=BA=D1=81=D1=82.
-
-.TP
-c5.c9>c1
-=D0=B5=D1=81=D0=BB=D0=B8 =D0=B7=D0=B0=D0=B4=D0=B0=D0=BD=D1=8B =D0=B1=D0=B8=
=D1=82=D1=8B =D0=BA=D0=B0=D1=82=D0=B5=D0=B3=D0=BE=D1=80=D0=B8=D0=B9 =D1=81 =
5 =D0=BF=D0=BE 9, =D0=B1=D0=B8=D1=82 1 =D1=82=D0=B0=D0=BA=D0=B6=D0=B5 =D0=
=BD=D0=B5=D0=BE=D0=B1=D1=85=D0=BE=D0=B4=D0=B8=D0=BC=D0=BE =D1=83=D1=81=D1=
=82=D0=B0=D0=BD=D0=BE=D0=B2=D0=B8=D1=82=D1=8C - =D0=B8=D0=BD=D0=B0=D1=87=D0=
=B5 =D0=BE=D0=B3=D1=80=D0=B0=D0=BD=D0=B8=D1=87=D0=B5=D0=BD=D0=B8=D0=B5 =D0=
=BD=D0=B5 =D1=81=D1=80=D0=B0=D0=B1=D0=BE=D1=82=D0=B0=D0=B5=D1=82 =D0=B8 =D0=
=B1=D1=83=D0=B4=D0=B5=D1=82 =D0=B2=D0=BE=D0=B7=D0=B2=D1=80=D0=B0=D1=89=D1=
=91=D0=BD =D0=B8=D1=81=D1=85=D0=BE=D0=B4=D0=BD=D1=8B=D0=B9 =D0=BA=D0=BE=D0=
=BD=D1=82=D0=B5=D0=BA=D1=81=D1=82.
-
-.TP
-s1!c5,c9
-=D0=B5=D1=81=D0=BB=D0=B8 =D0=B7=D0=B0=D0=B4=D0=B0=D0=BD=D1=8B =D0=B1=D0=B8=
=D1=82=D1=8B =D0=BA=D0=B0=D1=82=D0=B5=D0=B3=D0=BE=D1=80=D0=B8=D0=B9 =D1=81 =
5 =D0=BF=D0=BE 9 =D0=B8 =D1=83=D1=80=D0=BE=D0=B2=D0=B5=D0=BD=D1=8C =D0=BA=
=D0=BE=D0=BD=D1=84=D0=B8=D0=B4=D0=B5=D0=BD=D1=86=D0=B8=D0=B0=D0=BB=D1=8C=D0=
=BD=D0=BE=D1=81=D1=82=D0=B8 =D1=80=D0=B0=D0=B2=D0=B5=D0=BD s1, =D0=BE=D0=B3=
=D1=80=D0=B0=D0=BD=D0=B8=D1=87=D0=B5=D0=BD=D0=B8=D0=B5 =D0=BD=D0=B5 =D1=81=
=D1=80=D0=B0=D0=B1=D0=BE=D1=82=D0=B0=D0=B5=D1=82 =D0=B8 =D0=B1=D1=83=D0=B4=
=D0=B5=D1=82 =D0=B2=D0=BE=D0=B7=D0=B2=D1=80=D0=B0=D1=89=D1=91=D0=BD =D0=B8=
=D1=81=D1=85=D0=BE=D0=B4=D0=BD=D1=8B=D0=B9 =D0=BA=D0=BE=D0=BD=D1=82=D0=B5=
=D0=BA=D1=81=D1=82.
-
-.SH "=D0=A4=D0=90=D0=99=D0=9B=D0=AB"
-/etc/selinux/{SELINUXTYPE}/setrans.conf
-.br
-/usr/share/mcstrans/examples
-
-.SH "=D0=A1=D0=9C=D0=9E=D0=A2=D0=A0=D0=98=D0=A2=D0=95 =D0=A2=D0=90=D0=9A=
=D0=96=D0=95"
-selinux(8), mcs(8), mls(8), chcon(1)
-
-.SH "=D0=90=D0=92=D0=A2=D0=9E=D0=A0=D0=AB"
-    =D0=9D=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BD=D0=BE Joe Nall <joe@nall.co=
m>.
-    =D0=9E=D0=B1=D0=BD=D0=BE=D0=B2=D0=BB=D0=B5=D0=BD=D0=BE Ted X. Toth <tx=
toth@gmail.com>.
-    =D0=9F=D0=B5=D1=80=D0=B5=D0=B2=D0=BE=D0=B4 =D0=BD=D0=B0 =D1=80=D1=83=
=D1=81=D1=81=D0=BA=D0=B8=D0=B9 =D1=8F=D0=B7=D1=8B=D0=BA =D0=B2=D1=8B=D0=BF=
=D0=BE=D0=BB=D0=BD=D0=B8=D0=BB=D0=B0 =D0=93=D0=B5=D1=80=D0=B0=D1=81=D0=B8=
=D0=BC=D0=B5=D0=BD=D0=BA=D0=BE =D0=9E=D0=BB=D0=B5=D1=81=D1=8F <gammaray@bas=
ealt.ru>.
diff --git a/mcstrans/man/ru/man8/mcs.8 b/mcstrans/man/ru/man8/mcs.8
deleted file mode 100644
index c869ed2c..00000000
--- a/mcstrans/man/ru/man8/mcs.8
+++ /dev/null
@@ -1,24 +0,0 @@
-.TH  "mcs"  "8"  "8 =D1=81=D0=B5=D0=BD=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2005"=
 "dwalsh@redhat.com" "=D0=94=D0=BE=D0=BA=D1=83=D0=BC=D0=B5=D0=BD=D1=82=D0=
=B0=D1=86=D0=B8=D1=8F =D0=BF=D0=BE MCS"
-
-.SH "=D0=98=D0=9C=D0=AF"
-mcs \- =D0=BC=D1=83=D0=BB=D1=8C=D1=82=D0=B8=D0=BA=D0=B0=D1=82=D0=B5=D0=B3=
=D0=BE=D1=80=D0=B8=D0=B9=D0=BD=D0=B0=D1=8F =D1=81=D0=B8=D1=81=D1=82=D0=B5=
=D0=BC=D0=B0
-
-.SH "=D0=9E=D0=9F=D0=98=D0=A1=D0=90=D0=9D=D0=98=D0=95"
-MCS (=D0=BC=D1=83=D0=BB=D1=8C=D1=82=D0=B8=D0=BA=D0=B0=D1=82=D0=B5=D0=B3=D0=
=BE=D1=80=D0=B8=D0=B9=D0=BD=D0=B0=D1=8F =D1=81=D0=B8=D1=81=D1=82=D0=B5=D0=
=BC=D0=B0) =D0=BF=D0=BE=D0=B7=D0=B2=D0=BE=D0=BB=D1=8F=D0=B5=D1=82 =D0=BF=D0=
=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8F=D0=BC =D0=
=BF=D1=80=D0=BE=D1=81=D1=82=D0=B0=D0=B2=D0=BB=D1=8F=D1=82=D1=8C =D0=B2 =D1=
=81=D0=B2=D0=BE=D0=B5=D0=B9 =D1=81=D0=B8=D1=81=D1=82=D0=B5=D0=BC=D0=B5 =D0=
=BC=D0=B5=D1=82=D0=BA=D0=B8 =D0=B4=D0=BB=D1=8F =D1=84=D0=B0=D0=B9=D0=BB=D0=
=BE=D0=B2 =D0=B2=D0=BD=D1=83=D1=82=D1=80=D0=B8 =D0=BE=D0=BF=D1=80=D0=B5=D0=
=B4=D0=B5=D0=BB=D1=91=D0=BD=D0=BD=D1=8B=D1=85 =D0=B0=D0=B4=D0=BC=D0=B8=D0=
=BD=D0=B8=D1=81=D1=82=D1=80=D0=B0=D1=82=D0=BE=D1=80=D0=BE=D0=BC =D0=BA=D0=
=B0=D1=82=D0=B5=D0=B3=D0=BE=D1=80=D0=B8=D0=B9. =D0=97=D0=B0=D1=82=D0=B5=D0=
=BC =D1=8D=D1=82=D0=B0 =D1=81=D0=B8=D1=81=D1=82=D0=B5=D0=BC=D0=B0 =D0=B8=D1=
=81=D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D1=83=D0=B5=D1=82 =D0=BF=D1=80=D0=B8=D0=
=BD=D1=83=D0=B4=D0=B8=D1=82=D0=B5=D0=BB=D1=8C=D0=BD=D0=BE=D0=B5 =D1=83=D0=
=BF=D1=80=D0=B0=D0=B2=D0=BB=D0=B5=D0=BD=D0=B8=D0=B5 =D0=B4=D0=BE=D1=81=D1=
=82=D1=83=D0=BF=D0=BE=D0=BC SELinux, =D1=87=D1=82=D0=BE=D0=B1=D1=8B =D0=B7=
=D0=B0=D1=89=D0=B8=D1=82=D0=B8=D1=82=D1=8C =D1=8D=D1=82=D0=B8 =D1=84=D0=B0=
=D0=B9=D0=BB=D1=8B. MCS - =D0=B4=D0=B8=D1=81=D0=BA=D1=80=D0=B5=D1=86=D0=B8=
=D0=BE=D0=BD=D0=BD=D0=B0=D1=8F =D0=BC=D0=BE=D0=B4=D0=B5=D0=BB=D1=8C, =D0=BA=
=D0=BE=D1=82=D0=BE=D1=80=D0=B0=D1=8F =D0=BF=D0=BE=D0=B7=D0=B2=D0=BE=D0=BB=
=D1=8F=D0=B5=D1=82 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=B0=D1=82=
=D0=B5=D0=BB=D1=8F=D0=BC =D0=BE=D1=82=D0=BC=D0=B5=D1=87=D0=B0=D1=82=D1=8C =
=D1=81=D0=B2=D0=BE=D0=B8 =D0=B4=D0=B0=D0=BD=D0=BD=D1=8B=D0=B5 =D0=B4=D0=BE=
=D0=BF=D0=BE=D0=BB=D0=BD=D0=B8=D1=82=D0=B5=D0=BB=D1=8C=D0=BD=D1=8B=D0=BC=D0=
=B8 =D1=82=D0=B5=D0=B3=D0=B0=D0=BC=D0=B8, =D0=BD=D0=B0=D0=BA=D0=BB=D0=B0=D0=
=B4=D1=8B=D0=B2=D0=B0=D1=8F =D0=B4=D0=B0=D0=BB=D1=8C=D0=BD=D0=B5=D0=B9=D1=
=88=D0=B8=D0=B5 =D0=BE=D0=B3=D1=80=D0=B0=D0=BD=D0=B8=D1=87=D0=B5=D0=BD=D0=
=B8=D1=8F =D0=B4=D0=BE=D1=81=D1=82=D1=83=D0=BF=D0=B0. =D0=9E=D0=B1=D1=8F=D0=
=B7=D0=B0=D1=82=D0=B5=D0=BB=D1=8C=D0=BD=D1=8B=D0=BC =D1=8F=D0=B2=D0=BB=D1=
=8F=D0=B5=D1=82=D1=81=D1=8F =D1=82=D0=BE=D0=BB=D1=8C=D0=BA=D0=BE =D0=BE=D0=
=B4=D0=B8=D0=BD =D0=B0=D1=81=D0=BF=D0=B5=D0=BA=D1=82 - =D0=B0=D0=B2=D1=82=
=D0=BE=D1=80=D0=B8=D0=B7=D0=BE=D0=B2=D1=8B=D0=B2=D0=B0=D1=82=D1=8C =D0=BF=
=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D0=B5=D0=B9 =
=D0=B4=D0=BB=D1=8F =D0=BA=D0=B0=D1=82=D0=B5=D0=B3=D0=BE=D1=80=D0=B8=D0=B9, =
=D0=BE=D0=BF=D1=80=D0=B5=D0=B4=D0=B5=D0=BB=D1=8F=D1=8F =D0=B8=D1=85 =D1=83=
=D1=80=D0=BE=D0=B2=D0=B5=D0=BD=D1=8C =D0=B4=D0=BE=D0=BF=D1=83=D1=81=D0=BA=
=D0=B0 =D0=B2 =D0=BF=D0=BE=D0=BB=D0=B8=D1=82=D0=B8=D0=BA=D0=B5. MCS =D0=BF=
=D0=BE=D1=85=D0=BE=D0=B6=D0=B0 =D0=BD=D0=B0 MLS, =D0=B2=D1=8B=D0=BF=D0=BE=
=D0=BB=D0=BD=D1=8F=D0=B5=D1=82 =D1=82=D0=B5 =D0=B6=D0=B5 =D1=81=D0=B0=D0=BC=
=D1=8B=D0=B5 =D0=BF=D1=83=D1=82=D0=B8 =D0=BA=D0=BE=D0=B4=D0=B0 =D0=B8 =D0=
=B8=D1=81=D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D1=83=D0=B5=D1=82 =D1=82=D1=83 =D0=
=B6=D0=B5 =D1=81=D0=B0=D0=BC=D1=83=D1=8E =D0=B8=D0=BD=D1=84=D1=80=D0=B0=D1=
=81=D1=82=D1=80=D1=83=D0=BA=D1=82=D1=83=D1=80=D1=83 =D0=BF=D0=BE=D0=B4=D0=
=B4=D0=B5=D1=80=D0=B6=D0=BA=D0=B8. =D0=9E=D0=BD=D0=B8 =D0=BE=D1=82=D0=BB=D0=
=B8=D1=87=D0=B0=D1=8E=D1=82=D1=81=D1=8F =D0=BC=D0=B5=D0=B6=D0=B4=D1=83 =D1=
=81=D0=BE=D0=B1=D0=BE=D0=B9 =D1=82=D0=BE=D0=BB=D1=8C=D0=BA=D0=BE =D1=81=D0=
=BF=D0=B5=D1=86=D0=B8=D1=84=D0=B8=D0=BA=D0=BE=D0=B9 =D0=BD=D0=B0=D1=81=D1=
=82=D1=80=D0=BE=D0=B9=D0=BA=D0=B8.
-
-
-=D0=A4=D0=B0=D0=B9=D0=BB =D0=BA=D0=BE=D0=BD=D1=84=D0=B8=D0=B3=D1=83=D1=80=
=D0=B0=D1=86=D0=B8=D0=B8
-.I /etc/selinux/{SELINUXTYPE}/setrans.conf
-=D0=BF=D1=80=D0=B5=D0=BE=D0=B1=D1=80=D0=B0=D0=B7=D0=BE=D0=B2=D1=8B=D0=B2=
=D0=B0=D0=B5=D1=82 =D0=BC=D0=B5=D1=82=D0=BA=D0=B8 =D0=BD=D0=B0 =D0=B4=D0=B8=
=D1=81=D0=BA=D0=B5 =D0=B2 =D1=83=D0=B4=D0=BE=D0=B1=D0=BD=D1=83=D1=8E =D0=B4=
=D0=BB=D1=8F =D0=BF=D1=80=D0=BE=D1=87=D1=82=D0=B5=D0=BD=D0=B8=D1=8F =D1=87=
=D0=B5=D0=BB=D0=BE=D0=B2=D0=B5=D0=BA=D0=BE=D0=BC =D1=84=D0=BE=D1=80=D0=BC=
=D1=83. =D0=92 =D1=8D=D1=82=D0=BE=D0=BC =D1=84=D0=B0=D0=B9=D0=BB=D0=B5 =D0=
=B0=D0=B4=D0=BC=D0=B8=D0=BD=D0=B8=D1=81=D1=82=D1=80=D0=B0=D1=82=D0=BE=D1=80=
=D1=8B =D0=BC=D0=BE=D0=B3=D1=83=D1=82 =D0=BE=D0=BF=D1=80=D0=B5=D0=B4=D0=B5=
=D0=BB=D0=B8=D1=82=D1=8C =D0=BB=D1=8E=D0=B1=D1=8B=D0=B5 =D0=BD=D0=B5=D0=BE=
=D0=B1=D1=85=D0=BE=D0=B4=D0=B8=D0=BC=D1=8B=D0=B5 =D0=BC=D0=B5=D1=82=D0=BA=
=D0=B8.
-=D0=9D=D0=B5=D0=BA=D0=BE=D1=82=D0=BE=D1=80=D1=8B=D0=B5 =D0=BF=D1=80=D0=B8=
=D0=BB=D0=BE=D0=B6=D0=B5=D0=BD=D0=B8=D1=8F, =D1=82=D0=B0=D0=BA=D0=B8=D0=B5 =
=D0=BA=D0=B0=D0=BA =D0=B2=D1=8B=D0=B2=D0=BE=D0=B4 =D0=BD=D0=B0 =D1=8D=D0=BA=
=D1=80=D0=B0=D0=BD =D0=B8 =D0=B0=D1=83=D0=B4=D0=B8=D1=82, =D0=B1=D1=83=D0=
=B4=D1=83=D1=82 =D0=B8=D1=81=D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=
=B0=D1=82=D1=8C =D1=8D=D1=82=D0=B8 =D0=BC=D0=B5=D1=82=D0=BA=D0=B8 =D0=B4=D0=
=BB=D1=8F =D0=B8=D0=B4=D0=B5=D0=BD=D1=82=D0=B8=D1=84=D0=B8=D0=BA=D0=B0=D1=
=86=D0=B8=D0=B8 =D1=84=D0=B0=D0=B9=D0=BB=D0=BE=D0=B2. =D0=95=D1=81=D0=BB=D0=
=B8 =D0=B4=D0=BB=D1=8F =D1=84=D0=B0=D0=B9=D0=BB=D0=B0 =D0=B1=D1=83=D0=B4=D0=
=B5=D1=82 =D0=B7=D0=B0=D0=B4=D0=B0=D0=BD=D0=B0 =D0=BA=D0=B0=D1=82=D0=B5=D0=
=B3=D0=BE=D1=80=D0=B8=D1=8F, =D0=B4=D1=80=D1=83=D0=B3=D0=B8=D0=B5 =D0=BF=D1=
=80=D0=B8=D0=BB=D0=BE=D0=B6=D0=B5=D0=BD=D0=B8=D1=8F/=D1=81=D0=BB=D1=83=D0=
=B6=D0=B1=D1=8B =D0=BD=D0=B5 =D0=BF=D0=BE=D0=BB=D1=83=D1=87=D0=B0=D1=82 =D0=
=BA =D0=BD=D0=B5=D0=BC=D1=83 =D0=B4=D0=BE=D1=81=D1=82=D1=83=D0=BF.
-.P
-=D0=9F=D1=80=D0=B8=D0=BC=D0=B5=D1=80=D1=8B =D0=BC=D0=B5=D1=82=D0=BE=D0=BA =
=D1=84=D0=B0=D0=B9=D0=BB=D0=BE=D0=B2: PatientRecord, CompanyConfidential =
=D0=B8 =D1=82=D0=B0=D0=BA =D0=B4=D0=B0=D0=BB=D0=B5=D0=B5.
-
-.SH "=D0=A1=D0=9C=D0=9E=D0=A2=D0=A0=D0=98=D0=A2=D0=95 =D0=A2=D0=90=D0=9A=
=D0=96=D0=95"
-selinux(8), chcon(1)
-
-.SH =D0=A4=D0=90=D0=99=D0=9B=D0=AB
-/etc/selinux/{SELINUXTYPE}/setrans.conf=20
-
-.SH =D0=90=D0=92=D0=A2=D0=9E=D0=A0=D0=AB
-=D0=9F=D0=B5=D1=80=D0=B5=D0=B2=D0=BE=D0=B4 =D0=BD=D0=B0 =D1=80=D1=83=D1=81=
=D1=81=D0=BA=D0=B8=D0=B9 =D1=8F=D0=B7=D1=8B=D0=BA =D0=B2=D1=8B=D0=BF=D0=BE=
=D0=BB=D0=BD=D0=B8=D0=BB=D0=B0 =D0=93=D0=B5=D1=80=D0=B0=D1=81=D0=B8=D0=BC=
=D0=B5=D0=BD=D0=BA=D0=BE =D0=9E=D0=BB=D0=B5=D1=81=D1=8F <gammaray@basealt.r=
u>
diff --git a/mcstrans/man/ru/man8/mcstransd.8 b/mcstrans/man/ru/man8/mcstra=
nsd.8
deleted file mode 100644
index 4cd68c17..00000000
--- a/mcstrans/man/ru/man8/mcstransd.8
+++ /dev/null
@@ -1,32 +0,0 @@
-.TH "mcstransd" "8" "16 =D0=BE=D0=BA=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2009" "=
dwalsh@redhat.com" "=D0=94=D0=BE=D0=BA=D1=83=D0=BC=D0=B5=D0=BD=D1=82=D0=B0=
=D1=86=D0=B8=D1=8F =D0=BF=D0=BE MCS"
-.SH "=D0=98=D0=9C=D0=AF"
-mcstransd \- =D0=B2=D0=BD=D1=83=D1=82=D1=80=D0=B5=D0=BD=D0=BD=D1=8F=D1=8F =
=D1=81=D0=BB=D1=83=D0=B6=D0=B1=D0=B0 MCS (=D0=BC=D1=83=D0=BB=D1=8C=D1=82=D0=
=B8=D0=BA=D0=B0=D1=82=D0=B5=D0=B3=D0=BE=D1=80=D0=B8=D0=B9=D0=BD=D0=B0=D1=8F=
 =D1=81=D0=B8=D1=81=D1=82=D0=B5=D0=BC=D0=B0). =D0=9F=D0=B5=D1=80=D0=B5=D0=
=B2=D0=BE=D0=B4=D0=B8=D1=82 =D0=BC=D0=B5=D1=82=D0=BA=D0=B8 MCS/MLS SELinux =
=D0=B2 =D1=83=D0=B4=D0=BE=D0=B1=D0=BD=D1=83=D1=8E =D0=B4=D0=BB=D1=8F =D0=BF=
=D1=80=D0=BE=D1=87=D1=82=D0=B5=D0=BD=D0=B8=D1=8F =D1=87=D0=B5=D0=BB=D0=BE=
=D0=B2=D0=B5=D0=BA=D0=BE=D0=BC =D1=84=D0=BE=D1=80=D0=BC=D1=83.
-
-.SH "=D0=9E=D0=91=D0=97=D0=9E=D0=A0"
-.B mcstransd [-f] [-h]
-.P
-
-.SH "=D0=9E=D0=9F=D0=98=D0=A1=D0=90=D0=9D=D0=98=D0=95"
-=D0=AD=D1=82=D0=B0 =D1=81=D1=82=D1=80=D0=B0=D0=BD=D0=B8=D1=86=D0=B0 =D1=80=
=D1=83=D0=BA=D0=BE=D0=B2=D0=BE=D0=B4=D1=81=D1=82=D0=B2=D0=B0 =D1=81=D0=BE=
=D0=B4=D0=B5=D1=80=D0=B6=D0=B8=D1=82 =D0=BE=D0=BF=D0=B8=D1=81=D0=B0=D0=BD=
=D0=B8=D0=B5 =D0=BF=D1=80=D0=BE=D0=B3=D1=80=D0=B0=D0=BC=D0=BC=D1=8B
-.BR mcstransd.
-.P
-=D0=AD=D1=82=D0=B0 =D0=B2=D0=BD=D1=83=D1=82=D1=80=D0=B5=D0=BD=D0=BD=D1=8F=
=D1=8F =D1=81=D0=BB=D1=83=D0=B6=D0=B1=D0=B0 =D0=B2=D1=8B=D0=BF=D0=BE=D0=BB=
=D0=BD=D1=8F=D0=B5=D1=82 =D1=87=D1=82=D0=B5=D0=BD=D0=B8=D0=B5 =D1=84=D0=B0=
=D0=B9=D0=BB=D0=B0 =D0=BA=D0=BE=D0=BD=D1=84=D0=B8=D0=B3=D1=83=D1=80=D0=B0=
=D1=86=D0=B8=D0=B8 /etc/selinux/{SELINUXTYPE}/setrans.conf =D0=B8 =D1=81=D0=
=B2=D1=8F=D0=B7=D1=8B=D0=B2=D0=B0=D0=B5=D1=82=D1=81=D1=8F =D1=81 libselinux=
 =D1=87=D0=B5=D1=80=D0=B5=D0=B7 =D1=81=D0=BE=D0=BA=D0=B5=D1=82 =D0=B2 /var/=
run/setrans.
-.SH "=D0=9F=D0=90=D0=A0=D0=90=D0=9C=D0=95=D0=A2=D0=A0=D0=AB"
-.TP
-\-f
-=D0=97=D0=B0=D0=BF=D1=83=D1=81=D1=82=D0=B8=D1=82=D1=8C mcstransd =D0=BD=D0=
=B0 =D0=BF=D0=B5=D1=80=D0=B5=D0=B4=D0=BD=D0=B5=D0=BC =D0=BF=D0=BB=D0=B0=D0=
=BD=D0=B5. =D0=9D=D0=B5 =D0=B7=D0=B0=D0=BF=D1=83=D1=81=D0=BA=D0=B0=D1=82=D1=
=8C =D0=BA=D0=B0=D0=BA =D0=B2=D0=BD=D1=83=D1=82=D1=80=D0=B5=D0=BD=D0=BD=D1=
=8E=D1=8E =D1=81=D0=BB=D1=83=D0=B6=D0=B1=D1=83.
-.TP
-\-h
-=D0=92=D1=8B=D0=B2=D0=B5=D1=81=D1=82=D0=B8 =D0=BA=D1=80=D0=B0=D1=82=D0=BA=
=D0=BE=D0=B5 =D0=BE=D0=BF=D0=B8=D1=81=D0=B0=D0=BD=D0=B8=D0=B5 =D0=B4=D0=BE=
=D1=81=D1=82=D1=83=D0=BF=D0=BD=D1=8B=D1=85 =D0=BF=D0=B0=D1=80=D0=B0=D0=BC=
=D0=B5=D1=82=D1=80=D0=BE=D0=B2 =D0=BA=D0=BE=D0=BC=D0=B0=D0=BD=D0=B4=D0=BD=
=D0=BE=D0=B9 =D1=81=D1=82=D1=80=D0=BE=D0=BA=D0=B8\&.
-
-.SH "=D0=A4=D0=90=D0=99=D0=9B=D0=AB"
-/etc/selinux/{SELINUXTYPE}/setrans.conf=20
-
-.SH "=D0=A1=D0=9C=D0=9E=D0=A2=D0=A0=D0=98=D0=A2=D0=95 =D0=A2=D0=90=D0=9A=
=D0=96=D0=95"
-.BR setrans.conf (5), mcs (8)
-
-.SH "=D0=90=D0=92=D0=A2=D0=9E=D0=A0=D0=AB"
-=D0=AD=D1=82=D0=B0 man-=D1=81=D1=82=D1=80=D0=B0=D0=BD=D0=B8=D1=86=D0=B0 =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BD=D0=B0 Dan Walsh <dwalsh@redhat.c=
om>.
-=D0=98=D1=81=D1=85=D0=BE=D0=B4=D0=BD=D0=B0=D1=8F =D0=B2=D0=B5=D1=80=D1=81=
=D0=B8=D1=8F =D0=BF=D1=80=D0=BE=D0=B3=D1=80=D0=B0=D0=BC=D0=BC=D1=8B =D0=BD=
=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BD=D0=B0 Dan Walsh <dwalsh@redhat.com>.
-=D0=9F=D1=80=D0=BE=D0=B3=D1=80=D0=B0=D0=BC=D0=BC=D0=B0 =D1=83=D0=BB=D1=83=
=D1=87=D1=88=D0=B5=D0=BD=D0=B0/=D0=BF=D0=B5=D1=80=D0=B5=D0=BF=D0=B8=D1=81=
=D0=B0=D0=BD=D0=B0 Joe Nall <joe@nall.com>.
-=D0=9F=D0=B5=D1=80=D0=B5=D0=B2=D0=BE=D0=B4 =D0=BD=D0=B0 =D1=80=D1=83=D1=81=
=D1=81=D0=BA=D0=B8=D0=B9 =D1=8F=D0=B7=D1=8B=D0=BA =D0=B2=D1=8B=D0=BF=D0=BE=
=D0=BB=D0=BD=D0=B8=D0=BB=D0=B0 =D0=93=D0=B5=D1=80=D0=B0=D1=81=D0=B8=D0=BC=
=D0=B5=D0=BD=D0=BA=D0=BE =D0=9E=D0=BB=D0=B5=D1=81=D1=8F <gammaray@basealt.r=
u>.
--=20
2.41.0

