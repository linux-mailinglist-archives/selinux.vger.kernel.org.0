Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D175D12A4A5
	for <lists+selinux@lfdr.de>; Wed, 25 Dec 2019 00:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbfLXXWR (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 24 Dec 2019 18:22:17 -0500
Received: from sonic311-31.consmr.mail.ne1.yahoo.com ([66.163.188.212]:37247
        "EHLO sonic311-31.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726246AbfLXXWR (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 24 Dec 2019 18:22:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1577229735; bh=jx6SBqD3iFh7Ov9qmHnd1D9nd07iILpEnAa1txjocoA=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=GKd3zoOWX+c0IvJcm6L7uiNScay7sCjc0IQ2uzgT3/Z648WdStVTFubFWaTJqa+BbKh7+nhYOo3fhmSvLQdSr2UuUbe3epsRkdC93IOQXG05onGlhgpnp2RvBDbEKQxSHvmhtSAiQ525R8cYuFZDrudTEQ/oXLr4FOCJC1qjOlLGKMuuxaQHsGx/UG0MUSzNPQTVQ/8KR9JZmZjQ1qyQ1Hrbd6zg5WAst9L/m3CsPZ7BedqfDgy52ahzfmujCOV+z3W7GtPgCFhNuYIisTMVNrH0v/lNLyDZWJ9FWZtcrny0073nwg+VQ21VJI9a3wR5chIqpfOWqIlaVtmF/mFwYQ==
X-YMail-OSG: tkEjh9gVM1nmUp7XOGPY4AQMGLyo1vlzrzRCMHImhjcqn.okVSHIgx6.LQwgqNA
 eICHd0R._QHud6NoxYqZRNHDMiWJ3eRuFM2rkCQ5F3wuTObG7DyIDJvDwJesu6U5XJyFfmA6CU8z
 bAO86acOwoi7qWe.WtRMeCbflU1Sctb9Uv6AnL3s15ZgngHdAO0yw8_5cuoPNJH2.Y_iUbGs2MgF
 f2UUvmT3n.jnMJz.1.IRa0tV39Ba.oxIU7lJPmwuHTFVZ9lRndO1acAtA3PhTb1D.lmki0bonMqp
 p9cBCzjoy7g1bCEdfnSbkwI_BnvHqlkLDZsBCgaLooo5mJiwGsG6ntVRzPQPZdsyQkfCTa0t07ud
 TT7p.Ib2HDjT3C77gsU8U1yquficKsalYxN.csdXNhHI1uXJdXX5xkVfxAdlvSIHm6Cs40Eohkkz
 piANivK9huopGPLsKXGr0yCwqDyOLfmbBCnOQ4s0.1hT9zmIrR0hXgpy6DtlBLSVJaU.oVe09dMm
 PSD9boZTrQEc6EJnBOg38uNrEV1MJWOhPKLyYbEKfPLjMBkaVFG5N9Bj304xL0icPegNJ_DSpLCM
 DwYwuAEtBFYkXPfT_uUhqPT_A0lDZ64dKS1G1_Goe7fAcJ9krYTP93YCoqa5E6zXW65ovJmhsH7h
 8khXxOGhztX5ipLVVc47YTBbIWvyKfu.i6cPsaiJ6b7L8c.hHA0hW3GlCXFHA6xhe0VpYYSErdQc
 MQ4aJQN5si1TiSTg9IyJV5qGlHD0m2KzejOAf.B3ERA..FN7913GrYau07ICXEFEYmlwe4pdDpvn
 DhHCMwwWNdEHY6YZFtsfwz7TOpAC9uZKg.cPB6UOmctMpnJ2ucOwlydfSPlOpsyd9._ttOx8ZCuj
 Qf7DNykpctqj9l8Au.P1FW6l1ETtJngy1JnWx0TdYTx6qna05iBFpj0mazw2vD54xO7bYhP1K8pW
 L3X96Nz3OoZuOQfJdLwY5eviMoJMTwEEbxDgQXorjkSF9tWY_T3t_fsaYD8uA4Fz7SdDkO2n4tYx
 ZrdajTWTLB8FXPWFoH79rK9XJHWYZBo09FOffluXBGMK6_L_wqt_EwweXxeyF_dO_BTwO_OloCQG
 ScGGZ0hjfhwgngHrXbVnPoPZaw9gdL3mVExve_5Resz.EYUoo1J6uyJkTQ2PzEt_790IjcgAGiAN
 H4xsYZNgEwBeO4qpKaWjssdk0vZ07yHHxggGLF2k2.TkWqvq1fzMtRF9iSc6QeJkSeYMx5nicuaD
 ArEmAopHsRcrcZPKoEdirscbSvUqHz.x_pIUNXZ3G3KhW833YhAdcx5XRFq8jNR7nhFDWGB7AJg8
 YIhoTojwdEx..2Ue5ly_Mwr7DMu0zPGnnV2uxeguM3rKkV1MmalXGaD9N2Nq4AEPAEr02KCrUBv8
 3DmNVY.O.7czXdJptVeN05uAPN9fKDWU2LvpSS.eOcLr4jgJYLGVe6yVro03341YoAFJaHWQwYlU
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ne1.yahoo.com with HTTP; Tue, 24 Dec 2019 23:22:15 +0000
Received: by smtp427.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 25d085c89879d49fcf05d8c6e902660e;
          Tue, 24 Dec 2019 23:22:13 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH v12 18/25] LSM: security_secid_to_secctx in netlink netfilter
Date:   Tue, 24 Dec 2019 15:19:08 -0800
Message-Id: <20191224231915.7208-19-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191224231915.7208-1-casey@schaufler-ca.com>
References: <20191224231915.7208-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Change netlink netfilter interfaces to use lsmcontext
pointers, and remove scaffolding.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
cc: netdev@vger.kernel.org
---
 net/netfilter/nfnetlink_queue.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
index 2d6668fd026c..a1296453d8f2 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -301,12 +301,10 @@ static int nfqnl_put_sk_uidgid(struct sk_buff *skb, struct sock *sk)
 	return -1;
 }
 
