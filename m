Return-Path: <selinux+bounces-4578-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 654DDB2673E
	for <lists+selinux@lfdr.de>; Thu, 14 Aug 2025 15:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF623189E1C5
	for <lists+selinux@lfdr.de>; Thu, 14 Aug 2025 13:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FDE30102C;
	Thu, 14 Aug 2025 13:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrF/3VLc"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879C8301004;
	Thu, 14 Aug 2025 13:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755178032; cv=none; b=VCaIvncJg/3kwUYKlEKeAx/s63ZbaY6dFvgC9R2ifvGWY/VXdNR21hyibtHsHHEmO3YYYBqGdMSwCdJRb0HyZffdp/3hECYLFfsjhsuy7IDSsuBkmKHWJL7V9lTyD3b90WzZpfLC3I18fV3giY++74TjHHDPMszPeZS7W7lmE4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755178032; c=relaxed/simple;
	bh=x3vMLEGiaKmJ6n+EKkDG+PolS+/HazXNByyCsS5bzRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOFAW9+QNKLUmZW6jc+QYTnSUpBskOhYQMjwd2LH4rfmYtJTOMAXO3jbfffLTmyiRBOYTwbyu6XlUCTideH4lXuNkeSkS5kqVy1a+K1nznScW5Si1FuGYxM49TRw550vDJvmAUNrhIWKnie9wIA6UZ6jl/L4XCW4yLQFOiMusUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrF/3VLc; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b1098f9ed9so6474121cf.0;
        Thu, 14 Aug 2025 06:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755178029; x=1755782829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bte1VtBaGrLAMYDjEftDBCxjhIoRqFIZvL67RbpFIj0=;
        b=VrF/3VLccCiPjX2JxW9ZF56Uh8UekX9ACkwBWL3DK5+MHEfO01uDk9+8nzkaYAIgwO
         AEElzQ2h6/K9JQ0vGthqERa3dyNsWr1U3e0aaenEc9GnEnTuT3aMOxqnZGxpUWqziOtR
         eJBDsE/X2JanOkH1UWNk81omk+xC72MNu3vvsRQOqs/LkcOYuo1q95J2wn/uyYwFwpVj
         MU9hrshC8YxRW3SHPLJNHaoNR3hPX5S7KtpkwRq8ddnhFrMuIc9bZYKF5r5kd4pkIHPV
         71WYODFLakAmTPfjlOyd0p9GeDndBuq7X3oDMaBHnOyl3VZ2MrKr4SybnJIv4uMlDvIJ
         zSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755178029; x=1755782829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bte1VtBaGrLAMYDjEftDBCxjhIoRqFIZvL67RbpFIj0=;
        b=mWwAfyzqQHnyPPhdiPxvZNVu5Q8ruBOZcLPjaza7vKXCKhZlv4m6P+YSGwHP+E/3G2
         Yil507koLtDxvKBNKOUb7VzbZqTuTKYJWq7XoOk1O4qaRZuW4kzmp2CvoeihJ7nXeAWg
         O7QdtULZP1/Yd2HI8Jqcp1beSptUiyeAXfjO3zB2iC6XzCzYvVZ9mrmBJ1YRzD8ivqJp
         oa9Yn0CbPzhwXqPvRzN0/09BAWa9VI6nAYMT6JAQvjFmBeOOz2MGqfbHQWIzuTsPERQj
         BXyc8pXlnWYJIx7NsyFgGif19ORytJQrcmWY1Q/lSXRe0qC39KiEhGxooiT3zDFq6idg
         QlOg==
X-Forwarded-Encrypted: i=1; AJvYcCV0l9w6Y0080w/V9xlJIP4lVTGlA7X58kpo7e9SZ6zs8I25fpWu3FMimaKVyf2ghC/gIm+6LeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOm4InwOXCGMvcR9BvEVt6KYPp+ka5Ck8zgpONNUGcl4auWSV1
	ISfeEjOZGl9Wh+vWYaUDJrO89a+KyflEGVU/qQRUXH097v/Zu5z2ZwqNbnAMVw==
X-Gm-Gg: ASbGncsHt8l8AGghr4D7EvQ2c7QzLjbcvzM59xr+eg6bOxopTuPetztyY55+cNLMt25
	ekNw+ZuUfTz6+9s9LoQlp0eVrMPko5HlYjWkeQ6iNV2OtpVa5WmY4fdlAoUMQj7bRX8OTqJM0xk
	2eDT+8DFRZBB27CyKpaB55fmBdR8uT09Yq7+cmpwm73Dewex6STCjIwSUVt9WqAlzD/49lLFhpL
	XQ3RWvVCfmVkdtS0Tp+KNy5c58yjGRgJIZHcII0HVqoyNEId4PQhIyXlS1wgK0mXZ8MkcBKxd6n
	vfOzpF9FoA0XZAFbvcX46hR0sqNxT5Nja5rIQ82mbaFha7llRf+4Qe6deLtq6VMNJbpL858Lx7k
	/zKh6f392lDb4zDp0y8lxflt/IIy9PtUoaMEgWVouJQBaOISu0aWyVUsv5qP+qxlooxIoMag22E
	2k8nB9sXct90Gt2GuE+6iNqs3qgw==
