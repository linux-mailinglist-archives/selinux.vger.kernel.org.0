Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 459E677524
	for <lists+selinux@lfdr.de>; Sat, 27 Jul 2019 01:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbfGZXjw (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 26 Jul 2019 19:39:52 -0400
Received: from sonic310-23.consmr.mail.bf2.yahoo.com ([74.6.135.197]:35807
        "EHLO sonic310-23.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727986AbfGZXjw (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 26 Jul 2019 19:39:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1564184389; bh=ezn0sAoC+A1v6pn47MLw4RlN9rQVVAYE18gdC/0yaSM=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=qVcJJTSpoAMmARnf9QbjLxhDHfIwqNSb00LaSVra/Ir/rD7Zt5i5P2I4N6+nG2s/7xBua0Pu4sEWkAlTFe4hkOkQgd8Li19TvdN0opdN22sAWL942cUCIgu7+cJPouyvD28pMmKPwlECss8CeutYTkhc4Z4VaSHOoHbfCIHRXsbiOEW0IZkvCGAdPbeerI9wNDStO2u8Myz/f7MCDcP2V3l4oDk2Ft8PO3u+NakSWLVWim+l6qr1rKHcJ/f+U4F3Fi2PuooWJPdgNkJM0bRyV6wcmHE8nsvz7zqSEqdUtq6tctnTlYc7Xki3+DtZhY0BP4qswTcgDXt11T5PnIGGoQ==
X-YMail-OSG: r485x4YVM1kMmN8x5MoXg_NX.3Vqt2.lT8wI_Nv0UNmuyqjadWVtAaMvgI17ozE
 JMhi9M1B59IyfmWxJiN36gfVfMdmYXXKuYL3qntz9fjSkXt0fwUkxjMxtr0a1lm_AxM1sKiH3eUJ
 MSDKxzjS6TqhRl8tTr3D08ZBLtdEk23.Nsb8AnYJfwREUR_EDJD9dqJ_8spcb4kUsWjkpthOuN2D
 ANko0tqm7SpqzUu.Cs5QG5XOGhQb30YQ5wNNqIjmWE3PP_57M.mt75fb9wB3pJtUwfKRgR.rtJGj
 CairfOXSWMTYNKwXXPGDkUvNuIBzfN6A6HvctIrE0YqztSZgQ1oTJAMBXX9Dp6yfmSYg6Peqz870
 WdPZ7GtdSWFRwtdabU5zTBKPClFUFihxFj4KA8VnWzhfHafLey6R5pDgvZ10pi_t2lbY1ICI.iTe
 MYtfob6yDMGUorTXCvKNIIfBYBAGdE.KeGab58p6Ve7.EdIbeR1ezZeqGw.hOT4NgLLpos1ZaV9g
 LRL0JPsHBIe59ZQrCJ8iOdmXE2sPiAv3sNvyVqsLE7UUVd.bf9_5Vewppw.TEIo8wYcBIBau86fv
 rMXtjpqHP5Rd1UOiNGxnkV1yGtcHY7eROd.15yIgCLGWBxIKSuZlGD7A8C3Mh7hsDuMrG3KYDFmg
 RQhWZYwAgmHYQueHYK65C28HHi1wPsUBUw2l.GMbY9GbXKZFUrmhgouI6TjQCBLeWCxit68IjpOc
 8n2DDKFjC382oqk7kSvagVT7jteN4Dv0rchVx6FqGiQ.8ygwfbP9kIs9JsK7vhrBjs5Uct9u_bWI
 Uw0NqHQrR5Ef5z.inETO3B_kcqbYB6Gnookr.y6aHTPwoasu7CsN2OeSOk0osOa.YPPmT9IRP85z
 ee9gx0Mj2iHm1Cwuc0xvV55tzgKNL0Mz.9Xn5mOuWXkvJcUGma_.GklXuI3rvROnyq4jFgMKydM2
 uE_hPvyH2apX8STsy0cKnWjUSEFvNEiBoH_4ZhVIUCb54p6K0yQXEEIPH5e_8Ic0qYrT9RV36TJP
 5xhrsr9a3LIKCobPb9XZj3lpiDgjaFusDDmDg8u4FMlPC09MztVsxsmDBnU8lLfNNP1Gm8T1Qq4g
 pOklTTK2ymdtz87Spp8DAM5xU9P_KMcROVXjDmmmiGOZdM8_XoSQ4_6QJD0PD5H8fy_8ivyz0pU5
 ZpVEfn7La2orBeE7XAr9lHuSk.RzzQKsKuj6wn_wIRcu1xE6okbgjYtPN0lrj5nwDlraSudJeTSI
 AskbQLruVb1ttzf_GlBoPDpK4gmjvVEF5gljX2gGEoRS2_KM-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Fri, 26 Jul 2019 23:39:49 +0000
Received: by smtp416.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 223f61bb2347890e9e9f353c8afb834f;
          Fri, 26 Jul 2019 23:39:46 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH 15/27] LSM: Ensure the correct LSM context releaser
Date:   Fri, 26 Jul 2019 16:39:11 -0700
Message-Id: <20190726233923.2570-16-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726233923.2570-1-casey@schaufler-ca.com>
References: <20190726233923.2570-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Add a new lsmcontext data structure to hold all the information
about a "security context", including the string, its size and
which LSM allocated the string. The allocation information is
necessary because LSMs have different policies regarding the
lifecycle of these strings. SELinux allocates and destroys
them on each use, whereas Smack provides a pointer to an entry
in a list that never goes away.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 drivers/android/binder.c                | 10 +++++--
 fs/kernfs/dir.c                         | 10 +++++--
 fs/kernfs/inode.c                       |  7 +++--
 fs/nfs/nfs4proc.c                       |  8 +++--
 fs/nfsd/nfs4xdr.c                       |  7 +++--
 include/linux/security.h                | 39 +++++++++++++++++++++++--
 include/net/scm.h                       |  5 +++-
 kernel/audit.c                          | 14 ++++++---
 kernel/auditsc.c                        | 12 ++++++--
 net/ipv4/ip_sockglue.c                  |  4 ++-
 net/netfilter/nf_conntrack_netlink.c    |  4 ++-
 net/netfilter/nf_conntrack_standalone.c |  4 ++-
 net/netfilter/nfnetlink_queue.c         | 13 ++++++---
 net/netlabel/netlabel_unlabeled.c       | 19 +++++++++---
 net/netlabel/netlabel_user.c            |  4 ++-
 security/security.c                     | 18 ++++++++----
 security/smack/smack_lsm.c              | 14 ++++++---
 17 files changed, 148 insertions(+), 44 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 144ac4f1c24f..89e574be34cc 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -2876,6 +2876,7 @@ static void binder_transaction(struct binder_proc *proc,
 	int t_debug_id = atomic_inc_return(&binder_last_id);
 	char *secctx = NULL;
 	u32 secctx_sz = 0;
+	struct lsmcontext scaff; /* scaffolding */
 
 	e = binder_transaction_log_add(&binder_transaction_log);
 	e->debug_id = t_debug_id;
@@ -3158,7 +3159,8 @@ static void binder_transaction(struct binder_proc *proc,
 		binder_alloc_copy_to_buffer(&target_proc->alloc,
 					    t->buffer, buf_offset,
 					    secctx, secctx_sz);
-		security_release_secctx(secctx, secctx_sz);
+		lsmcontext_init(&scaff, secctx, secctx_sz, 0);
+		security_release_secctx(&scaff);
 		secctx = NULL;
 	}
 	t->buffer->debug_id = t->debug_id;
@@ -3479,8 +3481,10 @@ static void binder_transaction(struct binder_proc *proc,
 	t->buffer->transaction = NULL;
 	binder_alloc_free_buf(&target_proc->alloc, t->buffer);
 err_binder_alloc_buf_failed:
-	if (secctx)
-		security_release_secctx(secctx, secctx_sz);
+	if (secctx) {
+		lsmcontext_init(&scaff, secctx, secctx_sz, 0);
+		security_release_secctx(&scaff);
+	}
 err_get_secctx_failed:
 	kfree(tcomplete);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION_COMPLETE);
diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index b84d635567d3..c8362b6d556e 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -532,9 +532,13 @@ void kernfs_put(struct kernfs_node *kn)
 	kfree_const(kn->name);
 
 	if (kn->iattr) {
-		if (kn->iattr->ia_secdata)
-			security_release_secctx(kn->iattr->ia_secdata,
-						kn->iattr->ia_secdata_len);
+		struct lsmcontext scaff; /* scaffolding */
+
+		if (kn->iattr->ia_secdata) {
+			lsmcontext_init(&scaff, kn->iattr->ia_secdata,
+					kn->iattr->ia_secdata_len, 0);
+			security_release_secctx(&scaff);
+		}
 		simple_xattrs_free(&kn->iattr->xattrs);
 		kmem_cache_free(kernfs_iattrs_cache, kn->iattr);
 	}
diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index 0c1fd945ce42..02cde9dac5ee 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -349,6 +349,7 @@ static int kernfs_security_xattr_set(const struct xattr_handler *handler,
 {
 	struct kernfs_node *kn = inode->i_private;
 	struct kernfs_iattrs *attrs;
+	struct lsmcontext context;
 	void *secdata;
 	u32 secdata_len = 0;
 	int error;
@@ -368,8 +369,10 @@ static int kernfs_security_xattr_set(const struct xattr_handler *handler,
 	error = kernfs_node_setsecdata(attrs, &secdata, &secdata_len);
 	mutex_unlock(&kernfs_mutex);
 
-	if (secdata)
-		security_release_secctx(secdata, secdata_len);
+	if (secdata) {
+		lsmcontext_init(&context, secdata, secdata_len, 0);
+		security_release_secctx(&context);
+	}
 	return error;
 }
 
diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index 4dbb0ee23432..af1c0db29c39 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -131,8 +131,12 @@ nfs4_label_init_security(struct inode *dir, struct dentry *dentry,
 static inline void
 nfs4_label_release_security(struct nfs4_label *label)
 {
-	if (label)
-		security_release_secctx(label->label, label->len);
+	struct lsmcontext scaff; /* scaffolding */
+
+	if (label) {
+		lsmcontext_init(&scaff, label->label, label->len, 0);
+		security_release_secctx(&scaff);
+	}
 }
 static inline u32 *nfs4_bitmask(struct nfs_server *server, struct nfs4_label *label)
 {
diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index 3de42a729093..bb3db033e144 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -2420,6 +2420,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 	__be32 status;
 	int err;
 	struct nfs4_acl *acl = NULL;
+	struct lsmcontext scaff; /* scaffolding */
 	void *context = NULL;
 	int contextlen;
 	bool contextsupport = false;
@@ -2919,8 +2920,10 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 
 out:
 #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
-	if (context)
-		security_release_secctx(context, contextlen);
+	if (context) {
+		lsmcontext_init(&scaff, context, contextlen, 0); /*scaffolding*/
+		security_release_secctx(&scaff);
+	}
 #endif /* CONFIG_NFSD_V4_SECURITY_LABEL */
 	kfree(acl);
 	if (tempfh) {
diff --git a/include/linux/security.h b/include/linux/security.h
index d310fa3942ce..046012a7255f 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -76,6 +76,41 @@ enum lsm_event {
 	LSM_POLICY_CHANGE,
 };
 
+/*
+ * A "security context" is the text representation of
+ * the information used by LSMs.
+ * This structure contains the string, its length, and which LSM
+ * it is useful for.
+ */
+struct lsmcontext {
+	char	*context;	/* Provided by the module */
+	u32	len;
+	int	slot;		/* Identifies the module */
+};
+
+/**
+ * lsmcontext_init - initialize an lsmcontext structure.
+ * @cp: Pointer to the context to initialize
+ * @context: Initial context, or NULL
+ * @size: Size of context, or 0
+ * @slot: Which LSM provided the context
+ *
+ * Fill in the lsmcontext from the provided information.
+ * This is a scaffolding function that will be removed when
+ * lsmcontext integration is complete.
+ */
+static inline void lsmcontext_init(struct lsmcontext *cp, char *context,
+				   u32 size, int slot)
+{
+	cp->slot = slot;
+	cp->context = context;
+
+	if (context == NULL || size == 0)
+		cp->len = 0;
+	else
+		cp->len = strlen(context);
+}
+
 /*
  * Data exported by the security modules
  *
@@ -449,7 +484,7 @@ int security_ismaclabel(const char *name);
 int security_secid_to_secctx(struct lsmblob *blob, char **secdata, u32 *seclen);
 int security_secctx_to_secid(const char *secdata, u32 seclen,
 			     struct lsmblob *blob);
-void security_release_secctx(char *secdata, u32 seclen);
+void security_release_secctx(struct lsmcontext *cp);
 
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
@@ -1240,7 +1275,7 @@ static inline int security_secctx_to_secid(const char *secdata,
 	return -EOPNOTSUPP;
 }
 
-static inline void security_release_secctx(char *secdata, u32 seclen)
+static inline void security_release_secctx(struct lsmcontext *cp)
 {
 }
 
diff --git a/include/net/scm.h b/include/net/scm.h
index 31ae605fcc0a..30ba801c91bd 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -92,6 +92,7 @@ static __inline__ int scm_send(struct socket *sock, struct msghdr *msg,
 #ifdef CONFIG_SECURITY_NETWORK
 static inline void scm_passec(struct socket *sock, struct msghdr *msg, struct scm_cookie *scm)
 {
+	struct lsmcontext context;
 	char *secdata;
 	u32 seclen;
 	int err;
@@ -102,7 +103,9 @@ static inline void scm_passec(struct socket *sock, struct msghdr *msg, struct sc
 
 		if (!err) {
 			put_cmsg(msg, SOL_SOCKET, SCM_SECURITY, seclen, secdata);
-			security_release_secctx(secdata, seclen);
+			/*scaffolding*/
+			lsmcontext_init(&context, secdata, seclen, 0);
+			security_release_secctx(&context);
 		}
 	}
 }
diff --git a/kernel/audit.c b/kernel/audit.c
index 1b51e907f131..f844a2a642e6 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -1193,6 +1193,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 	struct audit_sig_info   *sig_data;
 	char			*ctx = NULL;
 	u32			len;
+	struct lsmcontext	scaff; /* scaffolding */
 
 	err = audit_netlink_ok(skb, msg_type);
 	if (err)
@@ -1437,15 +1438,18 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 		}
 		sig_data = kmalloc(sizeof(*sig_data) + len, GFP_KERNEL);
 		if (!sig_data) {
-			if (lsmblob_is_set(&audit_sig_lsm))
-				security_release_secctx(ctx, len);
+			if (lsmblob_is_set(&audit_sig_lsm)) {
+				lsmcontext_init(&scaff, ctx, len, 0);
+				security_release_secctx(&scaff);
+			}
 			return -ENOMEM;
 		}
 		sig_data->uid = from_kuid(&init_user_ns, audit_sig_uid);
 		sig_data->pid = audit_sig_pid;
 		if (lsmblob_is_set(&audit_sig_lsm)) {
 			memcpy(sig_data->ctx, ctx, len);
-			security_release_secctx(ctx, len);
+			lsmcontext_init(&scaff, ctx, len, 0);
+			security_release_secctx(&scaff);
 		}
 		audit_send_reply(skb, seq, AUDIT_SIGNAL_INFO, 0, 0,
 				 sig_data, sizeof(*sig_data) + len);
@@ -2074,6 +2078,7 @@ int audit_log_task_context(struct audit_buffer *ab)
 	unsigned len;
 	int error;
 	struct lsmblob blob;
+	struct lsmcontext scaff; /* scaffolding */
 
 	security_task_getsecid(current, &blob);
 	if (!lsmblob_is_set(&blob))
@@ -2087,7 +2092,8 @@ int audit_log_task_context(struct audit_buffer *ab)
 	}
 
 	audit_log_format(ab, " subj=%s", ctx);
-	security_release_secctx(ctx, len);
+	lsmcontext_init(&scaff, ctx, len, 0);
+	security_release_secctx(&scaff);
 	return 0;
 
 error_path:
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index c7aa39bda5cc..9fab0e7d90c3 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -943,6 +943,7 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 				 struct lsmblob *blob, char *comm)
 {
 	struct audit_buffer *ab;
+	struct lsmcontext lsmcxt;
 	char *ctx = NULL;
 	u32 len;
 	int rc = 0;
@@ -960,7 +961,8 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 			rc = 1;
 		} else {
 			audit_log_format(ab, " obj=%s", ctx);
-			security_release_secctx(ctx, len);
+			lsmcontext_init(&lsmcxt, ctx, len, 0); /*scaffolding*/
+			security_release_secctx(&lsmcxt);
 		}
 	}
 	audit_log_format(ab, " ocomm=");
