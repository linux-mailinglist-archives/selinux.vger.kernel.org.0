Return-Path: <selinux+bounces-5284-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDABBEBAD0
	for <lists+selinux@lfdr.de>; Fri, 17 Oct 2025 22:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FF06745A0B
	for <lists+selinux@lfdr.de>; Fri, 17 Oct 2025 20:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E07354AD0;
	Fri, 17 Oct 2025 20:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="PLBUAaIe"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B6C354AC5
	for <selinux@vger.kernel.org>; Fri, 17 Oct 2025 20:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760732928; cv=none; b=Vdev369mGXNoReNK5XqtZIgCNCwHAoSdPypQT38IAvvplRd/kKD5vutVrVd+tKT/pUGU216wM6x7DvwNQVj/Cm7BF+8t8Ijyr2txyhLWpEQiwhrcUTMUmpA2OxBwal0pvHXSIBaRWI3F5oYHXvKIUzmFd57VhYJUoSZ99pOPqPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760732928; c=relaxed/simple;
	bh=iuXlvEP4RWicw4SMNuBF275xFR1ztz7FQKPfurRD1Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uUYmv2bGh57VubuuXqbC3U6YMziwzcGXw4drHXwrdG+RKq/0JCALbrQEKov3iVoCgRs+Hhh7I0K03R5dTp/RpIibSN71Y+TjloOAG32pnWzXSMl6G37QPOxs16phlvgpiFViyoJ6BlFyxYoCyVz2A8rteuK79AQR454wHRbl30A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=PLBUAaIe; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-88f239686f2so292108985a.0
        for <selinux@vger.kernel.org>; Fri, 17 Oct 2025 13:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1760732924; x=1761337724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9uBbjIUU74h1ZDdgDIYFE6I7PBb7cxOEFrM5zScIsrk=;
        b=PLBUAaIe5jLqf0aU10hmnqbPmyObSJVkuqg+fhMz8g343Cf3v9cQgSlGgOv//XejT4
         +9w4rpLNF94qr95hHB97goy8mXL0uED9WV2eMUWQ3HGrFGMIbzgyjQ7cS5NbdTiZdYYh
         hYug9/3u8zTEXDTqy2W5nIAXCYfd2pd+61XEDHgh6gxXTtoSpAcYnMIb+iOckjj8dE/J
         k/RvE7gdRP6hGWWCSOt+QGHFNl9SWU3clndE3igFZQHyTR6PIQnm2RhhaadzDA0X8zUt
         NLw6c2JcgiyWl+t55HrYcpBrOJO3nXbwV6abEaYfUoYDbe1rHXkDvcbau91St+PTOsQg
         9Rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760732924; x=1761337724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9uBbjIUU74h1ZDdgDIYFE6I7PBb7cxOEFrM5zScIsrk=;
        b=dz1FYEl2MA9deNr9wY/w+eq5Hcztrlk69ndxnS5biMQ/23e6Sff4670Od8Gr/aERfv
         I56Olp02NBnQMnTlWnMvIqQODdbTK1cGtxhgsGDCKQLfQ9M4Xil35FBUQHWgV9NwkEml
         L+94p+k+nLqywjIIQbOxi485doWpVvTdSYEKogbb67Ze4tXMsmtDxLotfHgFpuSsmOI6
         898VuAKqWexuwl8udmRHHGdcXi0CPn/udIWJ5h4kSlHDSYiMucUHgTwrBbpjjprn4fZu
         YKlYS7Ba/7XyegWtwH81N6uzJN+EmU/yeqXjxCKxrHVimeuLtKiPExGNcCV1CaKxspga
         cPtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhhYkse5Ghcv4vCgAQ6Ot1VQ0yMp5Pj7ci+YzflteG2tL3kvMfIG6XrPlEWhWDvgdk0dV+Y7GU@vger.kernel.org
X-Gm-Message-State: AOJu0YxVem1cHf/ebdDOP4IeU3X/Yt/eBC3coRA6BXbR6mHzfIvICodF
	h7SzdYV10A5XQOsmvE8qjrT/GxWe/n1LLoGQ/IzA4WRWHas1ecWlKRXBMXg90wEAFA==
