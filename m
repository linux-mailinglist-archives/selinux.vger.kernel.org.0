Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C215519FF9C
	for <lists+selinux@lfdr.de>; Mon,  6 Apr 2020 22:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgDFUz4 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 6 Apr 2020 16:55:56 -0400
Received: from sonic306-27.consmr.mail.ne1.yahoo.com ([66.163.189.89]:36449
        "EHLO sonic306-27.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726254AbgDFUz4 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 6 Apr 2020 16:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1586206555; bh=6SOK7+hRra9jNEqK0YVEKQXdCbnnZbAk5X8b8iNnurU=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=rkQrLkH3qtA6bMM2RojW9fXabvdjNz6AI/Iu/LtFypDbMasNx6r9jjeJWXhM3XMNDAWfi21F02bnVH89GQ3xB4p2XiAkE2kyi7DFSS3f0oZzf8Uju+wq68mXyo+x6drGj0A6G5omuNZfUHKWj868gdf79toPRLEBQVan45PNzVEBpz3IyYctYiQbbqYXiX2LrrNKR2l0u5D6ThIwXwG5Y/PNQr7Q2o7Ef01PQTDUBqgjrHbZHVQDq9ErUJn2h/1BOTaaDx1lkrmJ4tzHAcOZJAJpiBFadd31036EI+hF4WXG16/wJYzLZK6ZgH0ss8pi4D6S3NxGy0PAtiRz/FjlAA==
X-YMail-OSG: xHKhjfAVM1m_HQh3Xu_h7y5sehcy8Rt_X4LWuX70gECAqNAx_vMSjdQ8UdxJYdd
 EAGpuWUCf_kTL4.kj0ZDN86EyxVebd8LSZRDWMo3wL4CG62q8VbEg_jbjR.LsEcro76yb6ZpBjjz
 lRuljlr_IuxmeBXa2CSDzgVllizMIDclUyG1OChaOAJuuEks0HOTlEzw7dkI35Hvf84iKIpdfZI8
 9F6k_ciULL.hX.zqJ_0zZ7ydDfFpdjDOCqPVmskSylZttPDIDaKmngpjRdLqG7ALO8OkwuisiDrm
 CBsjGg3N.erF54xUs7.QaRVYlP8FWzC_nn1i54nZz5tCwwNMfveBYiF5Be3aXtmg61.8WGd3ZNAk
 kbN1dyMyCk2bzYocV33OwtPZcAht7jlIDTD55etzXKGv2TIpDEnl.xbTDTcl249tgdtF.yo5cgom
 rdbIRRu.wQai0Wx59Fa.JJ2avL3WyWkPjuIzjy.gHKQAHqDOhevX6QnRb_RVpVDSvPGBH6ncvkGq
 4AYWt0j6f8HQ.X62UYyhUT8uCv.a07EAJCptcTjXqaF2om.O8U9_NzgbCQEoxjI8ey9v1ODnzIT6
 QCKAABYBfp.R3g4J5vSxMHdkX93UIHUTce0T07V.A7rKWxeRcp0y7utOExDe4ShYKQOJzfxNHbBM
 kE0uyEnLr_4DA0gAzoJAWm3dtEQptzdN4_642uri9_7zo4rD9y8tPvQ3bk8iN6zqfEphTJyQQ7cl
 weUSnj_uY.GgW3XoKtgUHchG6Y7_4_U7za7asf6aFW7kLWPNrvAtbvKtK93SG726gqugoPM79j7w
 qtBYFp7E3b9Tg4AjQtDMw53Cho7c8uulwbWfB55t2JR9OP8YRIfhhiUeugE93WM1ZALFeKnKIeXF
 VDH6ewJ5sRVv1XiazITFpByQzf01hobHgD_bqn64oMf074UZmaN.yY1subL.HEYJ6zjLkX..sk_K
 Rp7iKpLw5bd2sdWvxgNdgBRYJDDzD1ms3jbDTsI6fx5nx1JGV3iL.DoM4b3dugPO5CaKNBddJzUE
 v38pslJXO8fYEdjptTfAkE3KdHyOTumvMGPBG.iJnxoqe3a4DfG0NDwLYjaotZ0pr5mwfCeWDKDE
 cdYXqi0NdwUK8nWaUe2YWA0.7qqop1mZzJkHRhvdkwK_rzNGc49nGf6u511v5AGZuPgXPfhvvAZw
 KR7BQWwWOjCg67queGmBlqh.qJnZgwtyczrLdXGx5fnYZUJmhYZavgiUPCzzGRhPq0LQX_GTdTsC
 aldEQUmxMzR9010MXnedeWrD.4zi6zJwsapRbcdTayJ20KCytRACEaJyxoCscl1nt92qdmQJdLwG
 XSCENkxO5Wi8_Srn3JPGujTxAXF4XL9J6uYd65ikDS8pBElrknjkWcNRaNJuYnhvIJlF4ABJgMpf
 PeSfQJ_0BAZezbOL9ExafeJpgsg8HH5a3GPu3npBs14xM0BqS0QXZaJwp
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ne1.yahoo.com with HTTP; Mon, 6 Apr 2020 20:55:55 +0000
Received: by smtp408.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID eb6070422de118e57d805646a4428c36;
          Mon, 06 Apr 2020 20:55:50 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH v16 05/23] net: Prepare UDS for security module stacking