@@ -1172,6 +1174,7 @@ static void audit_log_fcaps(struct audit_buffer *ab, struct audit_names *name)
 
 static void show_special(struct audit_context *context, int *call_panic)
 {
+	struct lsmcontext lsmcxt;
 	struct audit_buffer *ab;
 	int i;
 
@@ -1205,7 +1208,8 @@ static void show_special(struct audit_context *context, int *call_panic)
 				*call_panic = 1;
 			} else {
 				audit_log_format(ab, " obj=%s", ctx);
-				security_release_secctx(ctx, len);
+				lsmcontext_init(&lsmcxt, ctx, len, 0);
+				security_release_secctx(&lsmcxt);
 			}
 		}
 		if (context->ipc.has_perm) {
@@ -1352,6 +1356,7 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
 		char *ctx = NULL;
 		u32 len;
 		struct lsmblob blob;
+		struct lsmcontext lsmcxt;
 
 		lsmblob_init(&blob, n->osid);
 		if (security_secid_to_secctx(&blob, &ctx, &len)) {
@@ -1360,7 +1365,8 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
 				*call_panic = 2;
 		} else {
 			audit_log_format(ab, " obj=%s", ctx);
-			security_release_secctx(ctx, len);
+			lsmcontext_init(&lsmcxt, ctx, len, 0); /* scaffolding */
+			security_release_secctx(&lsmcxt);
 		}
 	}
 
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index e05f4ef68bd8..7834c357b60b 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -130,6 +130,7 @@ static void ip_cmsg_recv_checksum(struct msghdr *msg, struct sk_buff *skb,
 
 static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
 {
+	struct lsmcontext context;
 	struct lsmblob lb;
 	char *secdata;
 	u32 seclen;
@@ -144,7 +145,8 @@ static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
 		return;
 
 	put_cmsg(msg, SOL_IP, SCM_SECURITY, seclen, secdata);
-	security_release_secctx(secdata, seclen);
+	lsmcontext_init(&context, secdata, seclen, 0); /* scaffolding */
+	security_release_secctx(&context);
 }
 
 static void ip_cmsg_recv_dstaddr(struct msghdr *msg, struct sk_buff *skb)
diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
index ca0968f13240..6954e6600583 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -331,6 +331,7 @@ static int ctnetlink_dump_secctx(struct sk_buff *skb, const struct nf_conn *ct)
 	int len, ret;
 	char *secctx;
 	struct lsmblob blob;
+	struct lsmcontext context;
 
 	lsmblob_init(&blob, ct->secmark);
 	ret = security_secid_to_secctx(&blob, &secctx, &len);
@@ -348,7 +349,8 @@ static int ctnetlink_dump_secctx(struct sk_buff *skb, const struct nf_conn *ct)
 
 	ret = 0;
 nla_put_failure:
-	security_release_secctx(secctx, len);
+	lsmcontext_init(&context, secctx, len, 0); /* scaffolding */
+	security_release_secctx(&context);
 	return ret;
 }
 #else
diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_conntrack_standalone.c
index c793103f3cd7..79158ad0486e 100644
--- a/net/netfilter/nf_conntrack_standalone.c
+++ b/net/netfilter/nf_conntrack_standalone.c
@@ -176,6 +176,7 @@ static void ct_show_secctx(struct seq_file *s, const struct nf_conn *ct)
 	u32 len;
 	char *secctx;
 	struct lsmblob blob;
+	struct lsmcontext context;
 
 	lsmblob_init(&blob, ct->secmark);
 	ret = security_secid_to_secctx(&blob, &secctx, &len);
@@ -184,7 +185,8 @@ static void ct_show_secctx(struct seq_file *s, const struct nf_conn *ct)
 
 	seq_printf(s, "secctx=%s ", secctx);
 
-	security_release_secctx(secctx, len);
+	lsmcontext_init(&context, secctx, len, 0); /* scaffolding */
+	security_release_secctx(&context);
 }
 #else
 static inline void ct_show_secctx(struct seq_file *s, const struct nf_conn *ct)
diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
index 59211bff90ab..fe8403ef4e89 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -399,6 +399,7 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	enum ip_conntrack_info uninitialized_var(ctinfo);
 	struct nfnl_ct_hook *nfnl_ct;
 	bool csum_verify;
+	struct lsmcontext scaff; /* scaffolding */
 	char *secdata = NULL;
 	u32 seclen = 0;
 