-static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, char **secdata)
+static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, struct lsmcontext *context)
 {
-	u32 seclen = 0;
 #if IS_ENABLED(CONFIG_NETWORK_SECMARK)
 	struct lsmblob blob;
-	struct lsmcontext context = { };
 
 	if (!skb || !sk_fullsock(skb->sk))
 		return 0;
@@ -314,15 +312,16 @@ static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, char **secdata)
 	read_lock_bh(&skb->sk->sk_callback_lock);
 
 	if (skb->secmark) {
+		/* Any LSM might be looking for the secmark */
 		lsmblob_init(&blob, skb->secmark);
-		security_secid_to_secctx(&blob, &context);
-		*secdata = context.context;
+		security_secid_to_secctx(&blob, context);
 	}
 
 	read_unlock_bh(&skb->sk->sk_callback_lock);
-	seclen = context.len;
+	return context->len;
+#else
+	return 0;
 #endif
-	return seclen;
 }
 
 static u32 nfqnl_get_bridge_size(struct nf_queue_entry *entry)
@@ -398,8 +397,7 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	enum ip_conntrack_info uninitialized_var(ctinfo);
 	struct nfnl_ct_hook *nfnl_ct;
 	bool csum_verify;
-	struct lsmcontext scaff; /* scaffolding */
-	char *secdata = NULL;
+	struct lsmcontext context = { };
 	u32 seclen = 0;
 
 	size = nlmsg_total_size(sizeof(struct nfgenmsg))
@@ -466,7 +464,7 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	}
 
 	if ((queue->flags & NFQA_CFG_F_SECCTX) && entskb->sk) {
-		seclen = nfqnl_get_sk_secctx(entskb, &secdata);
+		seclen = nfqnl_get_sk_secctx(entskb, &context);
 		if (seclen)
 			size += nla_total_size(seclen);
 	}
@@ -601,7 +599,7 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	    nfqnl_put_sk_uidgid(skb, entskb->sk) < 0)
 		goto nla_put_failure;
 
-	if (seclen && nla_put(skb, NFQA_SECCTX, seclen, secdata))
+	if (seclen && nla_put(skb, NFQA_SECCTX, context.len, context.context))
 		goto nla_put_failure;
 
 	if (ct && nfnl_ct->build(skb, ct, ctinfo, NFQA_CT, NFQA_CT_INFO) < 0)
@@ -629,10 +627,8 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	}
 
 	nlh->nlmsg_len = skb->len;
-	if (seclen) {
-		lsmcontext_init(&scaff, secdata, seclen, 0);
-		security_release_secctx(&scaff);
-	}
+	if (seclen)
+		security_release_secctx(&context);
 	return skb;
 
 nla_put_failure:
@@ -640,10 +636,8 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	kfree_skb(skb);
 	net_err_ratelimited("nf_queue: error creating packet message\n");
 nlmsg_failure:
-	if (seclen) {
-		lsmcontext_init(&scaff, secdata, seclen, 0);
-		security_release_secctx(&scaff);
-	}
+	if (seclen)
+		security_release_secctx(&context);
 	return NULL;
 }
 
-- 
2.20.1

