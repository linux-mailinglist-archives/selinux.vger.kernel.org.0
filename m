Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF3F24E937C
	for <lists+selinux@lfdr.de>; Mon, 28 Mar 2022 13:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240864AbiC1LYY (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 28 Mar 2022 07:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241413AbiC1LXs (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 28 Mar 2022 07:23:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009115675A;
        Mon, 28 Mar 2022 04:20:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 884EFB80EAE;
        Mon, 28 Mar 2022 11:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F3CC340EC;
        Mon, 28 Mar 2022 11:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648466448;
        bh=ZZXCelo44+MreOv90le9g/ySVWXAiprAJScWYxAenWM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uzltlvWu/1a8WiFs7TLRD3yRNNaeLH2G+gbZXasaFh/WFA0d/PBNFj4qpUQkhvHbZ
         r7kRI5HrBD5EI28YayYLpCMQ9oxr3TUQ0PlzDcPwY/kC9z1MLxXVMdO4bjrZbMP/Ld
         i+Nq5KNQI+myU2IoLhGGPlC5Lh0IzXJTSAfJoAowZWhSqHqnlGbV/0tNe1PLdW8dEc
         z7fALclSDc2GSoVFRAaDqqJdIwgSRR5I+ePwVNbEUUbbauSm0gCGBog/krpV2iVN0s
         zjnQnWT+dagBd6ngw9ROBC3Ug3i9WBeDH2AhGWxVf6w2RZHKQFOJhi+4O5yAIivmc8
         GjHGxTkPk3ngw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Richard Haines <richard_c_haines@btinternet.com>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Paul Moore <paul@paul-moore.com>,
        Sasha Levin <sashal@kernel.org>,
        stephen.smalley.work@gmail.com, eparis@parisplace.org,
        cgzones@googlemail.com, ndesaulniers@google.com,
        selinux@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 17/35] selinux: allow FIOCLEX and FIONCLEX with policy capability
Date:   Mon, 28 Mar 2022 07:19:53 -0400
Message-Id: <20220328112011.1555169-17-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220328112011.1555169-1-sashal@kernel.org>
References: <20220328112011.1555169-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: Richard Haines <richard_c_haines@btinternet.com>

[ Upstream commit 65881e1db4e948614d9eb195b8e1197339822949 ]

These ioctls are equivalent to fcntl(fd, F_SETFD, flags), which SELinux
always allows too.  Furthermore, a failed FIOCLEX could result in a file
descriptor being leaked to a process that should not have access to it.

As this patch removes access controls, a policy capability needs to be
enabled in policy to always allow these ioctls.

Based-on-patch-by: Demi Marie Obenour <demiobenour@gmail.com>
Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>
[PM: subject line tweak]
Signed-off-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 security/selinux/hooks.c                   | 6 ++++++
 security/selinux/include/policycap.h       | 1 +
 security/selinux/include/policycap_names.h | 3 ++-
 security/selinux/include/security.h        | 7 +++++++
 4 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index d582479dfd62..9b65ebc96b5d 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -3793,6 +3793,12 @@ static int selinux_file_ioctl(struct file *file, unsigned int cmd,
 					    CAP_OPT_NONE, true);
 		break;
 
+	case FIOCLEX:
+	case FIONCLEX:
+		if (!selinux_policycap_ioctl_skip_cloexec())
+			error = ioctl_has_perm(cred, file, FILE__IOCTL, (u16) cmd);
+		break;
+
 	/* default case assumes that the command will go
 	 * to the file's ioctl() function.
 	 */
diff --git a/security/selinux/include/policycap.h b/security/selinux/include/policycap.h
index 2ec038efbb03..a9e572ca4fd9 100644
--- a/security/selinux/include/policycap.h
+++ b/security/selinux/include/policycap.h
@@ -11,6 +11,7 @@ enum {
 	POLICYDB_CAPABILITY_CGROUPSECLABEL,
 	POLICYDB_CAPABILITY_NNP_NOSUID_TRANSITION,
 	POLICYDB_CAPABILITY_GENFS_SECLABEL_SYMLINKS,
+	POLICYDB_CAPABILITY_IOCTL_SKIP_CLOEXEC,
 	__POLICYDB_CAPABILITY_MAX
 };
 #define POLICYDB_CAPABILITY_MAX (__POLICYDB_CAPABILITY_MAX - 1)
diff --git a/security/selinux/include/policycap_names.h b/security/selinux/include/policycap_names.h
index b89289f092c9..ebd64afe1def 100644
--- a/security/selinux/include/policycap_names.h
+++ b/security/selinux/include/policycap_names.h
@@ -12,7 +12,8 @@ const char *selinux_policycap_names[__POLICYDB_CAPABILITY_MAX] = {
 	"always_check_network",
 	"cgroup_seclabel",
 	"nnp_nosuid_transition",
-	"genfs_seclabel_symlinks"
+	"genfs_seclabel_symlinks",
+	"ioctl_skip_cloexec"
 };
 
 #endif /* _SELINUX_POLICYCAP_NAMES_H_ */
diff --git a/security/selinux/include/security.h b/security/selinux/include/security.h
index ac0ece01305a..c0d966020ebd 100644
--- a/security/selinux/include/security.h
+++ b/security/selinux/include/security.h
@@ -219,6 +219,13 @@ static inline bool selinux_policycap_genfs_seclabel_symlinks(void)
 	return READ_ONCE(state->policycap[POLICYDB_CAPABILITY_GENFS_SECLABEL_SYMLINKS]);
 }
 
+static inline bool selinux_policycap_ioctl_skip_cloexec(void)
+{
+	struct selinux_state *state = &selinux_state;
+
+	return READ_ONCE(state->policycap[POLICYDB_CAPABILITY_IOCTL_SKIP_CLOEXEC]);
+}
+
 struct selinux_policy_convert_data;
 
 struct selinux_load_state {
-- 
2.34.1