@@ -629,8 +630,10 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	}
 
 	nlh->nlmsg_len = skb->len;
-	if (seclen)
-		security_release_secctx(secdata, seclen);
+	if (seclen) {
+		lsmcontext_init(&scaff, secdata, seclen, 0);
+		security_release_secctx(&scaff);
+	}
 	return skb;
 
 nla_put_failure:
@@ -638,8 +641,10 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	kfree_skb(skb);
 	net_err_ratelimited("nf_queue: error creating packet message\n");
 nlmsg_failure:
-	if (seclen)
-		security_release_secctx(secdata, seclen);
+	if (seclen) {
+		lsmcontext_init(&scaff, secdata, seclen, 0);
+		security_release_secctx(&scaff);
+	}
 	return NULL;
 }
 
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
index 2294aa9471e6..15b1945853be 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -387,6 +387,7 @@ int netlbl_unlhsh_add(struct net *net,
 	struct net_device *dev;
 	struct netlbl_unlhsh_iface *iface;
 	struct audit_buffer *audit_buf = NULL;
+	struct lsmcontext context;
 	char *secctx = NULL;
 	u32 secctx_len;
 	struct lsmblob blob;
@@ -457,7 +458,9 @@ int netlbl_unlhsh_add(struct net *net,
 					     &secctx,
 					     &secctx_len) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s", secctx);
-			security_release_secctx(secctx, secctx_len);
+			/* scaffolding */
+			lsmcontext_init(&context, secctx, secctx_len, 0);
+			security_release_secctx(&context);
 		}
 		audit_log_format(audit_buf, " res=%u", ret_val == 0 ? 1 : 0);
 		audit_log_end(audit_buf);
