Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E62E31B9121
	for <lists+selinux@lfdr.de>; Sun, 26 Apr 2020 17:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgDZPVw (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 26 Apr 2020 11:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgDZPVv (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 26 Apr 2020 11:21:51 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750E8C061A0F
        for <selinux@vger.kernel.org>; Sun, 26 Apr 2020 08:21:51 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 198so11705566lfo.7
        for <selinux@vger.kernel.org>; Sun, 26 Apr 2020 08:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=1mruaalEPNbI/3lwpJMa4ep0JUpuPUMS1NLlPzQIpjU=;
        b=W4Mp5Ktz2NEudWXpRpanDNK7Ey50pV9KLxjwkkyBjAN9cfRLAwwOQd5mXJkub/QLAf
         pwQ0IrQHIFNk+FeULumIfmTSLE64W2TLSOBTZpm9IdfHggbFGDlMGFxaVVqa5WS87F+m
         DbVfEC+CVoKMJgR02wfyC/8ejKQWrEvEOwVEUpfmcCritCv+THpra24xHLHodSn0YxvC
         43O0c5QdgXem2trvUCGmkBAKgywJnYXGZifXtGc0jyYITOJ6mPfE+2fiBXO1mr5k3ta5
         ZFJ2BDkjFXZfIYX9n7C76KEcdctpPF1QylCB+2/sDZDFMKMR1+y1YhebnYMFSNyYSd7j
         LJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=1mruaalEPNbI/3lwpJMa4ep0JUpuPUMS1NLlPzQIpjU=;
        b=h4Q2UFzpn/0yk8S5SZj/4CXdnr8EvlGLbi+HZiCJzLt2598+95Zvfu5i6+h5YMkFP5
         gdObptYlmW4cSVGhV3j2tS7H+0sdD4lZo8x4uKjdiZJ8ffvInf8xAg+5MlC39rRMMTAf
         WeKoh2eCvboXrxAnL9o34HtAj6V4ZPBZlbKaXO7n89Z02qcHDh03Wd/KF6hzZntOf3nb
         UfZCPWkhKSqL2P27AOM2KXa/6zfjDTRLyQagGkS5m+cyqVnnPL41NGJes4wEhdjZU/7+
         P2bDojlHicNBLUowdNWGpqk9OcEbRZI+9H/lqCemjTTNp7PmU0jOtK3LH00dxDQboWGo
         uMdQ==
X-Gm-Message-State: AGi0PubGfaIZgb7r17hhSjF1kxrGxWaEGxOr5AM0HLw/foh6ksCCNrC+
        9SOWrpMqjiWBLXLAy0uAya0qgDMVcJE=
X-Google-Smtp-Source: APiQypIFsgiViXCSnp4k1hwPP3eAAYFrcpnEelVA5dn34tZKXagp94rqDg6nxoE3OpJCtg8ugOdmiw==
X-Received: by 2002:a19:ca0e:: with SMTP id a14mr12796132lfg.105.1587914509539;
        Sun, 26 Apr 2020 08:21:49 -0700 (PDT)
Received: from [192.168.1.38] (88-114-211-119.elisa-laajakaista.fi. [88.114.211.119])
        by smtp.gmail.com with ESMTPSA id v3sm9165646lfo.62.2020.04.26.08.21.48
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 08:21:48 -0700 (PDT)
To:     selinux@vger.kernel.org
From:   Topi Miettinen <toiwoton@gmail.com>
Subject: [PATCH] setsebool: report errors from commit phase
Message-ID: <5e3c6fbd-49be-8dcd-903e-b8d98939ae37@gmail.com>
Date:   Sun, 26 Apr 2020 18:21:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

In case there are errors when committing changes to booleans, the
errors may not be reported to user except by nonzero exit status. With
"setsebool -V" it's possible to see errors from commit phase, but
otherwise the unfixed command is silent:

  # setsebool -V -P secure_mode_insmod=off
libsemanage.semanage_install_final_tmp: Could not copy 
/var/lib/selinux/final/default/contexts/files/file_contexts to 
/etc/selinux/default/contexts/files/file_contexts. (Read-only file system).
libsemanage.semanage_install_final_tmp: Could not copy 
/var/lib/selinux/final/default/contexts/files/file_contexts to 
/etc/selinux/default/contexts/files/file_contexts. (Read-only file system).

Fixed version alerts the user about problems even without -V:
  # setsebool -P secure_mode_insmod=off
Failed to commit changes to booleans: Read-only file system

Signed-off-by: Topi Miettinen <toiwoton@gmail.com>
---
  policycoreutils/setsebool/setsebool.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/policycoreutils/setsebool/setsebool.c 
b/policycoreutils/setsebool/setsebool.c
index 9d8abfac..60da5df1 100644
--- a/policycoreutils/setsebool/setsebool.c
+++ b/policycoreutils/setsebool/setsebool.c
@@ -200,8 +200,10 @@ static int semanage_set_boolean_list(size_t boolcnt,

         if (no_reload)
                 semanage_set_reload(handle, 0);
-       if (semanage_commit(handle) < 0)
+       if (semanage_commit(handle) < 0) {
+               fprintf(stderr, "Failed to commit changes to booleans: 
%m\n");
                 goto err;
+       }

         semanage_disconnect(handle);
         semanage_handle_destroy(handle);
-- 
2.26.2
