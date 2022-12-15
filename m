Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5BD64E345
	for <lists+selinux@lfdr.de>; Thu, 15 Dec 2022 22:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiLOVer (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 15 Dec 2022 16:34:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiLOVeq (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 15 Dec 2022 16:34:46 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CA01C437
        for <selinux@vger.kernel.org>; Thu, 15 Dec 2022 13:34:44 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-3b5d9050e48so8363677b3.2
        for <selinux@vger.kernel.org>; Thu, 15 Dec 2022 13:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAPPblvPiFMoNEWyTe0lfFXiSRbNVsbVKoJzLPORELk=;
        b=JUdbW05Ve5rGB4FgJpAvkJrbCQsPKX9aJOuZxpKeP3PSt9k6g+Q3Bomsfjb299RUK1
         hdhv4fokskJakrjc4oCPLgxLprewzPwDuwk+4FikLkXp4CUeDPxTB8nFigWVMRn4mGxG
         E8M25ujwBFi+gvBmWhsSax+NDgCE5t5FMFAHYKttebFRlCj4TVSrteIGMMD0/l/j+sok
         tnrriL2hP5/vr6rK8LOXr4ugCvuuzmFJ363K6btGHcay5Bah1Kw60s+/ZzOwNrTFQrwg
         3Q7zKZLSBYkN85aIdvHV42ZbqEe9fA/CV9YYtOZ3p0oTRxq0F9ndN0MIQtStLqjWFU9Z
         HFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAPPblvPiFMoNEWyTe0lfFXiSRbNVsbVKoJzLPORELk=;
        b=Z3SzfMpGaRxLCw7Bd3KWjJn1zfApzr73A4dcEKz/GhBsHLoTPiul2Nk4BizJFQO2K8
         goyhhrhs7ha7a58hA/tii2VOzkpxwKIr+xPrZWk5E9tlCIKYUGfBgBqig0AZDYS/QHhJ
         sGJffesmlHU+wBoph2e+IbYFeJsZg22PrlMxSsi20pIzaG50AXDY81gpsI08ENrqvqZH
         kkPRfsPT/AlEUiUhi737myLRrunWX5e83zcrQbR8b8kQkoYN4cfaKUo61N7fvWlyA2pw
         MJo+3L1I5YOlBGXw+37Iv825nFNNxtKPSwfPfu+FB09EXuveQ40pCv6jrGFVwdWC/W0N
         eTHw==
X-Gm-Message-State: ANoB5pnjdhVsSwqda8p1m2EFRgLk6SMjrzdTuQCgVf/onv6YtEkViyiL
        BfoBD5Uk6Vkef1FhCbluPVp+lBaJLI4=
X-Google-Smtp-Source: AA0mqf4RXijvRH5vZPrMFFYyac9lQ8nvcGlvhoetVdxfaICcZ0F9zpPvJUPTSu+HvTtO15SC6XBjuA==
X-Received: by 2002:a81:5487:0:b0:3c4:e1ca:e842 with SMTP id i129-20020a815487000000b003c4e1cae842mr12350975ywb.6.1671140083581;
        Thu, 15 Dec 2022 13:34:43 -0800 (PST)
Received: from electric.. (c-73-200-155-132.hsd1.md.comcast.net. [73.200.155.132])
        by smtp.gmail.com with ESMTPSA id w10-20020a05620a424a00b006a6ebde4799sm21066qko.90.2022.12.15.13.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 13:34:43 -0800 (PST)
From:   James Carter <jwcart2@gmail.com>
To:     selinux@vger.kernel.org
Cc:     dburgener@linux.microsoft.com, James Carter <jwcart2@gmail.com>
Subject: [RFC PATCH 8/9] secilc/test: Add a deny rule test
Date:   Thu, 15 Dec 2022 16:34:28 -0500
Message-Id: <20221215213429.998948-9-jwcart2@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221215213429.998948-1-jwcart2@gmail.com>
References: <20221215213429.998948-1-jwcart2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Signed-off-by: James Carter <jwcart2@gmail.com>
---
 secilc/test/deny_rule_test.cil | 384 +++++++++++++++++++++++++++++++++
 1 file changed, 384 insertions(+)
 create mode 100644 secilc/test/deny_rule_test.cil

diff --git a/secilc/test/deny_rule_test.cil b/secilc/test/deny_rule_test.cil
new file mode 100644
index 00000000..3ef4ac98
--- /dev/null
+++ b/secilc/test/deny_rule_test.cil
@@ -0,0 +1,384 @@
+(class CLASS (PERM))
+(class C1 (p1a p1b p1c p1d))
+(class C2 (p2a p2b p2c p2d))
+(class C3 (p3a p3b p3c p3d))
+(class C4 (p4a p4b p4c p4d))
+(classorder (CLASS C1 C2 C3 C4))
+(sid SID)
+(sidorder (SID))
+(user USER)
+(role ROLE)
+(type TYPE)
+(category CAT)
+(categoryorder (CAT))
+(sensitivity SENS)
+(sensitivityorder (SENS))
+(sensitivitycategory SENS (CAT))
+(allow TYPE self (CLASS (PERM)))
+(roletype ROLE TYPE)
+(userrole USER ROLE)
+(userlevel USER (SENS))
+(userrange USER ((SENS)(SENS (CAT))))
+(sidcontext SID (USER ROLE TYPE ((SENS)(SENS))))
+
+(classmap cm5 (mp5a mp5b))
+(classmapping cm5 mp5a
+	      (C2 (p2a p2b)))
+(classmapping cm5 mp5b
+	      (C2 (p2c p2d)))
+
+(classpermission cp6)
+(classpermissionset cp6 (C3 (p3a p3b)))
+(classpermissionset cp6 (C4 (p4a p4b)))
+
+(classpermission cp7)
+(classpermissionset cp7 (C2 (p2a p2b)))
+(classpermissionset cp7 (C2 (p2c p2d)))
+
+; Test 1
+(type t01a)
+(type t01b)
+(allow t01a t01b (C1 (p1a)))
+(deny t01a t01b (C1 (p1a)))
+(neverallow t01a t01b (C1 (p1a)))
+
+; Test 2
+(type t02a)
+(type t02b)
+(allow t02a t02b (C1 (p1a p1b)))
+(deny t02a t02b (C1 (p1a)))
+(neverallow t02a t02b (C1 (p1a)))
+; (neverallow t02a t02b (C1 (p1b))) ; This check should fail
+
+; Test 3
+(type t03a)
+(type t03b)
+(allow t03a t03b (C1 (p1a)))
+(deny t03a t03b (C1 (p1a p1b)))
+(neverallow t03a t03b (C1 (p1a p1b)))
+
+
+; Test 11
+(type t11a)
+(type t11b)
+(type t11c)
+(type t11d)
+(typeattribute a11a)
+(typeattribute a11b)
+(typeattributeset a11a (t11a t11b))
+(typeattributeset a11b (t11c t11d))
+(allow a11a a11b (C1 (p1a)))
+(deny a11a a11b (C1 (p1a)))
+(neverallow a11a a11b (C1 (p1a)))
+
+; Test 12
+(type t12a)
+(type t12b)
+(type t12c)
+(type t12d)
+(typeattribute a12a)
+(typeattribute a12b)
+(typeattributeset a12a (t12a t12b))
+(typeattributeset a12b (t12c t12d))
+(allow t12a t12c (C1 (p1a)))
+(deny a12a a12b (C1 (p1a)))
+(neverallow a12a a12b (C1 (p1a)))
+
+; Test 13
+(type t13a)
+(type t13b)
+(type t13c)
+(type t13d)
+(typeattribute a13a)
+(typeattribute a13b)
+(typeattributeset a13a (t13a t13b))
+(typeattributeset a13b (t13c t13d))
+(allow a13a a13b (C1 (p1a)))
+(deny t13a t13c (C1 (p1a)))
+(neverallow t13a t13c (C1 (p1a)))
+; (neverallow t13b t13d (C1 (p1a))) ; This check should fail
+
+; Test 21
+(type t21a)
+(type t21b)
+(allow t21a t21b (cm5 (mp5a)))
+(deny t21a t21b (cm5 (mp5a)))
+(neverallow t21a t21b (cm5 (mp5a)))
+
+; Test 22
+(type t22a)
+(type t22b)
+(allow t22a t22b (cm5 (mp5a mp5b)))
+(deny t22a t22b (cm5 (mp5a)))
+(neverallow t22a t22b (cm5 (mp5a)))
+; (neverallow t22a t22b (cm5 (mp5b))) ; This check should fail
+
+; Test 23
+(type t23a)
+(type t23b)
+(allow t23a t23b (cm5 (mp5a)))
+(deny t23a t23b (cm5 (mp5a mp5b)))
+(neverallow t23a t23b (cm5 (mp5a mp5b)))
+
+; Test 24
+(type t24a)
+(type t24b)
+(allow t24a t24b (C2 (p2a)))
+(deny t24a t24b (cm5 (mp5a)))
+(neverallow t24a t24b (cm5 (mp5a)))
+
+; Test 25
+(type t25a)
+(type t25b)
+(allow t25a t25b (cm5 (mp5a)))
+(deny t25a t25b (C2 (p2a)))
+(neverallow t25a t25b (C2 (p2a)))
+; (neverallow t25a t25b (C2 (p2b))) ; This check should fail
+
+; Test 31
+(type t31a)
+(type t31b)
+(allow t31a t31b cp6)
+(deny t31a t31b cp6)
+(neverallow t31a t31b cp6)
+
+; Test 32
+(type t32a)
+(type t32b)
+(allow t32a t32b cp6)
+(deny t32a t32b (C3 (p3a p3b)))
+(neverallow t32a t32b (C3 (p3a p3b)))
+; (neverallow t32a t32b (C4 (p4a p4b))) ; This check should fail
+
+; Test 33
+(type t33a)
+(type t33b)
+(allow t33a t33b (C3 (p3a)))
+(deny t33a t33b cp6)
+(neverallow t33a t33b cp6)
+
+; Test 34
+(type t34a)
+(type t34b)
+(allow t34a t34b cp7)
+(deny t34a t34b (cm5 (mp5a mp5b)))
+(neverallow t34a t34b (cm5 (mp5a mp5b)))
+
+; Test 35
+(type t35a)
+(type t35b)
+(allow t35a t35b (cm5 (mp5a mp5b)))
+(deny t35a t35b cp7)
+(neverallow t35a t35b cp7)
+
+; Test 41
+(type t41a)
+(allow t41a self (C1 (p1a)))
+(deny t41a self (C1 (p1a)))
+(neverallow t41a self (C1 (p1a)))
+
+; Test 42
+(type t42a)
+(allow t42a self (C1 (p1a)))
+(deny t42a t42a (C1 (p1a)))
+(neverallow t42a t42a (C1 (p1a)))
+
+; Test 43
+(type t43a)
+(allow t43a t43a (C1 (p1a)))
+(deny t43a self (C1 (p1a)))
+(neverallow t43a self (C1 (p1a)))
+
+; Test 51
+(type t51a)
+(type t51b)
+(typeattribute a51a)
+(typeattributeset a51a (t51a t51b))
+(allow a51a self (C1 (p1a)))
+(deny a51a self (C1 (p1a)))
+(neverallow a51a self (C1 (p1a)))
+
+; Test 52
+(type t52a)
+(type t52b)
+(typeattribute a52a)
+(typeattributeset a52a (t52a t52b))
+(allow t52a self (C1 (p1a)))
+(deny a52a self (C1 (p1a)))
+(neverallow a52a self (C1 (p1a)))
+
+; Test 53
+(type t53a)
+(type t53b)
+(typeattribute a53a)
+(typeattributeset a53a (t53a t53b))
+(allow a53a self (C1 (p1a)))
+(deny t53a self (C1 (p1a)))
+(neverallow t53a self (C1 (p1a)))
+; (neverallow t53b self (C1 (p1a))) ; This check should fail
+
+; Test 54
+(type t54a)
+(type t54b)
+(typeattribute a54a)
+(typeattributeset a54a (t54a t54b))
+(allow a54a self (C1 (p1a)))
+(deny a54a a54a (C1 (p1a)))
+(neverallow a54a a54a (C1 (p1a)))
+
+; Test 55
+(type t55a)
+(type t55b)
+(typeattribute a55a)
+(typeattributeset a55a (t55a t55b))
+(allow a55a a55a (C1 (p1a)))
+(deny a55a self (C1 (p1a)))
+(neverallow a55a self (C1 (p1a)))
+; (neverallow t55a t55b (C1 (p1a))) ; This check should fail
+; (neverallow t55b t55a (C1 (p1a))) ; This check should fail
+
+; Test 61
+(type t61a)
+(type t61b)
+(type t61c)
+(type t61d)
+(type t61e)
+(type t61f)
+(type t61g)
+(type t61h)
+(type t61i)
+(type t61j)
+(type t61k)
+(type t61l)
+(type t61m)
+(type t61n)
+(type t61o)
+(type t61p)
+(type t61q)
+(type t61r)
+(type t61s)
+(type t61t)
+(typeattribute a61a)
+(typeattribute a61b)
+(typeattribute a61c)
+(typeattribute a61x)
+(typeattribute a61s)
+(typeattribute a61t)
+(typeattributeset a61a (t61a t61b t61c t61d t61e t61f t61g t61h t61o t61p))
+(typeattributeset a61b (t61a t61b t61c t61d t61i t61j t61k t61l t61q t61r))
+(typeattributeset a61c (t61a t61b t61e t61f t61i t61j t61m t61n t61s t61t))
+(typeattributeset a61x (t61a t61b))
+(typeattributeset a61s (t61c t61d t61e t61f t61g t61h t61o t61p))
+(typeattributeset a61t (t61c t61d t61i t61j t61k t61l t61q t61r))
+(allow a61a a61b (C1 (p1a)))
+(deny a61c self (C1 (p1a)))
+(neverallow a61c self (C1 (p1a)))
+; (neverallow a61s a61b (C1 (p1a))) ; This check should fail
+; (neverallow a61a a61t (C1 (p1a))) ; This check should fail
+; (neverallow t61a t61b (C1 (p1a))) ; This check should fail
+; (neverallow t61b t61a (C1 (p1a))) ; This check should fail
+
+; Test 62
+(type t62a)
+(type t62b)
+(type t62c)
+(type t62d)
+(type t62e)
+(type t62f)
+(type t62g)
+(type t62h)
+(type t62i)
+(type t62j)
+(type t62k)
+(type t62l)
+(type t62m)
+(type t62n)
+(type t62o)
+(type t62p)
+(type t62s)
+(type t62t)
+(type t62u)
+(type t62v)
+(typeattribute a62a)
+(typeattribute a62c)
+(typeattribute a62d)
+(typeattribute a62s)
+(typeattributeset a62a (t62a t62b t62c t62d t62e t62f t62g t62h t62o t62p))
+(typeattributeset a62c (t62a t62b t62e t62f t62i t62j t62m t62n t62s t62t))
+(typeattributeset a62d (t62a t62b t62g t62h t62k t62l t62m t62n t62u t62v))
+(typeattributeset a62s (t62c t62d t62e t62f t62g t62h t62o t62p))
+(allow a62a self (C1 (p1a)))
+(deny a62c a62d (C1 (p1a)))
+(neverallow a62c a62d (C1 (p1a)))
+; (neverallow a62s self (C1 (p1a))) ; This check should fail
+
+; Test 63
+(type t63a)
+(type t63b)
+(type t63c)
+(type t63d)
+(type t63e)
+(type t63f)
+(type t63g)
+(type t63h)
+(type t63i)
+(type t63j)
+(type t63k)
+(type t63l)
+(type t63m)
+(type t63n)
+(type t63o)
+(type t63p)
+(type t63s)
+(type t63t)
+(typeattribute a63a)
+(typeattribute a63c)
+(typeattribute a63s)
+(typeattributeset a63a (t63a t63b t63c t63d t63e t63f t63g t63h t63o t63p))
+(typeattributeset a63c (t63a t63b t63e t63f t63i t63j t63m t63n t63s t63t))
+(typeattributeset a63s (t62c t62d t62e t62f t62g t62h t62o t62p))
+(allow a63a self (C1 (p1a)))
+(deny a63c self (C1 (p1a)))
+(neverallow a63c self (C1 (p1a)))
+; (neverallow a63s self (C1 (p1a))) ; This check should fail
+
+; Test 64
+(type t64a)
+(type t64b)
+(type t64c)
+(type t64d)
+(type t64e)
+(type t64f)
+(type t64g)
+(type t64h)
+(type t64i)
+(type t64j)
+(type t64k)
+(type t64l)
+(type t64m)
+(type t64n)
+(type t64o)
+(type t64p)
+(type t64q)
+(type t64r)
+(type t64s)
+(type t64t)
+(type t64u)
+(type t64v)
+(typeattribute a64a)
+(typeattribute a64b)
+(typeattribute a64c)
+(typeattribute a64d)
+(typeattribute a64s)
+(typeattribute a64t)
+(typeattributeset a64a (t64a t64b t64c t64d t64e t64f t64g t64h t64o t64p))
+(typeattributeset a64b (t64a t64b t64c t64d t64i t64j t64k t64l t64q t64r))
+(typeattributeset a64c (t64a t64b t64e t64f t64i t64j t64m t64n t64s t64t))
+(typeattributeset a64d (t64a t64b t64g t64h t64k t64l t64m t64n t64u t64v))
+(typeattributeset a64s (t64c t64d t64g t64h t64o t64p))
+(typeattributeset a64t (t64c t64d t64i t64j t64q t64r))
+(allow a64a a64b (C1 (p1a)))
+(deny a64c a64d (C1 (p1a)))
+(neverallow a64c a64d (C1 (p1a)))
+; (neverallow a64s a64b (C1 (p1a))) ; This check should fail
+; (neverallow a64a a64t (C1 (p1a))) ; This check should fail
-- 
2.38.1

