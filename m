Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2BD20F7CC
	for <lists+selinux@lfdr.de>; Tue, 30 Jun 2020 16:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389210AbgF3O7l (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 30 Jun 2020 10:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388943AbgF3O7j (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 30 Jun 2020 10:59:39 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7908C061755
        for <selinux@vger.kernel.org>; Tue, 30 Jun 2020 07:59:39 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id f139so19908888wmf.5
        for <selinux@vger.kernel.org>; Tue, 30 Jun 2020 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:subject:to:autocrypt:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=+WE4wpujm8RVZuciPKyC2mHSUItyrlNCh4qZwRcuyS8=;
        b=VKZReSpswf5g6k0MH3Olu14TlKD60J+Gs7D0Ob68ug253koH19VVdO9vZdSS9p/t6b
         DejOA04HXhZXPh+Rg88Tnl6OK4J6RK3ZzFZjxKYah9l8NlzponcwFGCZxE5KMLVZ8Lc4
         HkfMx9QyS5wUFQWswCJlZAkuYYiBS+ddjKPeWZeqVMOxb9+J0U/q273YGk35zA1cV05D
         oYVmiIJeelP8/2yJzq9Jk147OOwppQx8xX2px/mzzNA/o7FYLTchDYsVgoFeA6mLk5vr
         iGymePU0b+fUWR5giXMr9dNmKiiIAbMXkfRhyO6q8/4ErcTk5e/cjCrpGg3j80cBEWZs
         Vxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:autocrypt:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=+WE4wpujm8RVZuciPKyC2mHSUItyrlNCh4qZwRcuyS8=;
        b=Ldg4bYUmPWLV8LPGlA0cwR1Hhi5APq9wKjETuY/Rko4Hr90Rfp06ACyfclpBQRrUoJ
         i1blod34zi75i4x5nDg+7/ISq+Zh/+m7HLBYlbYTZxMtCztSfbqzYWsaOcBYhy+a2+yp
         YRFU8wTIvaNxYhS8TsaW04mjL9ZB1jmcTChbkNhT49cHuIdcM9YMr93MsHtwChHZEQOW
         X+DKfCByNz+yxyI+QwmQ2RpZ/ECSPteJr0ncgI0c9ASb0pxsXD++Zh/4L2WaIOSZVE/1
         MayoedH31kb7e8ICQoOdguao5GhM4GlvF93ctioJ8QCfZBnkk2j6sAzJCE1VUgGo7SBr
         Kk5g==
X-Gm-Message-State: AOAM5312/49hCzATdHZunoNEeUOBODhOF205yFV2s3D3LUMyzk0xe1OW
        H9Um0yLVihPRd8ftV/5cQKsesXKk
X-Google-Smtp-Source: ABdhPJzG3p8krBO9QoEbpImyPdjkRY79AeU+NDlwcP2DScROwcIPiA1YqFsG/K8Fun3SRYsVV7GxVA==
X-Received: by 2002:a1c:2d0d:: with SMTP id t13mr6684774wmt.43.1593529177161;
        Tue, 30 Jun 2020 07:59:37 -0700 (PDT)
Received: from ?IPv6:2a02:810d:4bc0:8098:78d9:64c7:b7ab:1b3a? ([2a02:810d:4bc0:8098:78d9:64c7:b7ab:1b3a])
        by smtp.gmail.com with ESMTPSA id j24sm4448046wrd.43.2020.06.30.07.59.35
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 07:59:36 -0700 (PDT)
From:   bauen1 <j2468h@googlemail.com>
X-Google-Original-From: bauen1 <j2468h@gmail.com>
Subject: [RFC PATCH] fixfiles: correctly restore context of mountpoints
To:     selinux <selinux@vger.kernel.org>
Autocrypt: addr=j2468h@gmail.com; keydata=
 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
 MzTZEAm15uwFxq66
Message-ID: <330f12f0-44d6-3659-0153-32b3cddf2db6@gmail.com>
Date:   Tue, 30 Jun 2020 16:59:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

By bind mounting every filesystem we want to relabel we can access all
files without anything hidden due to active mounts.

This comes at the cost of user experience, because setfiles only
displays the percentage if no path is given or the path is /

Signed-off-by: bauen1 <j2468h@gmail.com>
---
 policycoreutils/scripts/fixfiles | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/policycoreutils/scripts/fixfiles b/policycoreutils/scripts/fixfiles
index 5d777034..dc5be195 100755
--- a/policycoreutils/scripts/fixfiles
+++ b/policycoreutils/scripts/fixfiles
@@ -243,7 +243,19 @@ case "$RESTORE_MODE" in
 	if [ -n "${FILESYSTEMSRW}" ]; then
 	    LogReadOnly
 	    echo "${OPTION}ing `echo ${FILESYSTEMSRW}`"
-	    ${SETFILES} ${VERBOSE} ${EXCLUDEDIRS} ${FORCEFLAG} $* -q ${FC} ${FILESYSTEMSRW}
+
+	    # we bind mount so we can fix the labels of files that have already been
+	    # mounted over
+	    for m in `echo $FILESYSTEMSRW`; do
+	        TMP_MOUNT="$(mktemp -d)"
+	        test -z ${TMP_MOUNT+x} && echo "Unable to find temporary directory!" && exit 1
+
+	        mkdir -p "${TMP_MOUNT}${m}" || exit 1
+	        mount --bind "${m}" "${TMP_MOUNT}${m}" || exit 1
+	        ${SETFILES} ${VERBOSE} ${EXCLUDEDIRS} ${FORCEFLAG} $* -q ${FC} -r "${TMP_MOUNT}" "${TMP_MOUNT}${m}"
+	        umount "${TMP_MOUNT}${m}" || exit 1
+	        rm -rf "${TMP_MOUNT}" || echo "Error cleaning up."
+	    done;
 	else
 	    echo >&2 "fixfiles: No suitable file systems found"
 	fi
-- 
2.27.0