Date:   Mon,  6 Apr 2020 13:54:51 -0700
Message-Id: <20200406205509.42473-6-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200406205509.42473-1-casey@schaufler-ca.com>
References: <20200406205509.42473-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Change the data used in UDS SO_PEERSEC processing from a
secid to a more general struct lsmblob. Update the
security_socket_getpeersec_dgram() interface to use the
lsmblob. There is a small amount of scaffolding code
that will come out when the security_secid_to_secctx()
code is brought in line with the lsmblob.

The secid field of the unix_skb_parms structure has been
replaced with a pointer to an lsmblob structure, and the
lsmblob is allocated as needed. This is similar to how the
list of passed files is managed. While an lsmblob structure
will fit in the available space today, there is no guarantee
that the addition of other data to the unix_skb_parms or
support for additional security modules wouldn't exceed what
is available.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
cc: netdev@vger.kernel.org
---
 include/linux/security.h |  7 +++++--
 include/net/af_unix.h    |  2 +-
 include/net/scm.h        |  8 +++++---
 net/ipv4/ip_sockglue.c   |  8 +++++---
 net/unix/af_unix.c       |  7 ++++---
 net/unix/scm.c           |  6 ++++++
 security/security.c      | 18 +++++++++++++++---
 7 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 1bfaf9ece13e..2ad58e2900e7 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1358,7 +1358,8 @@ int security_socket_shutdown(struct socket *sock, int how);
 int security_sock_rcv_skb(struct sock *sk, struct sk_buff *skb);
 int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
 				      int __user *optlen, unsigned len);
-int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid);
+int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
+				     struct lsmblob *blob);
 int security_sk_alloc(struct sock *sk, int family, gfp_t priority);
 void security_sk_free(struct sock *sk);
 void security_sk_clone(const struct sock *sk, struct sock *newsk);
@@ -1496,7 +1497,9 @@ static inline int security_socket_getpeersec_stream(struct socket *sock, char __
 	return -ENOPROTOOPT;
 }
 
-static inline int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid)
+static inline int security_socket_getpeersec_dgram(struct socket *sock,
+						   struct sk_buff *skb,
+						   struct lsmblob *blob)
 {
 	return -ENOPROTOOPT;
 }
diff --git a/include/net/af_unix.h b/include/net/af_unix.h
index 17e10fba2152..83c3b3034030 100644
--- a/include/net/af_unix.h
+++ b/include/net/af_unix.h
@@ -36,7 +36,7 @@ struct unix_skb_parms {
 	kgid_t			gid;
 	struct scm_fp_list	*fp;		/* Passed files		*/
 #ifdef CONFIG_SECURITY_NETWORK
-	u32			secid;		/* Security ID		*/
+	struct lsmblob		*lsmdata;	/* Security LSM data	*/
 #endif
 	u32			consumed;
 } __randomize_layout;
diff --git a/include/net/scm.h b/include/net/scm.h
index 1ce365f4c256..e2e71c4bf9d0 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -33,7 +33,7 @@ struct scm_cookie {
 	struct scm_fp_list	*fp;		/* Passed files		*/
 	struct scm_creds	creds;		/* Skb credentials	*/
 #ifdef CONFIG_SECURITY_NETWORK
-	u32			secid;		/* Passed security ID 	*/
+	struct lsmblob		lsmblob;	/* Passed LSM data	*/
 #endif
 };
 
@@ -46,7 +46,7 @@ struct scm_fp_list *scm_fp_dup(struct scm_fp_list *fpl);
 #ifdef CONFIG_SECURITY_NETWORK
 static __inline__ void unix_get_peersec_dgram(struct socket *sock, struct scm_cookie *scm)
 {
-	security_socket_getpeersec_dgram(sock, NULL, &scm->secid);
+	security_socket_getpeersec_dgram(sock, NULL, &scm->lsmblob);
 }
 #else
 static __inline__ void unix_get_peersec_dgram(struct socket *sock, struct scm_cookie *scm)