X-Gm-Gg: ASbGncsLSM6gXz3YBkqBo5HApsBSv0qJXYBJYLQlhC/1MTbyrEA86aZh6krwtuHDd8q
	2evXk7n6o3Bhh/uDDcuqVKrrchtEwNUPcsmsYqX0g1gszdlUTMKwH+3XB8gDF6qT+8ExyuQzFjb
	/qT8w0OU3cfMynLd6n7pSE0fpqCpSrDajTvJcH7b5JwjmyNzifWMHQXWzgydHZk5AZGrzxNxvvE
	L6NH+0bn6H37qXcwTBz7CzDoxFKe+IKhWcUK6BHmkqfbDzeO2XzgEKqud+NIynVWi+/DN2Yenxs
	/vnnh34cXK5zFdeonvD1qrjqP7FMTS9PpJGtDRUjaHvaShJ9FPKaFvpOL87VHyL/QH+AoF9SVkF
	7Iq2i6YBCC8syl7PAQVxFVsuBAO0P1LRqtGwMJQIVAz0oKwbSiM+i8Uhggzc4tDc9vCpFmuXoth
	LhRnCZ/QEfhxmGDR4MRYCDxihoEn69JdK1AFCkrEuiXXRlPQ==
X-Google-Smtp-Source: AGHT+IGU83kYhlHhrPIm0RnfAz1WwXuAOKzXLce53bDxHAbB5mzVCypK8r4pC/cQrYZhzGpjh4cVgA==
X-Received: by 2002:ac8:5fd6:0:b0:4e8:a376:4345 with SMTP id d75a77b69052e-4e8a3764648mr37620811cf.43.1760732924100;
        Fri, 17 Oct 2025 13:28:44 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab0c8705sm4967831cf.26.2025.10.17.13.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:28:42 -0700 (PDT)
From: Paul Moore <paul@paul-moore.com>
To: linux-security-module@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	selinux@vger.kernel.org
Cc: John Johansen <john.johansen@canonical.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Fan Wu <wufan@kernel.org>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Kees Cook <kees@kernel.org>,
	Micah Morton <mortonm@chromium.org>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
	Xiu Jianfeng <xiujianfeng@huawei.com>
Subject: [PATCH v5 0/34] Rework the LSM initialization
Date: Fri, 17 Oct 2025 16:24:28 -0400
Message-ID: <20251017202456.484010-36-paul@paul-moore.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the fifth, and likely final, revision of the LSM rework patchset.
The number of changes in this revision are very minor and barring any
surprises I expect to merge this into the lsm/dev branch next week; I'll
send a notice when I do.  While there isn't anything in this revision
that people haven't seen previously, if you do have any concerns or
feedback, please let me know.  Once again, thank you to all of you that
have taken the time to review these patches.

I've aldo updated the working-lsm_init_rework branch of the main LSM
tree to contain the latest v5 revision of the patchset:
https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git/log/?h=working-lsm_init_rework

The v4 patchset:
https://lore.kernel.org/linux-security-module/20250916220355.252592-36-paul@paul-moore.com/

The RFC/v3 patchset:
https://lore.kernel.org/linux-security-module/20250814225159.275901-36-paul@paul-moore.com/

The RFC/v2 patchset:
https://lore.kernel.org/linux-security-module/20250721232142.77224-36-paul@paul-moore.com/

The RFC/v1 patchset is below, the cover letter provides some background
and motivation for this series which still applies:
https://lore.kernel.org/linux-security-module/20250409185019.238841-31-paul@paul-moore.com/

CHANGELOG
v5:
- rebased to lsm/dev branch post v6.18-rc1
- fixed a !CONFIG_SECURITYFS bug (kernel test robot)
- fixed a missing "__rcu" annotation on a cast (kernel test robot)
v4:
- reworked the lsm_read() function (John, Roberto, Tetsuo)
- replaced the IMA/EVM patch with one from Roberto
RFC/v3:
- rebased to lsm/dev branch
- fixed IMA/EVM initcall comment (Roberto)
- fixed CONFIG_IMA and CONFIG_EVM problems (Nicolas, Roberto)
- fixed CONFIG_SECURITY_SMACK_NETFILTER problems (Roberto)
- fixed the IMA/EVM header file include macro protections
- fixed an off-by-one string length issue in lsm_read() (Casey)
RFC/v2:
- rename lsm_prep_single() to lsm_prepare()
- drop the lsm_prop counting patch
- drop the platform_certs changes from the IMA/EVM patch (Mimi)
- split/reorder anough patches in the patchset that I lost track
- added missing function comment blocks in the SELinux patches
- split patch 04/29 into smaller patches (Kees)
- fix an LSM list output problem in an intermediate patch (Kees)
- preserve the "lsm_active_cnt" variable name (Casey)
- cache the lsm_read() string (Kees)
- squashed, split, and reordered the enabled/ordering patches
- reworked the Smack patch (Casey)
- conditionalized the SELinux IB init code (Stephen)
- fixed missing Smack "__init" annotation (Fan)
- fixed a potential unused variable warning in IMA/EVM (John)
- fixed the placeholder commit descriptions (various)
RFC/v1:
- initial version

