Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB2512A4D5
	for <lists+selinux@lfdr.de>; Wed, 25 Dec 2019 01:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbfLYAA2 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 24 Dec 2019 19:00:28 -0500
Received: from sonic306-28.consmr.mail.ne1.yahoo.com ([66.163.189.90]:34815
        "EHLO sonic306-28.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726225AbfLYAA2 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 24 Dec 2019 19:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1577232026; bh=mNREEvMLF61pXDTvzXza9VvuF2gKQ2TelzUlK4DktMQ=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=KhEiD/SYfOuSODa8zYCNF9Bx8SsqIMIpR38GMiIWyQFEhbMQ2QQd6RnqLHAOQv7036Cnt78lZFe0ktLMnn//1wSwNN/nnYV/8uB8XAjtT8IfsDwLWdZFNp70uoSfqjELTYbNjurGl62XTktI8qVD4kMd5TtPzg8b6Rpv/Gh+FlRSn/vNulpBm7YDGHZ69Itek7pJUvP8NkeAJB5XaL3xhBkF8UgAlfoymXEqGH7NeLHrgHXzQSWQXbhwARTKZ3dDffWVu/2R/fWzCRmYN2l5kh0/GXO83h8jDXrXUikbhB6Yebv4i7Qwtd6wgXtvrXnuGh7N7nWnybxAyOgRt/qpsA==
X-YMail-OSG: NX857QgVM1n8CZCBEHFyARa3RqUi8fKXTcHhjHm4VL8Texa4.twpmaWPvUGc0UO
 _If5BNU2rvsp0gAKGtUjepGkz.sRHhDNprddKOJOWb9Rv3mww_HZCf73bjiZk53h.wLxaWjnZGEL
 C3RGxwOn6crUDIEtZ3VJZsmlMQlwgpuWFFBDpLGMYscJDHT6zu3r_3VQ6RJxhMtmf3vO8.ZaDOra
 wMn0DsSOj6QDrrGsutNsFh5DTLRlnJPjwmquH78ecT01eukYVl.W8C8zzTFZLioICi8TnQ6mY5U.
 TQWBs_1cTeXFrp9uQTtiT6pBGCsJQVIxd0ZzFAqiDCrdCqmjA3_jT4IM66cQVDSepdZLACZ4BlcO
 y1N5m29ZzJfdi2KeWam9s.Bhsz7raYzyFzZGcw0q4o.Ov_Fsbjds1lpICSZO6UP1HNELsPO1R99R
 rc8wLKcOWUDwzdNBC4LNhhwy.hPx4skctcmRKAjLernlPhzJrX54vs7TX7F528YMXi5ZhK5hbZ.V
 zl9ufznrASQQpuK20LOOyh448pAzB9cGyTxqsRaJJ7FbYTTChipX3SP2UuBUfv_3_nKMBFg.oGwX
 LJk0ax4Ad6r8cQRCawOB3U4pxx85ZI5RqbzloSj05lWVTS6VeKAFN8PrOCqKy91Z3__hwaRusHVz
 .bR_Q2bxRomeMajgH0NBBsnoB4.NYhEfJtbZV89IPo4Jyiilt4rBwlnBEwQ4XJBAOhX4d99qLmHd
 o79BzSasyeWhhBAGiHz2JOjq8kdv9SGAfsysi0x.P5404p_CvyZZpAuQ2Qjj7rtlHmTUWjWhJMMn
 v8WpFo1X2pmIG_Ae7K_AgbOrTI0xKtiLjIaKih.vaavfaZF5rTDp9JvckLnKiB6CMBXiZR5164vd
 w9gIbrJoMf.MKVDdC5aOoWBV8slqoSjwEQTQVFuOjkvgTIPVbVi2fego_r.Fy7VJL3ItjNsqsBTx
 GCgcEKoIgo.La.1msw9d7pXVPLwskRz8gJSYtaylfDEo7KO40zmADcAkXXvRHLvu.2ngktCqtJBO
 LO8AjyWcNwFZY6x8f0OKxXcLAPJfLaczfVBHo1TUyI7_6ve6bo9nvEtOfWkRmBQJ2ic.20.6oLrF
 mHXkzE2pXNzsQoRv7rZMwK3QdgWPPPOEtwi9EKCRH4bx6vuIVJduSpevSOncQ.u0QxnQzIpP96jk
 TK.oJMO6OaDTe4pyGbxsr7.ubdvDDpWyVEOwqM1lL2zBrJvAjZCYrS7ygl7DKYk38Dpq55.gvioY
 Bbk8Qfu0nyLwpQ7OoGZ6oQ1HJoxtleQEf0e3tcf0gwQOgLFnzeBaYu9swhgVvCOPg9b0og268aBY
 BqD2SYBXUTy3HIk74FvL2i.NFUHFoobbkiA3wW6bP.KLdIfdIZ7HtloYSEZv6VUF2O3VvbluVipK
 bf4VQNGjW7tG4Sx5VnNMe9R9.5xgFwI1ZzRJzbzvNIZOCJo7sWW_dJm1d64Hb5afmERWa42O7DBQ
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Dec 2019 00:00:26 +0000
Received: by smtp421.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 9f51ac67b3903eb00da6f8340730a4c1;
          Wed, 25 Dec 2019 00:00:22 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH v13 05/25] net: Prepare UDS for security module stacking
