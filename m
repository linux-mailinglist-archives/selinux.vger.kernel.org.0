Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48CDC22DFD1
	for <lists+selinux@lfdr.de>; Sun, 26 Jul 2020 17:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgGZPDE (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 26 Jul 2020 11:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgGZPDE (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 26 Jul 2020 11:03:04 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18910C0619D2
        for <selinux@vger.kernel.org>; Sun, 26 Jul 2020 08:03:04 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id l63so12223638oih.13
        for <selinux@vger.kernel.org>; Sun, 26 Jul 2020 08:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=+NAgjq2SCPOnwKpayMTT1WDWuqdjxe1C2zN8AgZ5Rsk=;
        b=bLNaGE7eypD1vc5wxCQZJjk3YkqXc0yUeqfVGBMUP3uOUot+Bfb0KVP+phhiH+fdZy
         ZKk1HkMEoZgg/6Klrp8XHJfDdZDB5XFHLQla2FGduGJhE+XrUfaFqC/fAb9r1vakydwO
         plpxVEJt5my+PQCoivr6GzOxXFPrD3rdmf6AgTnaQKvz/h9fF1Y6asCfVivtXBhoTxJB
         s20Bk9h70cPxVNRJp+R1wAtchCGUGvSWXRV9QNUdU06gPYHzJ9EAfn7DABTVOpkAGAFl
         sy7/w++Cb9D93Suq3lLWeGKVWuuKHmEOXCa2yUadutzBBYktcvUHw36ZJ5mm8ndaZPtV
         gv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=+NAgjq2SCPOnwKpayMTT1WDWuqdjxe1C2zN8AgZ5Rsk=;
        b=Ws4Ww2UeavXb/D9V0cDh5yrKkFjZzjf8qvz7AevbYXHlZKzBytRBxGxDvfnit7rSpS
         CFqLDYGRHq5XFFQKrDsi4jwzkogDukKPrVNN+DtPUovPmb7qBCk4QwjMiTg2c0S7jrFu
         ZFM7Lzx2WSW+RBruPYa2jPgnAwnj6TYfVytGFFrIMOH7TifrDWTO2lS3Qph3vv2Z74ka
         EKUA+N7yOxYPYjqmUgRh97eRtHbOhTLxzEiaJ9AUxeaPFh0rsm6EWJKljR8M1yHboTVZ
         vxUKvYMnQXP5XZHxS/ZlPUTeowGiA0+Gk9VAJV0Y6jdSb22/OlK7pjJWAGTD+GJCf2GP
         7ICg==
X-Gm-Message-State: AOAM531JocPeBEIbto3SvGrQU+AJnL5Glsj1Zr20k1v8n+kVrZZMYNb0
        w4ZPufnoHD4r6izqWrG3eyz7i9Vj
X-Google-Smtp-Source: ABdhPJw1a1TkW/oQQDG1z0RRAGgUNhLjlt8TTPwlAK6wqykdoGF7JKwlRb6MDlnzPHnXVdv+UOl7nA==
X-Received: by 2002:aca:110c:: with SMTP id 12mr15111086oir.42.1595775782628;
        Sun, 26 Jul 2020 08:03:02 -0700 (PDT)
Received: from ian.penurio.us (cpe-70-119-169-186.tx.res.rr.com. [70.119.169.186])
        by smtp.gmail.com with ESMTPSA id y5sm2755135otq.75.2020.07.26.08.03.01
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2020 08:03:01 -0700 (PDT)
To:     SElinux list <selinux@vger.kernel.org>
From:   Ian Pilcher <arequipeno@gmail.com>
Subject: File context rule not working
Message-ID: <31fac4d5-3c2e-75b5-5759-52322d8dd733@gmail.com>
Date:   Sun, 26 Jul 2020 10:03:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

I'm tearing my hair out trying to figure out why this rule isn't
matching.

   /usr(/local)?/bin/raidcheck    system_u:object_r:raidcheck_exec_t:s0

The rule shows up in the output of 'semanage fcontext -l', so it's
loaded, but either /usr/bin/raidcheck and /usr/local/bin/raidcheck  are
still being set to bin_t.

Is there any way to get restorecon to show the steps that it takes to
determine the context for a file?

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