@@ -488,6 +491,7 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 	struct netlbl_unlhsh_addr4 *entry;
 	struct audit_buffer *audit_buf;
 	struct net_device *dev;
+	struct lsmcontext context;
 	char *secctx;
 	u32 secctx_len;
 	struct lsmblob blob;
@@ -516,7 +520,9 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 		    security_secid_to_secctx(&blob,
 					     &secctx, &secctx_len) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s", secctx);
-			security_release_secctx(secctx, secctx_len);
+			/* scaffolding */
+			lsmcontext_init(&context, secctx, secctx_len, 0);
+			security_release_secctx(&context);
 		}
 		audit_log_format(audit_buf, " res=%u", entry != NULL ? 1 : 0);
 		audit_log_end(audit_buf);
@@ -553,6 +559,7 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 	struct netlbl_unlhsh_addr6 *entry;
 	struct audit_buffer *audit_buf;
 	struct net_device *dev;
+	struct lsmcontext context;
 	char *secctx;
 	u32 secctx_len;
 	struct lsmblob blob;
@@ -580,7 +587,8 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 		    security_secid_to_secctx(&blob,
 					     &secctx, &secctx_len) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s", secctx);
-			security_release_secctx(secctx, secctx_len);
+			lsmcontext_init(&context, secctx, secctx_len, 0);
+			security_release_secctx(&context);
 		}
 		audit_log_format(audit_buf, " res=%u", entry != NULL ? 1 : 0);
 		audit_log_end(audit_buf);