Date:   Tue, 24 Dec 2019 15:59:19 -0800
Message-Id: <20191224235939.7483-6-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191224235939.7483-1-casey@schaufler-ca.com>
References: <20191224235939.7483-1-casey@schaufler-ca.com>
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

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
cc: netdev@vger.kernel.org
---
 include/linux/security.h |  7 +++++--
 include/net/af_unix.h    |  2 +-
 include/net/scm.h        |  8 +++++---
 net/ipv4/ip_sockglue.c   |  8 +++++---
 net/unix/af_unix.c       |  6 +++---
 security/security.c      | 18 +++++++++++++++---
 6 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 322ed9622819..995faba7393f 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1356,7 +1356,8 @@ int security_socket_shutdown(struct socket *sock, int how);
 int security_sock_rcv_skb(struct sock *sk, struct sk_buff *skb);
 int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
 				      int __user *optlen, unsigned len);
-int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid);
+int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
+				     struct lsmblob *blob);
 int security_sk_alloc(struct sock *sk, int family, gfp_t priority);
 void security_sk_free(struct sock *sk);
 void security_sk_clone(const struct sock *sk, struct sock *newsk);
@@ -1494,7 +1495,9 @@ static inline int security_socket_getpeersec_stream(struct socket *sock, char __
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
index 3426d6dacc45..933492c08b8c 100644
--- a/include/net/af_unix.h
+++ b/include/net/af_unix.h
@@ -36,7 +36,7 @@ struct unix_skb_parms {
 	kgid_t			gid;
 	struct scm_fp_list	*fp;		/* Passed files		*/
 #ifdef CONFIG_SECURITY_NETWORK
-	u32			secid;		/* Security ID		*/
+	struct lsmblob		lsmblob;	/* Security LSM data	*/
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
index 774babbee045..f0b1d741ab6c 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -138,17 +138,17 @@ static struct hlist_head *unix_sockets_unbound(void *addr)
 #ifdef CONFIG_SECURITY_NETWORK
 static void unix_get_secdata(struct scm_cookie *scm, struct sk_buff *skb)
 {
-	UNIXCB(skb).secid = scm->secid;
+	UNIXCB(skb).lsmblob = scm->lsmblob;
 }
 
 static inline void unix_set_secdata(struct scm_cookie *scm, struct sk_buff *skb)
 {
-	scm->secid = UNIXCB(skb).secid;
+	scm->lsmblob = UNIXCB(skb).lsmblob;
 }
 
 static inline bool unix_secdata_eq(struct scm_cookie *scm, struct sk_buff *skb)
 {
-	return (scm->secid == UNIXCB(skb).secid);
+	return lsmblob_equal(&scm->lsmblob, &(UNIXCB(skb).lsmblob));
 }
 #else
 static inline void unix_get_secdata(struct scm_cookie *scm, struct sk_buff *skb)
diff --git a/security/security.c b/security/security.c
index 674042c6f03f..33563963cd45 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2108,10 +2108,22 @@ int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
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
2.20.1