X-Google-Smtp-Source: AGHT+IETxxpdNxcoqVhIJAmwz9nEgPalIae4lYGnW8HvXcPgrLhH1IQWojeBOO6DvZd8SIjFbtOPzg==
X-Received: by 2002:a05:622a:52:b0:4b0:7c42:8dfe with SMTP id d75a77b69052e-4b10a9163d9mr43558351cf.7.1755178028452;
        Thu, 14 Aug 2025 06:27:08 -0700 (PDT)
Received: from fedora.. (ec2-52-70-167-183.compute-1.amazonaws.com. [52.70.167.183])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0733088e1sm153587391cf.61.2025.08.14.06.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:27:07 -0700 (PDT)
From: Stephen Smalley <stephen.smalley.work@gmail.com>
To: selinux@vger.kernel.org
Cc: paul@paul-moore.com,
	omosnace@redhat.com,
	netdev@vger.kernel.org,
	horms@kernel.org,
	Stephen Smalley <stephen.smalley.work@gmail.com>
Subject: [PATCH v7 05/42] netstate,selinux: create the selinux netlink socket per network namespace
Date: Thu, 14 Aug 2025 09:25:56 -0400
Message-ID: <20250814132637.1659-6-stephen.smalley.work@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814132637.1659-1-stephen.smalley.work@gmail.com>
References: <20250814132637.1659-1-stephen.smalley.work@gmail.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The selinux netlink socket is used to notify userspace of changes to
the enforcing mode and policy reloads.  At present, these notifications
are always sent to the initial network namespace.  In order to support
multiple selinux namespaces, each with its own enforcing mode and
policy, we need to create and use a separate selinux netlink socket
for each network namespace.

Without this change, a policy reload in a child selinux namespace
causes a notification to be sent to processes in the init namespace
with a sequence number that may be higher than the policy sequence
number for that namespace.  As a result, userspace AVC instances in
the init namespace will then end up rejecting any further access
vector results from its own security server instance due to the
policy sequence number appearing to regress, which in turn causes
all subsequent uncached access checks to fail.  Similarly,
without this change, changing enforcing mode in the child selinux
namespace triggers a notification to all userspace AVC instances
in the init namespace that will switch their enforcing modes.

This change does alter SELinux behavior, since previously reloading
policy or changing enforcing mode in a non-init network namespace would
trigger a notification to processes in the init network namespace.
However, this behavior is not being relied upon by existing userspace
AFAICT and is arguably wrong regardless.

Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>
---
 include/net/net_namespace.h |  3 +++
 security/selinux/netlink.c  | 31 +++++++++++++++++++++++++------
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/include/net/net_namespace.h b/include/net/net_namespace.h
index 025a7574b275..06f2501ad9a9 100644
--- a/include/net/net_namespace.h
+++ b/include/net/net_namespace.h
@@ -196,6 +196,9 @@ struct net {
 	/* Move to a better place when the config guard is removed. */
 	struct mutex		rtnl_mutex;
 #endif
+#if IS_ENABLED(CONFIG_SECURITY_SELINUX)
+	struct sock		*selnl;
+#endif
 } __randomize_layout;
 
 #include <linux/seq_file_net.h>
diff --git a/security/selinux/netlink.c b/security/selinux/netlink.c
index 1760aee712fd..03678a76f4bb 100644
--- a/security/selinux/netlink.c
+++ b/security/selinux/netlink.c
@@ -19,8 +19,6 @@
 
 #include "security.h"
 
-static struct sock *selnl __ro_after_init;
-
 static int selnl_msglen(int msgtype)
 {
 	int ret = 0;
@@ -66,6 +64,7 @@ static void selnl_add_payload(struct nlmsghdr *nlh, int len, int msgtype, void *
 
 static void selnl_notify(int msgtype, void *data)
 {
+	struct sock *selnl = current->nsproxy->net_ns->selnl;
 	int len;
 	sk_buff_data_t tmp;
 	struct sk_buff *skb;
@@ -105,16 +104,36 @@ void selnl_notify_policyload(u32 seqno)
 	selnl_notify(SELNL_MSG_POLICYLOAD, &seqno);
 }
 
-static int __init selnl_init(void)
+static int __net_init selnl_net_init(struct net *net)
 {
+	struct sock *sk;
 	struct netlink_kernel_cfg cfg = {
 		.groups	= SELNLGRP_MAX,
 		.flags	= NL_CFG_F_NONROOT_RECV,
 	};
 
-	selnl = netlink_kernel_create(&init_net, NETLINK_SELINUX, &cfg);
-	if (selnl == NULL)
-		panic("SELinux:  Cannot create netlink socket.");
+	sk = netlink_kernel_create(net, NETLINK_SELINUX, &cfg);
+	if (!sk)
+		return -ENOMEM;
+	net->selnl = sk;
+	return 0;
+}
+
+static void __net_exit selnl_net_exit(struct net *net)
+{
+	netlink_kernel_release(net->selnl);
+	net->selnl = NULL;
+}
+
+static struct pernet_operations selnl_net_ops = {
+	.init = selnl_net_init,
+	.exit = selnl_net_exit,
+};
+
+static int __init selnl_init(void)
+{
+	if (register_pernet_subsys(&selnl_net_ops))
+		panic("Could not register selinux netlink operations\n");
 	return 0;
 }
 
-- 
2.50.1