--
Paul Moore (33):
      lsm: split the notifier code out into lsm_notifier.c
      lsm: split the init code out into lsm_init.c
      lsm: consolidate lsm_allowed() and prepare_lsm() into
         lsm_prepare()
      lsm: introduce looping macros for the initialization code
      lsm: integrate report_lsm_order() code into caller
      lsm: integrate lsm_early_cred() and lsm_early_task() into caller
      lsm: rename ordered_lsm_init() to lsm_init_ordered()
      lsm: replace the name field with a pointer to the lsm_id struct
      lsm: rename the lsm order variables for consistency
      lsm: rework lsm_active_cnt and lsm_idlist[]
      lsm: get rid of the lsm_names list and do some cleanup
      lsm: rework the LSM enable/disable setter/getter functions
      lsm: rename exists_ordered_lsm() to lsm_order_exists()
      lsm: rename/rework append_ordered_lsm() into lsm_order_append()
      lsm: rename/rework ordered_lsm_parse() to lsm_order_parse()
      lsm: cleanup the LSM blob size code
      lsm: cleanup initialize_lsm() and rename to lsm_init_single()
      lsm: fold lsm_init_ordered() into security_init()
      lsm: add/tweak function header comment blocks in lsm_init.c
      lsm: cleanup the debug and console output in lsm_init.c
      lsm: output available LSMs when debugging
      lsm: group lsm_order_parse() with the other lsm_order_*()
         functions
      lsm: introduce an initcall mechanism into the LSM framework
      loadpin: move initcalls to the LSM framework
      ipe: move initcalls to the LSM framework
      smack: move initcalls to the LSM framework
      tomoyo: move initcalls to the LSM framework
      safesetid: move initcalls to the LSM framework
      apparmor: move initcalls to the LSM framework
      lockdown: move initcalls to the LSM framework
      selinux: move initcalls to the LSM framework
      lsm: consolidate all of the LSM framework initcalls
      lsm: add a LSM_STARTED_ALL notification event

Roberto Sassu (1):
      ima,evm: move initcalls to the LSM framework

 include/linux/lsm_hooks.h              |   73 +-
 include/linux/security.h               |    3 
 security/Makefile                      |    2 
 security/apparmor/apparmorfs.c         |    4 
 security/apparmor/crypto.c             |    3 
 security/apparmor/include/apparmorfs.h |    2 
 security/apparmor/include/crypto.h     |    1 
 security/apparmor/lsm.c                |   11 
 security/bpf/hooks.c                   |    2 
 security/commoncap.c                   |    2 
 security/inode.c                       |   46 +
 security/integrity/evm/evm_main.c      |    5 
 security/integrity/evm/evm_secfs.c     |   11 
 security/integrity/iint.c              |   14 
 security/integrity/ima/ima_fs.c        |   11 
 security/integrity/ima/ima_main.c      |    6 
 security/integrity/integrity.h         |    2 
 security/ipe/fs.c                      |    4 
 security/ipe/ipe.c                     |    3 
 security/ipe/ipe.h                     |    2 
 security/landlock/setup.c              |    2 
 security/loadpin/loadpin.c             |   15 
 security/lockdown/lockdown.c           |    5 
 security/lsm.h                         |   58 ++
 security/lsm_init.c                    |  563 ++++++++++++++++++++++
 security/lsm_notifier.c                |   31 +
 security/lsm_syscalls.c                |    2 
 security/min_addr.c                    |    5 
 security/safesetid/lsm.c               |    3 
 security/safesetid/lsm.h               |    2 
 security/safesetid/securityfs.c        |    3 
 security/security.c                    |  623 +------------------------
 security/selinux/Makefile              |    2 
 security/selinux/hooks.c               |   11 
 security/selinux/ibpkey.c              |    5 
 security/selinux/include/audit.h       |    9 
 security/selinux/include/initcalls.h   |   19 
 security/selinux/initcalls.c           |   52 ++
 security/selinux/netif.c               |    5 
 security/selinux/netlink.c             |    5 
 security/selinux/netnode.c             |    5 
 security/selinux/netport.c             |    5 
 security/selinux/selinuxfs.c           |    5 
 security/selinux/ss/services.c         |   26 -
 security/smack/smack.h                 |   14 
 security/smack/smack_lsm.c             |   11 
 security/smack/smack_netfilter.c       |    4 
 security/smack/smackfs.c               |    4 
 security/tomoyo/common.h               |    2 
 security/tomoyo/securityfs_if.c        |    4 
 security/tomoyo/tomoyo.c               |    3 
 security/yama/yama_lsm.c               |    2 
 52 files changed, 1000 insertions(+), 712 deletions(-)