@@ -1094,6 +1102,7 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 	int ret_val = -ENOMEM;
 	struct netlbl_unlhsh_walk_arg *cb_arg = arg;
 	struct net_device *dev;
+	struct lsmcontext context;
 	void *data;
 	u32 secid;
 	char *secctx;
@@ -1161,7 +1170,9 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 			  NLBL_UNLABEL_A_SECCTX,
 			  secctx_len,
 			  secctx);
-	security_release_secctx(secctx, secctx_len);
+	/* scaffolding */
+	lsmcontext_init(&context, secctx, secctx_len, 0);
+	security_release_secctx(&context);
 	if (ret_val != 0)
 		goto list_cb_failure;
 
diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
index 2ccc6567e2a2..94aea4985b74 100644
--- a/net/netlabel/netlabel_user.c
+++ b/net/netlabel/netlabel_user.c
@@ -98,6 +98,7 @@ struct audit_buffer *netlbl_audit_start_common(int type,
 					       struct netlbl_audit *audit_info)
 {
 	struct audit_buffer *audit_buf;
+	struct lsmcontext context;
 	char *secctx;
 	u32 secctx_len;
 	struct lsmblob blob;
@@ -117,7 +118,8 @@ struct audit_buffer *netlbl_audit_start_common(int type,
 	if (audit_info->secid != 0 &&
 	    security_secid_to_secctx(&blob, &secctx, &secctx_len) == 0) {
 		audit_log_format(audit_buf, " subj=%s", secctx);
-		security_release_secctx(secctx, secctx_len);
+		lsmcontext_init(&context, secctx, secctx_len, 0);/*scaffolding*/
+		security_release_secctx(&context);
 	}
 
 	return audit_buf;
diff --git a/security/security.c b/security/security.c
index 4dd4ebeda18d..430ca6fd7d9d 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2135,17 +2135,23 @@ int security_secctx_to_secid(const char *secdata, u32 seclen,
 }
 EXPORT_SYMBOL(security_secctx_to_secid);
 
-void security_release_secctx(char *secdata, u32 seclen)
+void security_release_secctx(struct lsmcontext *cp)
 {
 	struct security_hook_list *hp;
-	int *display = current->security;
+	bool found = false;
 
 	hlist_for_each_entry(hp, &security_hook_heads.release_secctx, list)
-		if (display == NULL || *display == LSMBLOB_INVALID ||
-		    *display == hp->lsmid->slot) {
-			hp->hook.release_secctx(secdata, seclen);
-			return;
+		if (cp->slot == hp->lsmid->slot) {
+			hp->hook.release_secctx(cp->context, cp->len);
+			found = true;
+			break;
 		}
+
+	memset(cp, 0, sizeof(*cp));
+
+	if (!found)
+		pr_warn("%s context \"%s\" from slot %d not released\n",
+			__func__, cp->context, cp->slot);
 }
 EXPORT_SYMBOL(security_release_secctx);
 
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 7a0ead4da479..472cb2097d36 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -4439,11 +4439,16 @@ static int smack_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid)
 	return 0;
 }
 
-/*
- * There used to be a smack_release_secctx hook
- * that did nothing back when hooks were in a vector.
- * Now that there's a list such a hook adds cost.
+/**
+ * smack_release_secctx - do everything necessary to free a context
+ * @secdata: Unused
+ * @seclen: Unused
+ *
+ * Do nothing but hold a slot in the hooks list.
  */
+static void smack_release_secctx(char *secdata, u32 seclen)
+{
+}
 
 static int smack_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen)
 {
@@ -4688,6 +4693,7 @@ static struct security_hook_list smack_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(ismaclabel, smack_ismaclabel),
 	LSM_HOOK_INIT(secid_to_secctx, smack_secid_to_secctx),
 	LSM_HOOK_INIT(secctx_to_secid, smack_secctx_to_secid),
+	LSM_HOOK_INIT(release_secctx, smack_release_secctx),
 	LSM_HOOK_INIT(inode_notifysecctx, smack_inode_notifysecctx),
 	LSM_HOOK_INIT(inode_setsecctx, smack_inode_setsecctx),
 	LSM_HOOK_INIT(inode_getsecctx, smack_inode_getsecctx),
-- 
2.20.1