@@ -97,7 +97,9 @@ static inline void scm_passec(struct socket *sock, struct msghdr *msg, struct sc
 	int err;
 
 	if (test_bit(SOCK_PASSSEC, &sock->flags)) {
-		err = security_secid_to_secctx(scm->secid, &secdata, &seclen);
+		/* Scaffolding - it has to be element 0 for now */
+		err = security_secid_to_secctx(scm->lsmblob.secid[0],
+					       &secdata, &seclen);
 
 		if (!err) {
 			put_cmsg(msg, SOL_SOCKET, SCM_SECURITY, seclen, secdata);
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index aa3fd61818c4..6cf57d5ac899 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -130,15 +130,17 @@ static void ip_cmsg_recv_checksum(struct msghdr *msg, struct sk_buff *skb,
 
 static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
 {
+	struct lsmblob lb;
 	char *secdata;
-	u32 seclen, secid;
+	u32 seclen;
 	int err;
 
-	err = security_socket_getpeersec_dgram(NULL, skb, &secid);
+	err = security_socket_getpeersec_dgram(NULL, skb, &lb);
 	if (err)
 		return;
 
-	err = security_secid_to_secctx(secid, &secdata, &seclen);
+	/* Scaffolding - it has to be element 0 */
+	err = security_secid_to_secctx(lb.secid[0], &secdata, &seclen);
 	if (err)
 		return;
 
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 68debcb28fa4..179876573d6d 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -138,17 +138,18 @@ static struct hlist_head *unix_sockets_unbound(void *addr)
 #ifdef CONFIG_SECURITY_NETWORK
 static void unix_get_secdata(struct scm_cookie *scm, struct sk_buff *skb)
 {
-	UNIXCB(skb).secid = scm->secid;
+	UNIXCB(skb).lsmdata = kmemdup(&scm->lsmblob, sizeof(scm->lsmblob),
+				      GFP_KERNEL);
 }
 
 static inline void unix_set_secdata(struct scm_cookie *scm, struct sk_buff *skb)
 {
-	scm->secid = UNIXCB(skb).secid;
+	scm->lsmblob = *(UNIXCB(skb).lsmdata);
 }
 
 static inline bool unix_secdata_eq(struct scm_cookie *scm, struct sk_buff *skb)
 {
-	return (scm->secid == UNIXCB(skb).secid);
+	return lsmblob_equal(&scm->lsmblob, UNIXCB(skb).lsmdata);
 }
 #else
 static inline void unix_get_secdata(struct scm_cookie *scm, struct sk_buff *skb)
diff --git a/net/unix/scm.c b/net/unix/scm.c
index 8c40f2b32392..3094323935a4 100644
--- a/net/unix/scm.c
+++ b/net/unix/scm.c
@@ -142,6 +142,12 @@ void unix_destruct_scm(struct sk_buff *skb)
 	scm.pid  = UNIXCB(skb).pid;
 	if (UNIXCB(skb).fp)
 		unix_detach_fds(&scm, skb);
+#ifdef CONFIG_SECURITY_NETWORK
+	if (UNIXCB(skb).lsmdata) {
+		kfree(UNIXCB(skb).lsmdata);
+		UNIXCB(skb).lsmdata = NULL;
+	}
+#endif
 
 	/* Alas, it calls VFS */
 	/* So fscking what? fput() had been SMP-safe since the last Summer */
diff --git a/security/security.c b/security/security.c
index 914aecd89822..2fa826000889 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2140,10 +2140,22 @@ int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
 				optval, optlen, len);
 }
 
-int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid)
+int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
+				     struct lsmblob *blob)
 {
-	return call_int_hook(socket_getpeersec_dgram, -ENOPROTOOPT, sock,
-			     skb, secid);
+	struct security_hook_list *hp;
+	int rc = -ENOPROTOOPT;
+
+	hlist_for_each_entry(hp, &security_hook_heads.socket_getpeersec_dgram,
+			     list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		rc = hp->hook.socket_getpeersec_dgram(sock, skb,
+						&blob->secid[hp->lsmid->slot]);
+		if (rc != 0)
+			break;
+	}
+	return rc;
 }
 EXPORT_SYMBOL(security_socket_getpeersec_dgram);
 
-- 
2.24.1

