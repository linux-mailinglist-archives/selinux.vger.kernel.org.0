Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B40F121CB7
	for <lists+selinux@lfdr.de>; Mon, 16 Dec 2019 23:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbfLPWYq (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 16 Dec 2019 17:24:46 -0500
Received: from sonic306-28.consmr.mail.ne1.yahoo.com ([66.163.189.90]:45392
        "EHLO sonic306-28.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726551AbfLPWYp (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 16 Dec 2019 17:24:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1576535081; bh=0RNJtkYlxKlztPNJjXYXTynUw6rCRnoEn3Xnwak/89g=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=CR69rNjBPdFYogcoMYZMuPU/aKRofFr+vbC93eEFLEFsPj5SP3MmNl98p/xBk5c2qur7nY4fCiLkLHdQ0HCq5HqPfmKqEMtCgufa2IRsDn9PllUSskpxIEjxj6JezxxgNulM/gR1TxYwdnpiXjaySW56/9IuWcaP5ALyCoyLnGIbt2T9KJT6AWZ++HKXcKoPXZjnXVy3jqhVnDvg6Q8tS4xdG8j9X5fQSSqbWQgH1y4Qd1YOcJjvpR18+9ASIsXyA+VD1CjbRjb5ZF55NAyrUgjgooCr9iijzZnNnW0nfTbfgKttAQUoDeFi0s24+sQl4bBsAPp6QBBAabc9Zju5dQ==
X-YMail-OSG: AOl8B_sVM1mnJwEvkdIw9CNcOuMJBWc6lLzcx9zwkoavjMdV1VJxk4oGWXP.S1m
 6rmsyymoMkfPTLipD7fVqEJOTFQKNJ_CnAVGR7rxCtygXehBpzsSSRBBshp5iCYT02034sQsF5ek
 X2ZbnTFIsHQt3TdamPhqhkwb76pXuw05cCPW_ISNc1haDF9554DmF_eHxQoUdzEGTdnmmFsxe70t
 sYxNgJ6kueAraWQxY1Apj7YTcrJvPFXqJxRaxCvbprcmsUqhzITnycP0G8BgrUxArNCbD1ky.hcc
 ytDiVkBC20uhIzks._tQ30KVpJuTYBx.AEhceZAxm50IQWTNBUhiNjeJ97wFTTxUfdjInj579ECA
 NyNfCbsMx6MfhwFM0FjK8tSYWKPQxp0wiZTCIHjtAK7aItc6xHsTC4vFsjcN5eQkcsNr4FAV_4H3
 bI130h8GhDiJXySWUGoLpm4WXepgrhLVricSyKCSPonOxxAGr1TKiSQT0kcc8E8uPgd96D2DUYAl
 06ZtIZP048UxF0MaaXWkIoGGkF1XjdfUbwM10GAYrv2ThDPvXeJRpOtfgwYocGry1MaemEhHZuFB
 3QMELkH2B2orh6eq3y5LzqdJvOmQ.3nPXV5yWdosoLkFoVA07r8PPbTTM2jTjIuxCxG04PankPqc
 yLghSbIzFThZxUAbq6oNNaYqiSaZIyoAzrZYmXDYNWrX6tKouDO8BZX5H9dsNkDl0mF6MxPbswhC
 qZkwxEFwL36ifcSRLnNX4Gkr_nAirNdN5E9fhewVX4sapyyfIanGC_e.UftpKGFvbdZ9Aj6EW1lV
 wTqTa24eAB3hdMRE2dvdmSfoCikgmafFpUWjiIAphFy15RdCT8igmjzjY6rBkVahMoI9RtgEzMPb
 xLF4xu5O.ht8VhaavsDV7c8RH8DgP5FgBdr4ZHBqTgyP8_dNaiK8N9b8GtPS2bWX11D37If0YT19
 BCuXniyHD_0GqxeRHxdKhk.zUNeMfwR2wbeZOWEyZ9Slg44rUiN8KiGuQETTuHk2Pi6UskOryor3
 ExZ6b46Sq1R.kXwMw_Ufkx_HNkVwrOdygQCbD9y0q1WJI0T25wjjg.1lrNJLG_T8_6ugIAv4SJ8Z
 QNIqfOnGoPJf.0gbxRd3GBlOMzhzMV0OrpKdOYwvFZuDdZJMyVlfClXqxWGbXqBWkWGHZ8Tu8qG4
 vC_FGWJ2sqsI9mtYsNpgVaxmOImrOGFz5rrfLPmonjXbO5EKnpkzqRiOXQruRC4CPMwWlTpz9vG5
 HlG1tYVmqrHqWYXdQOk9LCB8ObFMOtjegVnTJjrprN9WuRHwpe.3xzv_igvKCuvUMDkI7P0ypJ9V
 asNW6sqP5GaWkvyG8WEaHIKvQuH7eb3KuAsTnPGsIMP0LpF0LUF5Pnamw.MLY7DSEhP885lC09qY
 e9nu.4ni1qqNWpBhT7Py.5Oo2bM9aF64q
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ne1.yahoo.com with HTTP; Mon, 16 Dec 2019 22:24:41 +0000
Received: by smtp426.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID e7b8acfb3713ab7004f68eee190caaf8;
          Mon, 16 Dec 2019 22:24:36 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     keescook@chromium.org, john.johansen@canonical.com,
        penguin-kernel@i-love.sakura.ne.jp, paul@paul-moore.com,
        sds@tycho.nsa.gov
Subject: [PATCH v12 01/25] LSM: Infrastructure management of the sock security
Date:   Mon, 16 Dec 2019 14:24:07 -0800
Message-Id: <20191216222431.4956-2-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216222431.4956-1-casey@schaufler-ca.com>
References: <20191216222431.4956-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Move management of the sock->sk_security blob out
of the individual security modules and into the security
infrastructure. Instead of allocating the blobs from within
the modules the modules tell the infrastructure how much
space is required, and the space is allocated there.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/lsm_hooks.h         |  1 +
 security/apparmor/include/net.h   |  6 ++-
 security/apparmor/lsm.c           | 38 ++++-----------
 security/security.c               | 36 +++++++++++++-
 security/selinux/hooks.c          | 78 +++++++++++++++----------------
 security/selinux/include/objsec.h |  5 ++
 security/selinux/netlabel.c       | 23 ++++-----
 security/smack/smack.h            |  5 ++
 security/smack/smack_lsm.c        | 64 ++++++++++++-------------
 security/smack/smack_netfilter.c  |  8 ++--
 10 files changed, 144 insertions(+), 120 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 20d8cf194fb7..c2b1af29a8f0 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -2095,6 +2095,7 @@ struct lsm_blob_sizes {
 	int	lbs_cred;
 	int	lbs_file;
 	int	lbs_inode;
+	int	lbs_sock;
 	int	lbs_ipc;
 	int	lbs_msg_msg;
 	int	lbs_task;
diff --git a/security/apparmor/include/net.h b/security/apparmor/include/net.h
index 2431c011800d..5b6f52c62058 100644
--- a/security/apparmor/include/net.h
+++ b/security/apparmor/include/net.h
@@ -51,7 +51,11 @@ struct aa_sk_ctx {
 	struct aa_label *peer;
 };
 
-#define SK_CTX(X) ((X)->sk_security)
+static inline struct aa_sk_ctx *aa_sock(const struct sock *sk)
+{
+	return sk->sk_security + apparmor_blob_sizes.lbs_sock;
+}
+
 #define SOCK_ctx(X) SOCK_INODE(X)->i_security
 #define DEFINE_AUDIT_NET(NAME, OP, SK, F, T, P)				  \
 	struct lsm_network_audit NAME ## _net = { .sk = (SK),		  \
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index b621ad74f54a..61b24f4eb355 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -766,33 +766,15 @@ static int apparmor_task_kill(struct task_struct *target, struct kernel_siginfo
 	return error;
 }
 
-/**
- * apparmor_sk_alloc_security - allocate and attach the sk_security field
- */
-static int apparmor_sk_alloc_security(struct sock *sk, int family, gfp_t flags)
-{
-	struct aa_sk_ctx *ctx;
-
-	ctx = kzalloc(sizeof(*ctx), flags);
-	if (!ctx)
-		return -ENOMEM;
-
-	SK_CTX(sk) = ctx;
-
-	return 0;
-}
-
 /**
  * apparmor_sk_free_security - free the sk_security field
  */
 static void apparmor_sk_free_security(struct sock *sk)
 {
-	struct aa_sk_ctx *ctx = SK_CTX(sk);
+	struct aa_sk_ctx *ctx = aa_sock(sk);
 
-	SK_CTX(sk) = NULL;
 	aa_put_label(ctx->label);
 	aa_put_label(ctx->peer);
-	kfree(ctx);
 }
 
 /**
@@ -801,8 +783,8 @@ static void apparmor_sk_free_security(struct sock *sk)
 static void apparmor_sk_clone_security(const struct sock *sk,
 				       struct sock *newsk)
 {
-	struct aa_sk_ctx *ctx = SK_CTX(sk);
-	struct aa_sk_ctx *new = SK_CTX(newsk);
+	struct aa_sk_ctx *ctx = aa_sock(sk);
+	struct aa_sk_ctx *new = aa_sock(newsk);
 
 	new->label = aa_get_label(ctx->label);
 	new->peer = aa_get_label(ctx->peer);
@@ -853,7 +835,7 @@ static int apparmor_socket_post_create(struct socket *sock, int family,
 		label = aa_get_current_label();
 
 	if (sock->sk) {
-		struct aa_sk_ctx *ctx = SK_CTX(sock->sk);
+		struct aa_sk_ctx *ctx = aa_sock(sock->sk);
 
 		aa_put_label(ctx->label);
 		ctx->label = aa_get_label(label);
@@ -1038,7 +1020,7 @@ static int apparmor_socket_shutdown(struct socket *sock, int how)
  */
 static int apparmor_socket_sock_rcv_skb(struct sock *sk, struct sk_buff *skb)
 {
-	struct aa_sk_ctx *ctx = SK_CTX(sk);
+	struct aa_sk_ctx *ctx = aa_sock(sk);
 
 	if (!skb->secmark)
 		return 0;
@@ -1051,7 +1033,7 @@ static int apparmor_socket_sock_rcv_skb(struct sock *sk, struct sk_buff *skb)
 
 static struct aa_label *sk_peer_label(struct sock *sk)
 {
-	struct aa_sk_ctx *ctx = SK_CTX(sk);
+	struct aa_sk_ctx *ctx = aa_sock(sk);
 
 	if (ctx->peer)
 		return ctx->peer;
@@ -1135,7 +1117,7 @@ static int apparmor_socket_getpeersec_dgram(struct socket *sock,
  */
 static void apparmor_sock_graft(struct sock *sk, struct socket *parent)
 {
-	struct aa_sk_ctx *ctx = SK_CTX(sk);
+	struct aa_sk_ctx *ctx = aa_sock(sk);
 
 	if (!ctx->label)
 		ctx->label = aa_get_current_label();
@@ -1145,7 +1127,7 @@ static void apparmor_sock_graft(struct sock *sk, struct socket *parent)
 static int apparmor_inet_conn_request(struct sock *sk, struct sk_buff *skb,
 				      struct request_sock *req)
 {
-	struct aa_sk_ctx *ctx = SK_CTX(sk);
+	struct aa_sk_ctx *ctx = aa_sock(sk);
 
 	if (!skb->secmark)
 		return 0;
@@ -1162,6 +1144,7 @@ struct lsm_blob_sizes apparmor_blob_sizes __lsm_ro_after_init = {
 	.lbs_cred = sizeof(struct aa_task_ctx *),
 	.lbs_file = sizeof(struct aa_file_ctx),
 	.lbs_task = sizeof(struct aa_task_ctx),
+	.lbs_sock = sizeof(struct aa_sk_ctx),
 };
 
 static struct security_hook_list apparmor_hooks[] __lsm_ro_after_init = {
@@ -1198,7 +1181,6 @@ static struct security_hook_list apparmor_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(getprocattr, apparmor_getprocattr),
 	LSM_HOOK_INIT(setprocattr, apparmor_setprocattr),
 
-	LSM_HOOK_INIT(sk_alloc_security, apparmor_sk_alloc_security),
 	LSM_HOOK_INIT(sk_free_security, apparmor_sk_free_security),
 	LSM_HOOK_INIT(sk_clone_security, apparmor_sk_clone_security),
 
@@ -1749,7 +1731,7 @@ static unsigned int apparmor_ip_postroute(void *priv,
 	if (sk == NULL)
 		return NF_ACCEPT;
 
-	ctx = SK_CTX(sk);
+	ctx = aa_sock(sk);
 	if (!apparmor_secmark_check(ctx->label, OP_SENDMSG, AA_MAY_SEND,
 				    skb->secmark, sk))
 		return NF_ACCEPT;
diff --git a/security/security.c b/security/security.c
index cd2d18d2d279..7fb6e5bcf6ec 100644
--- a/security/security.c
+++ b/security/security.c
@@ -28,6 +28,7 @@
 #include <linux/string.h>
 #include <linux/msg.h>
 #include <net/flow.h>
+#include <net/sock.h>
 
 #define MAX_LSM_EVM_XATTR	2
 
@@ -169,6 +170,7 @@ static void __init lsm_set_blob_sizes(struct lsm_blob_sizes *needed)
 	lsm_set_blob_size(&needed->lbs_inode, &blob_sizes.lbs_inode);
 	lsm_set_blob_size(&needed->lbs_ipc, &blob_sizes.lbs_ipc);
 	lsm_set_blob_size(&needed->lbs_msg_msg, &blob_sizes.lbs_msg_msg);
+	lsm_set_blob_size(&needed->lbs_sock, &blob_sizes.lbs_sock);
 	lsm_set_blob_size(&needed->lbs_task, &blob_sizes.lbs_task);
 }
 
@@ -304,6 +306,7 @@ static void __init ordered_lsm_init(void)
 	init_debug("inode blob size    = %d\n", blob_sizes.lbs_inode);
 	init_debug("ipc blob size      = %d\n", blob_sizes.lbs_ipc);
 	init_debug("msg_msg blob size  = %d\n", blob_sizes.lbs_msg_msg);
+	init_debug("sock blob size     = %d\n", blob_sizes.lbs_sock);
 	init_debug("task blob size     = %d\n", blob_sizes.lbs_task);
 
 	/*
@@ -622,6 +625,28 @@ static int lsm_msg_msg_alloc(struct msg_msg *mp)
 	return 0;
 }
 
+/**
+ * lsm_sock_alloc - allocate a composite sock blob
+ * @sock: the sock that needs a blob
+ * @priority: allocation mode
+ *
+ * Allocate the sock blob for all the modules
+ *
+ * Returns 0, or -ENOMEM if memory can't be allocated.
+ */
+static int lsm_sock_alloc(struct sock *sock, gfp_t priority)
+{
+	if (blob_sizes.lbs_sock == 0) {
+		sock->sk_security = NULL;
+		return 0;
+	}
+
+	sock->sk_security = kzalloc(blob_sizes.lbs_sock, priority);
+	if (sock->sk_security == NULL)
+		return -ENOMEM;
+	return 0;
+}
+
 /**
  * lsm_early_task - during initialization allocate a composite task blob
  * @task: the task that needs a blob
@@ -2066,12 +2091,21 @@ EXPORT_SYMBOL(security_socket_getpeersec_dgram);
 
 int security_sk_alloc(struct sock *sk, int family, gfp_t priority)
 {
-	return call_int_hook(sk_alloc_security, 0, sk, family, priority);
+	int rc = lsm_sock_alloc(sk, priority);
+
+	if (unlikely(rc))
+		return rc;
+	rc = call_int_hook(sk_alloc_security, 0, sk, family, priority);
+	if (unlikely(rc))
+		security_sk_free(sk);
+	return rc;
 }
 
 void security_sk_free(struct sock *sk)
 {
 	call_void_hook(sk_free_security, sk);
+	kfree(sk->sk_security);
+	sk->sk_security = NULL;
 }
 
 void security_sk_clone(const struct sock *sk, struct sock *newsk)
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 116b4d644f68..0839b2fbbf9b 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -4475,7 +4475,7 @@ static int socket_sockcreate_sid(const struct task_security_struct *tsec,
 
 static int sock_has_perm(struct sock *sk, u32 perms)
 {
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 	struct common_audit_data ad;
 	struct lsm_network_audit net = {0,};
 
@@ -4532,7 +4532,7 @@ static int selinux_socket_post_create(struct socket *sock, int family,
 	isec->initialized = LABEL_INITIALIZED;
 
 	if (sock->sk) {
-		sksec = sock->sk->sk_security;
+		sksec = selinux_sock(sock->sk);
 		sksec->sclass = sclass;
 		sksec->sid = sid;
 		/* Allows detection of the first association on this socket */
@@ -4548,8 +4548,8 @@ static int selinux_socket_post_create(struct socket *sock, int family,
 static int selinux_socket_socketpair(struct socket *socka,
 				     struct socket *sockb)
 {
-	struct sk_security_struct *sksec_a = socka->sk->sk_security;
-	struct sk_security_struct *sksec_b = sockb->sk->sk_security;
+	struct sk_security_struct *sksec_a = selinux_sock(socka->sk);
+	struct sk_security_struct *sksec_b = selinux_sock(sockb->sk);
 
 	sksec_a->peer_sid = sksec_b->sid;
 	sksec_b->peer_sid = sksec_a->sid;
@@ -4564,7 +4564,7 @@ static int selinux_socket_socketpair(struct socket *socka,
 static int selinux_socket_bind(struct socket *sock, struct sockaddr *address, int addrlen)
 {
 	struct sock *sk = sock->sk;
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 	u16 family;
 	int err;
 
@@ -4699,7 +4699,7 @@ static int selinux_socket_connect_helper(struct socket *sock,
 					 struct sockaddr *address, int addrlen)
 {
 	struct sock *sk = sock->sk;
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 	int err;
 
 	err = sock_has_perm(sk, SOCKET__CONNECT);
@@ -4878,9 +4878,9 @@ static int selinux_socket_unix_stream_connect(struct sock *sock,
 					      struct sock *other,
 					      struct sock *newsk)
 {
-	struct sk_security_struct *sksec_sock = sock->sk_security;
-	struct sk_security_struct *sksec_other = other->sk_security;
-	struct sk_security_struct *sksec_new = newsk->sk_security;
+	struct sk_security_struct *sksec_sock = selinux_sock(sock);
+	struct sk_security_struct *sksec_other = selinux_sock(other);
+	struct sk_security_struct *sksec_new = selinux_sock(newsk);
 	struct common_audit_data ad;
 	struct lsm_network_audit net = {0,};
 	int err;
@@ -4912,8 +4912,8 @@ static int selinux_socket_unix_stream_connect(struct sock *sock,
 static int selinux_socket_unix_may_send(struct socket *sock,
 					struct socket *other)
 {
-	struct sk_security_struct *ssec = sock->sk->sk_security;
-	struct sk_security_struct *osec = other->sk->sk_security;
+	struct sk_security_struct *ssec = selinux_sock(sock->sk);
+	struct sk_security_struct *osec = selinux_sock(other->sk);
 	struct common_audit_data ad;
 	struct lsm_network_audit net = {0,};
 
@@ -4955,7 +4955,7 @@ static int selinux_sock_rcv_skb_compat(struct sock *sk, struct sk_buff *skb,
 				       u16 family)
 {
 	int err = 0;
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 	u32 sk_sid = sksec->sid;
 	struct common_audit_data ad;
 	struct lsm_network_audit net = {0,};
@@ -4988,7 +4988,7 @@ static int selinux_sock_rcv_skb_compat(struct sock *sk, struct sk_buff *skb,
 static int selinux_socket_sock_rcv_skb(struct sock *sk, struct sk_buff *skb)
 {
 	int err;
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 	u16 family = sk->sk_family;
 	u32 sk_sid = sksec->sid;
 	struct common_audit_data ad;
@@ -5056,13 +5056,15 @@ static int selinux_socket_sock_rcv_skb(struct sock *sk, struct sk_buff *skb)
 	return err;
 }
 
-static int selinux_socket_getpeersec_stream(struct socket *sock, char __user *optval,
-					    int __user *optlen, unsigned len)
+static int selinux_socket_getpeersec_stream(struct socket *sock,
+					    char __user *optval,
+					    int __user *optlen,
+					    unsigned int len)
 {
 	int err = 0;
 	char *scontext;
 	u32 scontext_len;
-	struct sk_security_struct *sksec = sock->sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sock->sk);
 	u32 peer_sid = SECSID_NULL;
 
 	if (sksec->sclass == SECCLASS_UNIX_STREAM_SOCKET ||
@@ -5122,34 +5124,27 @@ static int selinux_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *
 
 static int selinux_sk_alloc_security(struct sock *sk, int family, gfp_t priority)
 {
-	struct sk_security_struct *sksec;
-
-	sksec = kzalloc(sizeof(*sksec), priority);
-	if (!sksec)
-		return -ENOMEM;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 
 	sksec->peer_sid = SECINITSID_UNLABELED;
 	sksec->sid = SECINITSID_UNLABELED;
 	sksec->sclass = SECCLASS_SOCKET;
 	selinux_netlbl_sk_security_reset(sksec);
-	sk->sk_security = sksec;
 
 	return 0;
 }
 
 static void selinux_sk_free_security(struct sock *sk)
 {
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 
-	sk->sk_security = NULL;
 	selinux_netlbl_sk_security_free(sksec);
-	kfree(sksec);
 }
 
 static void selinux_sk_clone_security(const struct sock *sk, struct sock *newsk)
 {
-	struct sk_security_struct *sksec = sk->sk_security;
-	struct sk_security_struct *newsksec = newsk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
+	struct sk_security_struct *newsksec = selinux_sock(newsk);
 
 	newsksec->sid = sksec->sid;
 	newsksec->peer_sid = sksec->peer_sid;
@@ -5163,7 +5158,7 @@ static void selinux_sk_getsecid(struct sock *sk, u32 *secid)
 	if (!sk)
 		*secid = SECINITSID_ANY_SOCKET;
 	else {
-		struct sk_security_struct *sksec = sk->sk_security;
+		struct sk_security_struct *sksec = selinux_sock(sk);
 
 		*secid = sksec->sid;
 	}
@@ -5173,7 +5168,7 @@ static void selinux_sock_graft(struct sock *sk, struct socket *parent)
 {
 	struct inode_security_struct *isec =
 		inode_security_novalidate(SOCK_INODE(parent));
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 
 	if (sk->sk_family == PF_INET || sk->sk_family == PF_INET6 ||
 	    sk->sk_family == PF_UNIX)
@@ -5188,7 +5183,7 @@ static void selinux_sock_graft(struct sock *sk, struct socket *parent)
 static int selinux_sctp_assoc_request(struct sctp_endpoint *ep,
 				      struct sk_buff *skb)
 {
-	struct sk_security_struct *sksec = ep->base.sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(ep->base.sk);
 	struct common_audit_data ad;
 	struct lsm_network_audit net = {0,};
 	u8 peerlbl_active;
@@ -5339,8 +5334,8 @@ static int selinux_sctp_bind_connect(struct sock *sk, int optname,
 static void selinux_sctp_sk_clone(struct sctp_endpoint *ep, struct sock *sk,
 				  struct sock *newsk)
 {
-	struct sk_security_struct *sksec = sk->sk_security;
-	struct sk_security_struct *newsksec = newsk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
+	struct sk_security_struct *newsksec = selinux_sock(newsk);
 
 	/* If policy does not support SECCLASS_SCTP_SOCKET then call
 	 * the non-sctp clone version.
@@ -5357,7 +5352,7 @@ static void selinux_sctp_sk_clone(struct sctp_endpoint *ep, struct sock *sk,
 static int selinux_inet_conn_request(struct sock *sk, struct sk_buff *skb,
 				     struct request_sock *req)
 {
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 	int err;
 	u16 family = req->rsk_ops->family;
 	u32 connsid;
@@ -5378,7 +5373,7 @@ static int selinux_inet_conn_request(struct sock *sk, struct sk_buff *skb,
 static void selinux_inet_csk_clone(struct sock *newsk,
 				   const struct request_sock *req)
 {
-	struct sk_security_struct *newsksec = newsk->sk_security;
+	struct sk_security_struct *newsksec = selinux_sock(newsk);
 
 	newsksec->sid = req->secid;
 	newsksec->peer_sid = req->peer_secid;
@@ -5395,7 +5390,7 @@ static void selinux_inet_csk_clone(struct sock *newsk,
 static void selinux_inet_conn_established(struct sock *sk, struct sk_buff *skb)
 {
 	u16 family = sk->sk_family;
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 
 	/* handle mapped IPv4 packets arriving via IPv6 sockets */
 	if (family == PF_INET6 && skb->protocol == htons(ETH_P_IP))
@@ -5479,7 +5474,7 @@ static int selinux_tun_dev_attach_queue(void *security)
 static int selinux_tun_dev_attach(struct sock *sk, void *security)
 {
 	struct tun_security_struct *tunsec = security;
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 
 	/* we don't currently perform any NetLabel based labeling here and it
 	 * isn't clear that we would want to do so anyway; while we could apply
@@ -5520,7 +5515,7 @@ static int selinux_nlmsg_perm(struct sock *sk, struct sk_buff *skb)
 	int err = 0;
 	u32 perm;
 	struct nlmsghdr *nlh;
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 
 	if (skb->len < NLMSG_HDRLEN) {
 		err = -EINVAL;
@@ -5661,7 +5656,7 @@ static unsigned int selinux_ip_output(struct sk_buff *skb,
 			return NF_ACCEPT;
 
 		/* standard practice, label using the parent socket */
-		sksec = sk->sk_security;
+		sksec = selinux_sock(sk);
 		sid = sksec->sid;
 	} else
 		sid = SECINITSID_KERNEL;
@@ -5700,7 +5695,7 @@ static unsigned int selinux_ip_postroute_compat(struct sk_buff *skb,
 
 	if (sk == NULL)
 		return NF_ACCEPT;
-	sksec = sk->sk_security;
+	sksec = selinux_sock(sk);
 
 	ad.type = LSM_AUDIT_DATA_NET;
 	ad.u.net = &net;
@@ -5792,7 +5787,7 @@ static unsigned int selinux_ip_postroute(struct sk_buff *skb,
 		u32 skb_sid;
 		struct sk_security_struct *sksec;
 
-		sksec = sk->sk_security;
+		sksec = selinux_sock(sk);
 		if (selinux_skb_peerlbl_sid(skb, family, &skb_sid))
 			return NF_DROP;
 		/* At this point, if the returned skb peerlbl is SECSID_NULL
@@ -5821,7 +5816,7 @@ static unsigned int selinux_ip_postroute(struct sk_buff *skb,
 	} else {
 		/* Locally generated packet, fetch the security label from the
 		 * associated socket. */
-		struct sk_security_struct *sksec = sk->sk_security;
+		struct sk_security_struct *sksec = selinux_sock(sk);
 		peer_sid = sksec->sid;
 		secmark_perm = PACKET__SEND;
 	}
@@ -6801,6 +6796,7 @@ struct lsm_blob_sizes selinux_blob_sizes __lsm_ro_after_init = {
 	.lbs_inode = sizeof(struct inode_security_struct),
 	.lbs_ipc = sizeof(struct ipc_security_struct),
 	.lbs_msg_msg = sizeof(struct msg_security_struct),
+	.lbs_sock = sizeof(struct sk_security_struct),
 };
 
 #ifdef CONFIG_PERF_EVENTS
diff --git a/security/selinux/include/objsec.h b/security/selinux/include/objsec.h
index a4a86cbcfb0a..572c88700393 100644
--- a/security/selinux/include/objsec.h
+++ b/security/selinux/include/objsec.h
@@ -189,4 +189,9 @@ static inline u32 current_sid(void)
 	return tsec->sid;
 }
 
+static inline struct sk_security_struct *selinux_sock(const struct sock *sock)
+{
+	return sock->sk_security + selinux_blob_sizes.lbs_sock;
+}
+
 #endif /* _SELINUX_OBJSEC_H_ */
diff --git a/security/selinux/netlabel.c b/security/selinux/netlabel.c
index abaab7683840..6a94b31b5472 100644
--- a/security/selinux/netlabel.c
+++ b/security/selinux/netlabel.c
@@ -17,6 +17,7 @@
 #include <linux/gfp.h>
 #include <linux/ip.h>
 #include <linux/ipv6.h>
+#include <linux/lsm_hooks.h>
 #include <net/sock.h>
 #include <net/netlabel.h>
 #include <net/ip.h>
@@ -67,7 +68,7 @@ static int selinux_netlbl_sidlookup_cached(struct sk_buff *skb,
 static struct netlbl_lsm_secattr *selinux_netlbl_sock_genattr(struct sock *sk)
 {
 	int rc;
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 	struct netlbl_lsm_secattr *secattr;
 
 	if (sksec->nlbl_secattr != NULL)
@@ -100,7 +101,7 @@ static struct netlbl_lsm_secattr *selinux_netlbl_sock_getattr(
 							const struct sock *sk,
 							u32 sid)
 {
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 	struct netlbl_lsm_secattr *secattr = sksec->nlbl_secattr;
 
 	if (secattr == NULL)
@@ -235,7 +236,7 @@ int selinux_netlbl_skbuff_setsid(struct sk_buff *skb,
 	 * being labeled by it's parent socket, if it is just exit */
 	sk = skb_to_full_sk(skb);
 	if (sk != NULL) {
-		struct sk_security_struct *sksec = sk->sk_security;
+		struct sk_security_struct *sksec = selinux_sock(sk);
 
 		if (sksec->nlbl_state != NLBL_REQSKB)
 			return 0;
@@ -273,7 +274,7 @@ int selinux_netlbl_sctp_assoc_request(struct sctp_endpoint *ep,
 {
 	int rc;
 	struct netlbl_lsm_secattr secattr;
-	struct sk_security_struct *sksec = ep->base.sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(ep->base.sk);
 	struct sockaddr_in addr4;
 	struct sockaddr_in6 addr6;
 
@@ -352,7 +353,7 @@ int selinux_netlbl_inet_conn_request(struct request_sock *req, u16 family)
  */
 void selinux_netlbl_inet_csk_clone(struct sock *sk, u16 family)
 {
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 
 	if (family == PF_INET)
 		sksec->nlbl_state = NLBL_LABELED;
@@ -370,8 +371,8 @@ void selinux_netlbl_inet_csk_clone(struct sock *sk, u16 family)
  */
 void selinux_netlbl_sctp_sk_clone(struct sock *sk, struct sock *newsk)
 {
-	struct sk_security_struct *sksec = sk->sk_security;
-	struct sk_security_struct *newsksec = newsk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
+	struct sk_security_struct *newsksec = selinux_sock(newsk);
 
 	newsksec->nlbl_state = sksec->nlbl_state;
 }
@@ -389,7 +390,7 @@ void selinux_netlbl_sctp_sk_clone(struct sock *sk, struct sock *newsk)
 int selinux_netlbl_socket_post_create(struct sock *sk, u16 family)
 {
 	int rc;
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 	struct netlbl_lsm_secattr *secattr;
 
 	if (family != PF_INET && family != PF_INET6)
@@ -504,7 +505,7 @@ int selinux_netlbl_socket_setsockopt(struct socket *sock,
 {
 	int rc = 0;
 	struct sock *sk = sock->sk;
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 	struct netlbl_lsm_secattr secattr;
 
 	if (selinux_netlbl_option(level, optname) &&
@@ -542,7 +543,7 @@ static int selinux_netlbl_socket_connect_helper(struct sock *sk,
 						struct sockaddr *addr)
 {
 	int rc;
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 	struct netlbl_lsm_secattr *secattr;
 
 	/* connected sockets are allowed to disconnect when the address family
@@ -581,7 +582,7 @@ static int selinux_netlbl_socket_connect_helper(struct sock *sk,
 int selinux_netlbl_socket_connect_locked(struct sock *sk,
 					 struct sockaddr *addr)
 {
-	struct sk_security_struct *sksec = sk->sk_security;
+	struct sk_security_struct *sksec = selinux_sock(sk);
 
 	if (sksec->nlbl_state != NLBL_REQSKB &&
 	    sksec->nlbl_state != NLBL_CONNLABELED)
diff --git a/security/smack/smack.h b/security/smack/smack.h
index 62529f382942..2836540f9577 100644
--- a/security/smack/smack.h
+++ b/security/smack/smack.h
@@ -372,6 +372,11 @@ static inline struct smack_known **smack_ipc(const struct kern_ipc_perm *ipc)
 	return ipc->security + smack_blob_sizes.lbs_ipc;
 }
 
+static inline struct socket_smack *smack_sock(const struct sock *sock)
+{
+	return sock->sk_security + smack_blob_sizes.lbs_sock;
+}
+
 /*
  * Is the directory transmuting?
  */
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index ecea41ce919b..4cecdfdcd913 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -1455,7 +1455,7 @@ static int smack_inode_getsecurity(struct inode *inode,
 		if (sock == NULL || sock->sk == NULL)
 			return -EOPNOTSUPP;
 
-		ssp = sock->sk->sk_security;
+		ssp = smack_sock(sock->sk);
 
 		if (strcmp(name, XATTR_SMACK_IPIN) == 0)
 			isp = ssp->smk_in;
@@ -1837,7 +1837,7 @@ static int smack_file_receive(struct file *file)
 
 	if (inode->i_sb->s_magic == SOCKFS_MAGIC) {
 		sock = SOCKET_I(inode);
-		ssp = sock->sk->sk_security;
+		ssp = smack_sock(sock->sk);
 		tsp = smack_cred(current_cred());
 		/*
 		 * If the receiving process can't write to the
@@ -2244,11 +2244,7 @@ static void smack_task_to_inode(struct task_struct *p, struct inode *inode)
 static int smack_sk_alloc_security(struct sock *sk, int family, gfp_t gfp_flags)
 {
 	struct smack_known *skp = smk_of_current();
-	struct socket_smack *ssp;
-
-	ssp = kzalloc(sizeof(struct socket_smack), gfp_flags);
-	if (ssp == NULL)
-		return -ENOMEM;
+	struct socket_smack *ssp = smack_sock(sk);
 
 	/*
 	 * Sockets created by kernel threads receive web label.
@@ -2262,11 +2258,10 @@ static int smack_sk_alloc_security(struct sock *sk, int family, gfp_t gfp_flags)
 	}
 	ssp->smk_packet = NULL;
 
-	sk->sk_security = ssp;
-
 	return 0;
 }
 
+#ifdef SMACK_IPV6_PORT_LABELING
 /**
  * smack_sk_free_security - Free a socket blob
  * @sk: the socket
@@ -2275,7 +2270,6 @@ static int smack_sk_alloc_security(struct sock *sk, int family, gfp_t gfp_flags)
  */
 static void smack_sk_free_security(struct sock *sk)
 {
-#ifdef SMACK_IPV6_PORT_LABELING
 	struct smk_port_label *spp;
 
 	if (sk->sk_family == PF_INET6) {
@@ -2288,9 +2282,8 @@ static void smack_sk_free_security(struct sock *sk)
 		}
 		rcu_read_unlock();
 	}
-#endif
-	kfree(sk->sk_security);
 }
+#endif
 
 /**
 * smack_ipv4host_label - check host based restrictions
@@ -2408,7 +2401,7 @@ static struct smack_known *smack_ipv6host_label(struct sockaddr_in6 *sip)
 static int smack_netlabel(struct sock *sk, int labeled)
 {
 	struct smack_known *skp;
-	struct socket_smack *ssp = sk->sk_security;
+	struct socket_smack *ssp = smack_sock(sk);
 	int rc = 0;
 
 	/*
@@ -2453,7 +2446,7 @@ static int smack_netlabel_send(struct sock *sk, struct sockaddr_in *sap)
 	int rc;
 	int sk_lbl;
 	struct smack_known *hkp;
-	struct socket_smack *ssp = sk->sk_security;
+	struct socket_smack *ssp = smack_sock(sk);
 	struct smk_audit_info ad;
 
 	rcu_read_lock();
@@ -2529,7 +2522,7 @@ static void smk_ipv6_port_label(struct socket *sock, struct sockaddr *address)
 {
 	struct sock *sk = sock->sk;
 	struct sockaddr_in6 *addr6;
-	struct socket_smack *ssp = sock->sk->sk_security;
+	struct socket_smack *ssp = smack_sock(sock->sk);
 	struct smk_port_label *spp;
 	unsigned short port = 0;
 
@@ -2617,7 +2610,7 @@ static int smk_ipv6_port_check(struct sock *sk, struct sockaddr_in6 *address,
 				int act)
 {
 	struct smk_port_label *spp;
-	struct socket_smack *ssp = sk->sk_security;
+	struct socket_smack *ssp = smack_sock(sk);
 	struct smack_known *skp = NULL;
 	unsigned short port;
 	struct smack_known *object;
@@ -2711,7 +2704,7 @@ static int smack_inode_setsecurity(struct inode *inode, const char *name,
 	if (sock == NULL || sock->sk == NULL)
 		return -EOPNOTSUPP;
 
-	ssp = sock->sk->sk_security;
+	ssp = smack_sock(sock->sk);
 
 	if (strcmp(name, XATTR_SMACK_IPIN) == 0)
 		ssp->smk_in = skp;
@@ -2759,7 +2752,7 @@ static int smack_socket_post_create(struct socket *sock, int family,
 	 * Sockets created by kernel threads receive web label.
 	 */
 	if (unlikely(current->flags & PF_KTHREAD)) {
-		ssp = sock->sk->sk_security;
+		ssp = smack_sock(sock->sk);
 		ssp->smk_in = &smack_known_web;
 		ssp->smk_out = &smack_known_web;
 	}
@@ -2784,8 +2777,8 @@ static int smack_socket_post_create(struct socket *sock, int family,
 static int smack_socket_socketpair(struct socket *socka,
 		                   struct socket *sockb)
 {
-	struct socket_smack *asp = socka->sk->sk_security;
-	struct socket_smack *bsp = sockb->sk->sk_security;
+	struct socket_smack *asp = smack_sock(socka->sk);
+	struct socket_smack *bsp = smack_sock(sockb->sk);
 
 	asp->smk_packet = bsp->smk_out;
 	bsp->smk_packet = asp->smk_out;
@@ -2843,7 +2836,7 @@ static int smack_socket_connect(struct socket *sock, struct sockaddr *sap,
 		return 0;
 
 #ifdef SMACK_IPV6_SECMARK_LABELING
-	ssp = sock->sk->sk_security;
+	ssp = smack_sock(sock->sk);
 #endif
 
 	switch (sock->sk->sk_family) {
@@ -3585,9 +3578,9 @@ static int smack_unix_stream_connect(struct sock *sock,
 {
 	struct smack_known *skp;
 	struct smack_known *okp;
-	struct socket_smack *ssp = sock->sk_security;
-	struct socket_smack *osp = other->sk_security;
-	struct socket_smack *nsp = newsk->sk_security;
+	struct socket_smack *ssp = smack_sock(sock);
+	struct socket_smack *osp = smack_sock(other);
+	struct socket_smack *nsp = smack_sock(newsk);
 	struct smk_audit_info ad;
 	int rc = 0;
 #ifdef CONFIG_AUDIT
@@ -3633,8 +3626,8 @@ static int smack_unix_stream_connect(struct sock *sock,
  */
 static int smack_unix_may_send(struct socket *sock, struct socket *other)
 {
-	struct socket_smack *ssp = sock->sk->sk_security;
-	struct socket_smack *osp = other->sk->sk_security;
+	struct socket_smack *ssp = smack_sock(sock->sk);
+	struct socket_smack *osp = smack_sock(other->sk);
 	struct smk_audit_info ad;
 	int rc;
 
@@ -3671,7 +3664,7 @@ static int smack_socket_sendmsg(struct socket *sock, struct msghdr *msg,
 	struct sockaddr_in6 *sap = (struct sockaddr_in6 *) msg->msg_name;
 #endif
 #ifdef SMACK_IPV6_SECMARK_LABELING
-	struct socket_smack *ssp = sock->sk->sk_security;
+	struct socket_smack *ssp = smack_sock(sock->sk);
 	struct smack_known *rsp;
 #endif
 	int rc = 0;
@@ -3844,7 +3837,7 @@ static int smk_skb_to_addr_ipv6(struct sk_buff *skb, struct sockaddr_in6 *sip)
 static int smack_socket_sock_rcv_skb(struct sock *sk, struct sk_buff *skb)
 {
 	struct netlbl_lsm_secattr secattr;
-	struct socket_smack *ssp = sk->sk_security;
+	struct socket_smack *ssp = smack_sock(sk);
 	struct smack_known *skp = NULL;
 	int rc = 0;
 	struct smk_audit_info ad;
@@ -3965,7 +3958,7 @@ static int smack_socket_getpeersec_stream(struct socket *sock,
 	int slen = 1;
 	int rc = 0;
 
-	ssp = sock->sk->sk_security;
+	ssp = smack_sock(sock->sk);
 	if (ssp->smk_packet != NULL) {
 		rcp = ssp->smk_packet->smk_known;
 		slen = strlen(rcp) + 1;
@@ -4015,7 +4008,7 @@ static int smack_socket_getpeersec_dgram(struct socket *sock,
 
 	switch (family) {
 	case PF_UNIX:
-		ssp = sock->sk->sk_security;
+		ssp = smack_sock(sock->sk);
 		s = ssp->smk_out->smk_secid;
 		break;
 	case PF_INET:
@@ -4028,7 +4021,7 @@ static int smack_socket_getpeersec_dgram(struct socket *sock,
 		 * Translate what netlabel gave us.
 		 */
 		if (sock != NULL && sock->sk != NULL)
-			ssp = sock->sk->sk_security;
+			ssp = smack_sock(sock->sk);
 		netlbl_secattr_init(&secattr);
 		rc = netlbl_skbuff_getattr(skb, family, &secattr);
 		if (rc == 0) {
@@ -4066,7 +4059,7 @@ static void smack_sock_graft(struct sock *sk, struct socket *parent)
 	    (sk->sk_family != PF_INET && sk->sk_family != PF_INET6))
 		return;
 
-	ssp = sk->sk_security;
+	ssp = smack_sock(sk);
 	ssp->smk_in = skp;
 	ssp->smk_out = skp;
 	/* cssp->smk_packet is already set in smack_inet_csk_clone() */
@@ -4086,7 +4079,7 @@ static int smack_inet_conn_request(struct sock *sk, struct sk_buff *skb,
 {
 	u16 family = sk->sk_family;
 	struct smack_known *skp;
-	struct socket_smack *ssp = sk->sk_security;
+	struct socket_smack *ssp = smack_sock(sk);
 	struct netlbl_lsm_secattr secattr;
 	struct sockaddr_in addr;
 	struct iphdr *hdr;
@@ -4185,7 +4178,7 @@ static int smack_inet_conn_request(struct sock *sk, struct sk_buff *skb,
 static void smack_inet_csk_clone(struct sock *sk,
 				 const struct request_sock *req)
 {
-	struct socket_smack *ssp = sk->sk_security;
+	struct socket_smack *ssp = smack_sock(sk);
 	struct smack_known *skp;
 
 	if (req->peer_secid != 0) {
@@ -4589,6 +4582,7 @@ struct lsm_blob_sizes smack_blob_sizes __lsm_ro_after_init = {
 	.lbs_inode = sizeof(struct inode_smack),
 	.lbs_ipc = sizeof(struct smack_known *),
 	.lbs_msg_msg = sizeof(struct smack_known *),
+	.lbs_sock = sizeof(struct socket_smack),
 };
 
 static struct security_hook_list smack_hooks[] __lsm_ro_after_init = {
@@ -4698,7 +4692,9 @@ static struct security_hook_list smack_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(socket_getpeersec_stream, smack_socket_getpeersec_stream),
 	LSM_HOOK_INIT(socket_getpeersec_dgram, smack_socket_getpeersec_dgram),
 	LSM_HOOK_INIT(sk_alloc_security, smack_sk_alloc_security),
+#ifdef SMACK_IPV6_PORT_LABELING
 	LSM_HOOK_INIT(sk_free_security, smack_sk_free_security),
+#endif
 	LSM_HOOK_INIT(sock_graft, smack_sock_graft),
 	LSM_HOOK_INIT(inet_conn_request, smack_inet_conn_request),
 	LSM_HOOK_INIT(inet_csk_clone, smack_inet_csk_clone),
diff --git a/security/smack/smack_netfilter.c b/security/smack/smack_netfilter.c
index fc7399b45373..635e2339579e 100644
--- a/security/smack/smack_netfilter.c
+++ b/security/smack/smack_netfilter.c
@@ -28,8 +28,8 @@ static unsigned int smack_ipv6_output(void *priv,
 	struct socket_smack *ssp;
 	struct smack_known *skp;
 
-	if (sk && sk->sk_security) {
-		ssp = sk->sk_security;
+	if (sk && smack_sock(sk)) {
+		ssp = smack_sock(sk);
 		skp = ssp->smk_out;
 		skb->secmark = skp->smk_secid;
 	}
@@ -46,8 +46,8 @@ static unsigned int smack_ipv4_output(void *priv,
 	struct socket_smack *ssp;
 	struct smack_known *skp;
 
-	if (sk && sk->sk_security) {
-		ssp = sk->sk_security;
+	if (sk && smack_sock(sk)) {
+		ssp = smack_sock(sk);
 		skp = ssp->smk_out;
 		skb->secmark = skp->smk_secid;
 	}
-- 
2.20.1

