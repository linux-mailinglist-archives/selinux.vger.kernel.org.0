Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC71D70052E
	for <lists+selinux@lfdr.de>; Fri, 12 May 2023 12:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240695AbjELKXo (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 12 May 2023 06:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240679AbjELKXj (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 12 May 2023 06:23:39 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DAB11D92
        for <selinux@vger.kernel.org>; Fri, 12 May 2023 03:23:29 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-965ab8ed1c0so1608450666b.2
        for <selinux@vger.kernel.org>; Fri, 12 May 2023 03:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683887008; x=1686479008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=U56nBhJ2PGnlqrIbVDqlhdOuW9wpouh2AIwKDY0eaa8=;
        b=QnxuEc8gjle4pwBt4uejY+HGdBk/dS7QVKlDPHqw3LMsBg8uJMvQ/6+EPKVvRi+48g
         zbgUm7uP0Ed/nXnRWETtL7Jq70oUVp6VreN/Jq7B5USJos0lDHFXlAHrZuxRmyO0wxI4
         JHX0dRBDtY3fFjAyDMXHBhPQ0FFsxHVMXQ8yS16RPLKDiWfYTXezTUiRtOQiTVR6Qy6s
         dYEt+uBrZcYbgOuMEOLlz81E3ePtPXkf/9xid0CnMAg43/ywcu5NwexDD4Hj8fOWbro+
         N2RN9++vkCD5tj3dxvENbbZ310YNLs/9ST17UbGRB9F9usihnnx6Fwdk3liOPIoV+xuu
         EvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683887008; x=1686479008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U56nBhJ2PGnlqrIbVDqlhdOuW9wpouh2AIwKDY0eaa8=;
        b=JJgcF/s1KvkDf7OAyTZ0xhWhZU5/6br0gUhqC2vWuKmyzFEtL4/7NhOGnfEL0QZSRu
         2AfN9hC91tcJo1gyQkH3D78BErNd0MIoP5F3Nd3/DA6hkAhiLT31eiWEkcYxJYjrFhVo
         jssAGbHJisVM8adTVdo7Pvho6+MnsfNF7GpTUHKNuoQAivmHOeL1RtVK0IJgHHQYAqsA
         U9IksbBWc6vUPEVr3Mbu3ZynsTmjfSnI6cvV3RIifEKKlcdO+pjAQjGXy4PhJ3Bssvib
         i6twVmThkb1YqDQ4PaBvPjaNDcY5Tbh+WOL1386yfLqfuVyP1NRib3tNVzmYwrd12War
         Fqfw==
X-Gm-Message-State: AC+VfDxKoENkSjcyH0qwirEnaiCvqyrZ23p736A2lwKZPZ7K8ej1p85p
        obN5IZJlB6DqzX0RI4Nm8WEjjj668D+XVQ==
X-Google-Smtp-Source: ACHHUZ65JbsvBGXOXFhVRofYLI3qSbI0JmhdIynmnrxWUworexToKphAklx4ksuFiWuXQ3oyt9fHjg==
X-Received: by 2002:a17:907:3d86:b0:967:5c5f:e45c with SMTP id he6-20020a1709073d8600b009675c5fe45cmr16428897ejc.0.1683887007501;
        Fri, 12 May 2023 03:23:27 -0700 (PDT)
Received: from debianHome.localdomain (dynamic-095-116-181-041.95.116.pool.telefonica.de. [95.116.181.41])
        by smtp.gmail.com with ESMTPSA id gz4-20020a170907a04400b009571293d6acsm5202920ejc.59.2023.05.12.03.23.26
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 03:23:26 -0700 (PDT)
From:   =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To:     selinux@vger.kernel.org
Subject: [RFC PATCH 1/9] libselinux: annotate interfaces with compiler attributes
Date:   Fri, 12 May 2023 12:23:14 +0200
Message-Id: <20230512102322.72235-1-cgzones@googlemail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

libselinux is used widely, in object managers, like systemd or dbus, and
essential utilities, like coreutils or package managers.

Help compilers and static analyzers to find suspicious usages of
interfaces of libselinux by annotating them with function attributes.
This includes potentially passing NULL to non-NULL parameters, no error
handling by ignoring return values.

Function attributes are GNU extensions and supported by GCC[1] and
Clang[2].

[1]: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html
[2]: https://clang.llvm.org/docs/AttributeReference.html#function-attributes

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 libselinux/include/selinux/_private.h         |  76 ++++
 libselinux/include/selinux/avc.h              |  66 ++--
 libselinux/include/selinux/context.h          |  22 +-
 libselinux/include/selinux/get_context_list.h |  16 +-
 libselinux/include/selinux/get_default_type.h |   6 +-
 libselinux/include/selinux/label.h            |  24 +-
 libselinux/include/selinux/restorecon.h       |  16 +-
 libselinux/include/selinux/selinux.h          | 354 ++++++++----------
 libselinux/src/exception.sh                   |   4 +-
 libselinux/src/selinuxswig.i                  |   1 +
 scripts/run-scan-build                        |   2 +-
 11 files changed, 308 insertions(+), 279 deletions(-)
 create mode 100644 libselinux/include/selinux/_private.h

diff --git a/libselinux/include/selinux/_private.h b/libselinux/include/selinux/_private.h
new file mode 100644
index 00000000..ddbe9798
--- /dev/null
+++ b/libselinux/include/selinux/_private.h
@@ -0,0 +1,76 @@
+#if defined __INCLUDE_LEVEL__ && __INCLUDE_LEVEL__ < 2 && ! defined NO_INCLUDE_ERROR
+# error This file should not be included directly!
+#endif
+
+
+#ifndef _SELINUX_PRIVATE_H_
+#define _SELINUX_PRIVATE_H_
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+
+/* helper macro to check GCC version */
+#if defined __GNUC__ && defined __GNUC_MINOR__
+# define REQUIRE_GNUC(major, minor)	(__GNUC__ > (major) || (__GNUC__ == (major) && __GNUC_MINOR__ >= (minor)))
+#else
+# define REQUIRE_GNUC(major, minor)	0
+#endif
+
+
+/* format */
+#ifndef selinux_format
+# ifdef __GNUC__
+#  define selinux_format(opts)		__attribute__((__format__ opts))
+# else
+#  define selinux_format(opts)
+# endif
+#endif
+
+
+/* nonnull */
+#ifndef selinux_nonnull
+# if REQUIRE_GNUC(3,3)
+#  define selinux_nonnull(params)	__attribute__((__nonnull__ params))
+# else
+#  define selinux_nonnull(params)
+# endif
+#endif
+
+
+/* nodiscard / warn-unused-result */
+#ifndef selinux_nodiscard
+# if REQUIRE_GNUC(3,4)
+#  define selinux_nodiscard		__attribute__((__warn_unused_result__))
+# else
+#  define selinux_nodiscard
+# endif
+#endif
+
+
+/* deprecated */
+#ifndef selinux_deprecated
+# if REQUIRE_GNUC(4,5)
+#  define selinux_deprecated(msg)	__attribute__((__deprecated__ (msg)))
+# else
+#  define selinux_deprecated(msg)
+# endif
+#endif
+
+
+/* access */
+#ifndef selinux_access
+# if REQUIRE_GNUC(10,0)
+#  define selinux_access(opts)		__attribute__((__access__ opts))
+# else
+#  define selinux_access(opts)
+# endif
+#endif
+
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* _SELINUX_PRIVATE_H_ */
diff --git a/libselinux/include/selinux/avc.h b/libselinux/include/selinux/avc.h
index 4bbd2382..92c79988 100644
--- a/libselinux/include/selinux/avc.h
+++ b/libselinux/include/selinux/avc.h
@@ -37,8 +37,8 @@ typedef struct security_id *security_id_t;
  * failure, with @errno set to %ENOMEM if insufficient memory was
  * available to make the copy, or %EINVAL if the input SID is invalid.
  */
-extern int avc_sid_to_context(security_id_t sid, char ** ctx);
-extern int avc_sid_to_context_raw(security_id_t sid, char ** ctx);
+extern int avc_sid_to_context(security_id_t sid, char ** ctx) selinux_nonnull((1,2)) selinux_nodiscard;
+extern int avc_sid_to_context_raw(security_id_t sid, char ** ctx) selinux_nonnull((1,2)) selinux_nodiscard;
 
 /**
  * avc_context_to_sid - get SID for context.
@@ -51,8 +51,8 @@ extern int avc_sid_to_context_raw(security_id_t sid, char ** ctx);
  * to the SID structure into the memory referenced by @sid, 
  * returning %0 on success or -%1 on error with @errno set.  
  */
-extern int avc_context_to_sid(const char * ctx, security_id_t * sid);
-extern int avc_context_to_sid_raw(const char * ctx, security_id_t * sid);
+extern int avc_context_to_sid(const char * ctx, security_id_t * sid) selinux_nonnull((1,2)) selinux_nodiscard;
+extern int avc_context_to_sid_raw(const char * ctx, security_id_t * sid) selinux_nonnull((1,2)) selinux_nodiscard;
 
 /**
  * sidget - increment SID reference counter.
@@ -64,11 +64,7 @@ extern int avc_context_to_sid_raw(const char * ctx, security_id_t * sid);
  * reference count).  Note that avc_context_to_sid() also
  * increments reference counts.
  */
-extern int sidget(security_id_t sid)
-#ifdef __GNUC__
-__attribute__ ((deprecated))
-#endif
-;
+extern int sidget(security_id_t sid) selinux_deprecated("SID refcounting has been removed");
 
 /**
  * sidput - decrement SID reference counter.
@@ -80,11 +76,7 @@ __attribute__ ((deprecated))
  * zero, the SID is invalid, and avc_context_to_sid() must
  * be called to obtain a new SID for the security context.
  */
-extern int sidput(security_id_t sid)
-#ifdef __GNUC__
-__attribute__ ((deprecated))
-#endif
-;
+extern int sidput(security_id_t sid) selinux_deprecated("SID refcounting has been removed");
 
 /**
  * avc_get_initial_sid - get SID for an initial kernel security identifier
@@ -95,7 +87,7 @@ __attribute__ ((deprecated))
  * @name using security_get_initial_context() and then call 
  * avc_context_to_sid() to get the corresponding SID.
  */
-extern int avc_get_initial_sid(const char *name, security_id_t * sid);
+extern int avc_get_initial_sid(const char *name, security_id_t * sid) selinux_nonnull((1,2)) selinux_nodiscard;
 
 /*
  * AVC entry
@@ -139,9 +131,7 @@ struct avc_memory_callback {
 struct avc_log_callback {
 	/* log the printf-style format and arguments. */
 	void
-#ifdef __GNUC__
-__attribute__ ((format(printf, 1, 2)))
-#endif
+	selinux_format((printf, 1, 2))
 	(*func_log) (const char *fmt, ...);
 	/* store a string representation of auditdata (corresponding
 	   to the given security class) into msgbuf. */
@@ -200,11 +190,7 @@ extern int avc_init(const char *msgprefix,
 		    const struct avc_memory_callback *mem_callbacks,
 		    const struct avc_log_callback *log_callbacks,
 		    const struct avc_thread_callback *thread_callbacks,
-		    const struct avc_lock_callback *lock_callbacks)
-#ifdef __GNUC__
-	__attribute__ ((deprecated("Use avc_open and selinux_set_callback")))
-#endif
-;
+		    const struct avc_lock_callback *lock_callbacks) selinux_nodiscard selinux_deprecated("Use avc_open(3) and selinux_set_callback(3)");
 
 /**
  * avc_open - Initialize the AVC.
@@ -215,7 +201,7 @@ extern int avc_init(const char *msgprefix,
  * is set to "avc" and any callbacks desired should be specified via
  * selinux_set_callback().  Available options are listed above.
  */
-extern int avc_open(struct selinux_opt *opts, unsigned nopts);
+extern int avc_open(struct selinux_opt *opts, unsigned nopts) selinux_access((read_only, 1, 2)) selinux_nodiscard;
 
 /**
  * avc_cleanup - Remove unused SIDs and AVC entries.
@@ -235,7 +221,7 @@ extern void avc_cleanup(void);
  * The SID mapping is not affected.  Return %0 on success, 
  * -%1 with @errno set on error.
  */
-extern int avc_reset(void);
+extern int avc_reset(void) selinux_nodiscard;
 
 /**
  * avc_destroy - Free all AVC structures.
@@ -273,7 +259,7 @@ extern int avc_has_perm_noaudit(security_id_t ssid,
 				security_id_t tsid,
 				security_class_t tclass,
 				access_vector_t requested,
-				struct avc_entry_ref *aeref, struct av_decision *avd);
+				struct avc_entry_ref *aeref, struct av_decision *avd) selinux_nonnull((1,2)) selinux_nodiscard;
 
 /**
  * avc_has_perm - Check permissions and perform any appropriate auditing.
@@ -295,7 +281,7 @@ extern int avc_has_perm_noaudit(security_id_t ssid,
  */
 extern int avc_has_perm(security_id_t ssid, security_id_t tsid,
 			security_class_t tclass, access_vector_t requested,
-			struct avc_entry_ref *aeref, void *auditdata);
+			struct avc_entry_ref *aeref, void *auditdata) selinux_nonnull((1,2)) selinux_nodiscard;
 
 /**
  * avc_audit - Audit the granting or denial of permissions.
@@ -318,7 +304,7 @@ extern int avc_has_perm(security_id_t ssid, security_id_t tsid,
  */
 extern void avc_audit(security_id_t ssid, security_id_t tsid,
 		      security_class_t tclass, access_vector_t requested,
-		      struct av_decision *avd, int result, void *auditdata);
+		      struct av_decision *avd, int result, void *auditdata) selinux_nonnull((1,2,5));
 
 /**
  * avc_compute_create - Compute SID for labeling a new object.
@@ -336,7 +322,7 @@ extern void avc_audit(security_id_t ssid, security_id_t tsid,
  */
 extern int avc_compute_create(security_id_t ssid,
 			      security_id_t tsid,
-			      security_class_t tclass, security_id_t * newsid);
+			      security_class_t tclass, security_id_t * newsid) selinux_nonnull((1,2,4)) selinux_nodiscard;
 
 /**
  * avc_compute_member - Compute SID for polyinstantation.
@@ -354,7 +340,7 @@ extern int avc_compute_create(security_id_t ssid,
  */
 extern int avc_compute_member(security_id_t ssid,
 			      security_id_t tsid,
-			      security_class_t tclass, security_id_t * newsid);
+			      security_class_t tclass, security_id_t * newsid) selinux_nonnull((1,2,4)) selinux_nodiscard;
 
 /* 
  * security event callback facility
@@ -392,7 +378,7 @@ extern int avc_add_callback(int (*callback)
 			      access_vector_t * out_retained),
 			    uint32_t events, security_id_t ssid,
 			    security_id_t tsid, security_class_t tclass,
-			    access_vector_t perms);
+			    access_vector_t perms) selinux_nonnull((1,3,4)) selinux_nodiscard;
 
 /*
  * AVC statistics 
@@ -423,7 +409,7 @@ struct avc_cache_stats {
  * avc_reset().  See the structure definition for
  * details.
  */
-extern void avc_cache_stats(struct avc_cache_stats *stats);
+extern void avc_cache_stats(struct avc_cache_stats *stats) selinux_nonnull((1));
 
 /**
  * avc_av_stats - log av table statistics.
@@ -446,7 +432,7 @@ extern void avc_sid_stats(void);
 /**
  * avc_netlink_open - Create a netlink socket and connect to the kernel.
  */
-extern int avc_netlink_open(int blocking);
+extern int avc_netlink_open(int blocking) selinux_nodiscard;
 
 /**
  * avc_netlink_loop - Wait for netlink messages from the kernel
@@ -464,7 +450,7 @@ extern void avc_netlink_close(void);
  * Allows the application to manage messages from the netlink socket in
  * its own main loop.
  */
-extern int avc_netlink_acquire_fd(void);
+extern int avc_netlink_acquire_fd(void) selinux_nodiscard;
 
 /**
  * avc_netlink_release_fd - Release netlink socket fd.
@@ -479,13 +465,13 @@ extern void avc_netlink_release_fd(void);
  * Called by the application when using avc_netlink_acquire_fd() to
  * process kernel netlink events.
  */
-extern int avc_netlink_check_nb(void);
+extern int avc_netlink_check_nb(void) selinux_nodiscard;
 
 /**
  * selinux_status_open - Open and map SELinux kernel status page
  *
  */
-extern int selinux_status_open(int fallback);
+extern int selinux_status_open(int fallback) selinux_nodiscard;
 
 /**
  * selinux_status_close - Unmap and close SELinux kernel status page
@@ -497,25 +483,25 @@ extern void selinux_status_close(void);
  * selinux_status_updated - Inform us whether the kernel status has been updated
  *
  */
-extern int selinux_status_updated(void);
+extern int selinux_status_updated(void) selinux_nodiscard;
 
 /**
  * selinux_status_getenforce - Get the enforce flag value
  *
  */
-extern int selinux_status_getenforce(void);
+extern int selinux_status_getenforce(void) selinux_nodiscard;
 
 /**
  * selinux_status_policyload - Get the number of policy reloaded
  *
  */
-extern int selinux_status_policyload(void);
+extern int selinux_status_policyload(void) selinux_nodiscard;
 
 /**
  * selinux_status_deny_unknown - Get the  behavior for undefined classes/permissions
  *
  */
-extern int selinux_status_deny_unknown(void);
+extern int selinux_status_deny_unknown(void) selinux_nodiscard;
 
 #ifdef __cplusplus
 }
diff --git a/libselinux/include/selinux/context.h b/libselinux/include/selinux/context.h
index 59d9bb69..e3c99191 100644
--- a/libselinux/include/selinux/context.h
+++ b/libselinux/include/selinux/context.h
@@ -1,6 +1,8 @@
 #ifndef _SELINUX_CONTEXT_H_
 #define _SELINUX_CONTEXT_H_
 
+#include <selinux/_private.h>
+
 #ifdef __cplusplus
 extern "C" {
 #endif
@@ -17,7 +19,7 @@ extern "C" {
 
 /* Return a new context initialized to a context string */
 
-	extern context_t context_new(const char *str);
+	extern context_t context_new(const char *str) selinux_nonnull((1)) selinux_nodiscard;
 
 /* 
  * Return a pointer to the string value of the context_t
@@ -25,24 +27,24 @@ extern "C" {
  * for the same context_t*
  */
 
-	extern const char *context_str(context_t con);
+	extern const char *context_str(context_t con) selinux_nonnull((1)) selinux_nodiscard;
 
 /* Free the storage used by a context */
 	extern void context_free(context_t con);
 
 /* Get a pointer to the string value of a context component */
 
-	extern const char *context_type_get(context_t con);
-	extern const char *context_range_get(context_t con);
-	extern const char *context_role_get(context_t con);
-	extern const char *context_user_get(context_t con);
+	extern const char *context_type_get(context_t con) selinux_nonnull((1)) selinux_nodiscard;
+	extern const char *context_range_get(context_t con) selinux_nonnull((1)) selinux_nodiscard;
+	extern const char *context_role_get(context_t con) selinux_nonnull((1)) selinux_nodiscard;
+	extern const char *context_user_get(context_t con) selinux_nonnull((1)) selinux_nodiscard;
 
 /* Set a context component.  Returns nonzero if unsuccessful */
 
-	extern int context_type_set(context_t con, const char *type);
-	extern int context_range_set(context_t con, const char *range);
-	extern int context_role_set(context_t con, const char *role);
-	extern int context_user_set(context_t con, const char *user);
+	extern int context_type_set(context_t con, const char *type) selinux_nonnull((1)) selinux_nodiscard;
+	extern int context_range_set(context_t con, const char *range) selinux_nonnull((1)) selinux_nodiscard;
+	extern int context_role_set(context_t con, const char *role) selinux_nonnull((1)) selinux_nodiscard;
+	extern int context_user_set(context_t con, const char *user) selinux_nonnull((1)) selinux_nodiscard;
 
 #ifdef __cplusplus
 }
diff --git a/libselinux/include/selinux/get_context_list.h b/libselinux/include/selinux/get_context_list.h
index 6b2f14f3..6146e4fe 100644
--- a/libselinux/include/selinux/get_context_list.h
+++ b/libselinux/include/selinux/get_context_list.h
@@ -18,14 +18,14 @@ extern "C" {
    Caller must free via freeconary. */
 	extern int get_ordered_context_list(const char *user,
 					    const char *fromcon,
-					    char *** list);
+					    char *** list) selinux_nonnull((1,3)) selinux_nodiscard;
 
 /* As above, but use the provided MLS level rather than the
    default level for the user. */
 	extern int get_ordered_context_list_with_level(const char *user,
 						       const char *level,
 						       const char *fromcon,
-						       char *** list);
+						       char *** list) selinux_nonnull((1,4)) selinux_nodiscard;
 
 /* Get the default security context for a user session for 'user'
    spawned by 'fromcon' and set *newcon to refer to it.  The context
@@ -36,14 +36,14 @@ extern "C" {
    Caller must free via freecon. */
 	extern int get_default_context(const char *user,
 				       const char *fromcon,
-				       char ** newcon);
+				       char ** newcon) selinux_nonnull((1,3)) selinux_nodiscard;
 
 /* As above, but use the provided MLS level rather than the
    default level for the user. */
 	extern int get_default_context_with_level(const char *user,
 						  const char *level,
 						  const char *fromcon,
-						  char ** newcon);
+						  char ** newcon) selinux_nonnull((1,4)) selinux_nodiscard;
 
 /* Same as get_default_context, but only return a context
    that has the specified role.  If no reachable context exists
@@ -51,7 +51,7 @@ extern "C" {
 	extern int get_default_context_with_role(const char *user,
 						 const char *role,
 						 const char *fromcon,
-						 char ** newcon);
+						 char ** newcon) selinux_nonnull((1,2,4)) selinux_nodiscard;
 
 /* Same as get_default_context, but only return a context
    that has the specified role and level.  If no reachable context exists
@@ -60,21 +60,21 @@ extern "C" {
 						      const char *role,
 						      const char *level,
 						      const char *fromcon,
-						      char ** newcon);
+						      char ** newcon) selinux_nonnull((1,2,5)) selinux_nodiscard;
 
 /* Given a list of authorized security contexts for the user, 
    query the user to select one and set *newcon to refer to it.
    Caller must free via freecon.
    Returns 0 on success or -1 otherwise. */
 	extern int query_user_context(char ** list,
-				      char ** newcon);
+				      char ** newcon) selinux_nonnull((1,2)) selinux_nodiscard;
 
 /* Allow the user to manually enter a context as a fallback
    if a list of authorized contexts could not be obtained. 
    Caller must free via freecon.
    Returns 0 on success or -1 otherwise. */
 	extern int manual_user_enter_context(const char *user,
-					     char ** newcon);
+					     char ** newcon) selinux_nonnull((2)) selinux_nodiscard;
 
 #ifdef __cplusplus
 }
diff --git a/libselinux/include/selinux/get_default_type.h b/libselinux/include/selinux/get_default_type.h
index 93f5b276..dccb715b 100644
--- a/libselinux/include/selinux/get_default_type.h
+++ b/libselinux/include/selinux/get_default_type.h
@@ -5,17 +5,19 @@
 #ifndef _SELINUX_GET_DEFAULT_TYPE_H_
 #define _SELINUX_GET_DEFAULT_TYPE_H_
 
+#include <selinux/_private.h>
+
 #ifdef __cplusplus
 extern "C" {
 #endif
 
 /* Return path to default type file. */
-	extern const char *selinux_default_type_path(void);
+	extern const char *selinux_default_type_path(void) selinux_nodiscard;
 
 /* Get the default type (domain) for 'role' and set 'type' to refer to it.
    Caller must free via free().
    Return 0 on success or -1 otherwise. */
-	extern int get_default_type(const char *role, char **type);
+	extern int get_default_type(const char *role, char **type) selinux_nonnull((1,2)) selinux_nodiscard;
 
 #ifdef __cplusplus
 }
diff --git a/libselinux/include/selinux/label.h b/libselinux/include/selinux/label.h
index e8983606..f12a5803 100644
--- a/libselinux/include/selinux/label.h
+++ b/libselinux/include/selinux/label.h
@@ -75,7 +75,7 @@ struct selabel_handle;
  */
 extern struct selabel_handle *selabel_open(unsigned int backend,
 					   const struct selinux_opt *opts,
-					   unsigned nopts);
+					   unsigned nopts) selinux_access((read_only, 2, 3)) selinux_nodiscard;
 
 /**
  * selabel_close - Close a labeling handle.
@@ -84,7 +84,7 @@ extern struct selabel_handle *selabel_open(unsigned int backend,
  * Destroy the specified handle, closing files, freeing allocated memory,
  * etc.  The handle may not be further used after it has been closed.
  */
-extern void selabel_close(struct selabel_handle *handle);
+extern void selabel_close(struct selabel_handle *handle) selinux_nonnull((1));
 
 /**
  * selabel_lookup - Perform labeling lookup operation.
@@ -100,24 +100,24 @@ extern void selabel_close(struct selabel_handle *handle);
  * by the user with freecon().
  */
 extern int selabel_lookup(struct selabel_handle *handle, char **con,
-			  const char *key, int type);
+			  const char *key, int type) selinux_nonnull((1,2)) selinux_nodiscard;
 extern int selabel_lookup_raw(struct selabel_handle *handle, char **con,
-			      const char *key, int type);
+			      const char *key, int type) selinux_nonnull((1,2)) selinux_nodiscard;
 
-extern bool selabel_partial_match(struct selabel_handle *handle, const char *key);
+extern bool selabel_partial_match(struct selabel_handle *handle, const char *key) selinux_nonnull((1,2)) selinux_nodiscard;
 
 extern bool selabel_get_digests_all_partial_matches(struct selabel_handle *rec,
 						    const char *key,
 						    uint8_t **calculated_digest,
 						    uint8_t **xattr_digest,
-						    size_t *digest_len);
+						    size_t *digest_len) selinux_nonnull((1,2,3,4,5)) selinux_nodiscard;
 extern bool selabel_hash_all_partial_matches(struct selabel_handle *rec,
-					     const char *key, uint8_t* digest);
+					     const char *key, uint8_t* digest) selinux_nonnull((1,2,3)) selinux_nodiscard;
 
 extern int selabel_lookup_best_match(struct selabel_handle *rec, char **con,
-				     const char *key, const char **aliases, int type);
+				     const char *key, const char **aliases, int type) selinux_nonnull((1,2,3)) selinux_nodiscard;
 extern int selabel_lookup_best_match_raw(struct selabel_handle *rec, char **con,
-					 const char *key, const char **aliases, int type);
+					 const char *key, const char **aliases, int type) selinux_nonnull((1,2,3)) selinux_nodiscard;
 
 /**
  * selabel_digest - Retrieve the SHA1 digest and the list of specfiles used to
@@ -134,7 +134,7 @@ extern int selabel_lookup_best_match_raw(struct selabel_handle *rec, char **con,
  */
 extern int selabel_digest(struct selabel_handle *rec,
 			  unsigned char **digest, size_t *digest_len,
-			  char ***specfiles, size_t *num_specfiles);
+			  char ***specfiles, size_t *num_specfiles) selinux_nonnull((1,2,3,4,5)) selinux_nodiscard;
 
 enum selabel_cmp_result {
 	SELABEL_SUBSET,
@@ -154,7 +154,7 @@ enum selabel_cmp_result {
  * of @h2, and %SELABEL_INCOMPARABLE if @h1 and @h2 are incomparable.
  */
 extern enum selabel_cmp_result selabel_cmp(struct selabel_handle *h1,
-					   struct selabel_handle *h2);
+					   struct selabel_handle *h2) selinux_nonnull((1,2)) selinux_nodiscard;
 
 /**
  * selabel_stats - log labeling operation statistics.
@@ -164,7 +164,7 @@ extern enum selabel_cmp_result selabel_cmp(struct selabel_handle *h1,
  * number of unused matching entries, or other operational statistics.
  * Message is backend-specific, some backends may not output a message.
  */
-extern void selabel_stats(struct selabel_handle *handle);
+extern void selabel_stats(struct selabel_handle *handle) selinux_nonnull((1));
 
 /*
  * Type codes used by specific backends
diff --git a/libselinux/include/selinux/restorecon.h b/libselinux/include/selinux/restorecon.h
index b10fe684..aa53c706 100644
--- a/libselinux/include/selinux/restorecon.h
+++ b/libselinux/include/selinux/restorecon.h
@@ -5,6 +5,8 @@
 #include <stddef.h>
 #include <stdarg.h>
 
+#include <selinux/_private.h>
+
 #ifdef __cplusplus
 extern "C" {
 #endif
@@ -23,7 +25,7 @@ extern "C" {
  * selinux_restorecon_set_sehandle(3).
  */
 extern int selinux_restorecon(const char *pathname,
-				    unsigned int restorecon_flags);
+				    unsigned int restorecon_flags) selinux_nonnull((1)) selinux_nodiscard;
 /**
  * selinux_restorecon_parallel - Relabel files, optionally use more threads.
  * @pathname: specifies file/directory to relabel.
@@ -36,7 +38,7 @@ extern int selinux_restorecon(const char *pathname,
  */
 extern int selinux_restorecon_parallel(const char *pathname,
 				       unsigned int restorecon_flags,
-				       size_t nthreads);
+				       size_t nthreads) selinux_nonnull((1)) selinux_nodiscard;
 /*
  * restorecon_flags options
  */
@@ -144,7 +146,7 @@ extern void selinux_restorecon_set_sehandle(struct selabel_handle *hndl);
  * Return value is the created handle on success or NULL with @errno set on
  * failure.
  */
-extern struct selabel_handle *selinux_restorecon_default_handle(void);
+extern struct selabel_handle *selinux_restorecon_default_handle(void) selinux_nodiscard;
 
 /**
  * selinux_restorecon_set_exclude_list - Add a list of directories that are
@@ -152,7 +154,7 @@ extern struct selabel_handle *selinux_restorecon_default_handle(void);
  * @exclude_list: containing a NULL terminated list of one or more
  *		  directories not to be relabeled.
  */
-extern void selinux_restorecon_set_exclude_list(const char **exclude_list);
+extern void selinux_restorecon_set_exclude_list(const char **exclude_list) selinux_nonnull((1));
 
 /**
  * selinux_restorecon_set_alt_rootpath - Use alternate rootpath.
@@ -160,7 +162,7 @@ extern void selinux_restorecon_set_exclude_list(const char **exclude_list);
  *
  * Return %0 on success, -%1 with @errno set on failure.
  */
-extern int selinux_restorecon_set_alt_rootpath(const char *alt_rootpath);
+extern int selinux_restorecon_set_alt_rootpath(const char *alt_rootpath) selinux_nonnull((1)) selinux_nodiscard;
 
 /**
  * selinux_restorecon_xattr - Read/remove security.sehash xattr entries.
@@ -196,7 +198,7 @@ struct dir_xattr {
 
 extern int selinux_restorecon_xattr(const char *pathname,
 				    unsigned int xattr_flags,
-				    struct dir_xattr ***xattr_list);
+				    struct dir_xattr ***xattr_list) selinux_nonnull((1,3)) selinux_nodiscard;
 
 /*
  * xattr_flags options
@@ -218,7 +220,7 @@ extern int selinux_restorecon_xattr(const char *pathname,
  * (i.e., with a zero return value), then this function returns the number of
  * errors ignored during the file tree walk.
  */
-extern long unsigned selinux_restorecon_get_skipped_errors(void);
+extern long unsigned selinux_restorecon_get_skipped_errors(void) selinux_nodiscard;
 
 #ifdef __cplusplus
 }
diff --git a/libselinux/include/selinux/selinux.h b/libselinux/include/selinux/selinux.h
index a0948853..7f8deb65 100644
--- a/libselinux/include/selinux/selinux.h
+++ b/libselinux/include/selinux/selinux.h
@@ -4,21 +4,19 @@
 #include <sys/types.h>
 #include <stdarg.h>
 
+#include <selinux/_private.h>
+
 #ifdef __cplusplus
 extern "C" {
 #endif
 
 /* Return 1 if we are running on a SELinux kernel, or 0 otherwise. */
-extern int is_selinux_enabled(void);
+extern int is_selinux_enabled(void) selinux_nodiscard;
 /* Return 1 if we are running on a SELinux MLS kernel, or 0 otherwise. */
-extern int is_selinux_mls_enabled(void);
+extern int is_selinux_mls_enabled(void) selinux_nodiscard;
 
 /* No longer used; here for compatibility with legacy callers. */
-typedef char *security_context_t
-#ifdef __GNUC__
-__attribute__ ((deprecated))
-#endif
-;
+typedef char *security_context_t selinux_deprecated("Use literal char*");
 
 /* Free the memory allocated for a context by any of the below get* calls. */
 extern void freecon(char * con);
@@ -30,8 +28,8 @@ extern void freeconary(char ** con);
 
 /* Get current context, and set *con to refer to it.
    Caller must free via freecon. */
-extern int getcon(char ** con);
-extern int getcon_raw(char ** con);
+extern int getcon(char ** con) selinux_nonnull((1)) selinux_nodiscard;
+extern int getcon_raw(char ** con) selinux_nonnull((1)) selinux_nodiscard;
 
 /* Set the current security context to con.  
    Note that use of this function requires that the entire application
@@ -41,18 +39,18 @@ extern int getcon_raw(char ** con);
    instead. Note that the application may lose access to its open descriptors
    as a result of a setcon() unless policy allows it to use descriptors opened
    by the old context. */
-extern int setcon(const char * con);
-extern int setcon_raw(const char * con);
+extern int setcon(const char * con) selinux_nodiscard;
+extern int setcon_raw(const char * con) selinux_nodiscard;
 
 /* Get context of process identified by pid, and 
    set *con to refer to it.  Caller must free via freecon. */
-extern int getpidcon(pid_t pid, char ** con);
-extern int getpidcon_raw(pid_t pid, char ** con);
+extern int getpidcon(pid_t pid, char ** con) selinux_nonnull((2)) selinux_nodiscard;
+extern int getpidcon_raw(pid_t pid, char ** con) selinux_nonnull((2)) selinux_nodiscard;
 
 /* Get previous context (prior to last exec), and set *con to refer to it.
    Caller must free via freecon. */
-extern int getprevcon(char ** con);
-extern int getprevcon_raw(char ** con);
+extern int getprevcon(char ** con) selinux_nonnull((1)) selinux_nodiscard;
+extern int getprevcon_raw(char ** con) selinux_nonnull((1)) selinux_nodiscard;
 
 /* Get previous context (prior to last exec) of process identified by pid, and
    set *con to refer to it.  Caller must free via freecon. */
@@ -62,72 +60,72 @@ extern int getpidprevcon_raw(pid_t pid, char ** con);
 /* Get exec context, and set *con to refer to it.
    Sets *con to NULL if no exec context has been set, i.e. using default.
    If non-NULL, caller must free via freecon. */
-extern int getexeccon(char ** con);
-extern int getexeccon_raw(char ** con);
+extern int getexeccon(char ** con) selinux_nonnull((1)) selinux_nodiscard;
+extern int getexeccon_raw(char ** con) selinux_nonnull((1)) selinux_nodiscard;
 
 /* Set exec security context for the next execve. 
    Call with NULL if you want to reset to the default. */
-extern int setexeccon(const char * con);
-extern int setexeccon_raw(const char * con);
+extern int setexeccon(const char * con) selinux_nodiscard;
+extern int setexeccon_raw(const char * con) selinux_nodiscard;
 
 /* Get fscreate context, and set *con to refer to it.
    Sets *con to NULL if no fs create context has been set, i.e. using default.
    If non-NULL, caller must free via freecon. */
-extern int getfscreatecon(char ** con);
-extern int getfscreatecon_raw(char ** con);
+extern int getfscreatecon(char ** con) selinux_nonnull((1)) selinux_nodiscard;
+extern int getfscreatecon_raw(char ** con) selinux_nonnull((1)) selinux_nodiscard;
 
 /* Set the fscreate security context for subsequent file creations.
    Call with NULL if you want to reset to the default. */
-extern int setfscreatecon(const char * context);
-extern int setfscreatecon_raw(const char * context);
+extern int setfscreatecon(const char * context) selinux_nodiscard;
+extern int setfscreatecon_raw(const char * context) selinux_nodiscard;
 
 /* Get keycreate context, and set *con to refer to it.
    Sets *con to NULL if no key create context has been set, i.e. using default.
    If non-NULL, caller must free via freecon. */
-extern int getkeycreatecon(char ** con);
-extern int getkeycreatecon_raw(char ** con);
+extern int getkeycreatecon(char ** con) selinux_nonnull((1)) selinux_nodiscard;
+extern int getkeycreatecon_raw(char ** con) selinux_nonnull((1)) selinux_nodiscard;
 
 /* Set the keycreate security context for subsequent key creations.
    Call with NULL if you want to reset to the default. */
-extern int setkeycreatecon(const char * context);
-extern int setkeycreatecon_raw(const char * context);
+extern int setkeycreatecon(const char * context) selinux_nodiscard;
+extern int setkeycreatecon_raw(const char * context) selinux_nodiscard;
 
 /* Get sockcreate context, and set *con to refer to it.
    Sets *con to NULL if no socket create context has been set, i.e. using default.
    If non-NULL, caller must free via freecon. */
-extern int getsockcreatecon(char ** con);
-extern int getsockcreatecon_raw(char ** con);
+extern int getsockcreatecon(char ** con) selinux_nonnull((1)) selinux_nodiscard;
+extern int getsockcreatecon_raw(char ** con) selinux_nonnull((1)) selinux_nodiscard;
 
 /* Set the sockcreate security context for subsequent socket creations.
    Call with NULL if you want to reset to the default. */
-extern int setsockcreatecon(const char * context);
-extern int setsockcreatecon_raw(const char * context);
+extern int setsockcreatecon(const char * context) selinux_nodiscard;
+extern int setsockcreatecon_raw(const char * context) selinux_nodiscard;
 
 /* Wrappers for the xattr API. */
 
 /* Get file context, and set *con to refer to it.
    Caller must free via freecon. */
-extern int getfilecon(const char *path, char ** con);
-extern int getfilecon_raw(const char *path, char ** con);
-extern int lgetfilecon(const char *path, char ** con);
-extern int lgetfilecon_raw(const char *path, char ** con);
-extern int fgetfilecon(int fd, char ** con);
-extern int fgetfilecon_raw(int fd, char ** con);
+extern int getfilecon(const char *path, char ** con) selinux_nonnull((1,2)) selinux_nodiscard;
+extern int getfilecon_raw(const char *path, char ** con) selinux_nonnull((1,2)) selinux_nodiscard;
+extern int lgetfilecon(const char *path, char ** con) selinux_nonnull((1,2)) selinux_nodiscard;
+extern int lgetfilecon_raw(const char *path, char ** con) selinux_nonnull((1,2)) selinux_nodiscard;
+extern int fgetfilecon(int fd, char ** con) selinux_nonnull((2)) selinux_nodiscard;
+extern int fgetfilecon_raw(int fd, char ** con) selinux_nonnull((2)) selinux_nodiscard;
 
 /* Set file context */
-extern int setfilecon(const char *path, const char * con);
-extern int setfilecon_raw(const char *path, const char * con);
-extern int lsetfilecon(const char *path, const char * con);
-extern int lsetfilecon_raw(const char *path, const char * con);
-extern int fsetfilecon(int fd, const char * con);
-extern int fsetfilecon_raw(int fd, const char * con);
+extern int setfilecon(const char *path, const char * con) selinux_nonnull((1,2)) selinux_nodiscard;
+extern int setfilecon_raw(const char *path, const char * con) selinux_nonnull((1,2)) selinux_nodiscard;
+extern int lsetfilecon(const char *path, const char * con) selinux_nonnull((1,2)) selinux_nodiscard;
+extern int lsetfilecon_raw(const char *path, const char * con) selinux_nonnull((1,2)) selinux_nodiscard;
+extern int fsetfilecon(int fd, const char * con) selinux_nonnull((2)) selinux_nodiscard;
+extern int fsetfilecon_raw(int fd, const char * con) selinux_nonnull((2)) selinux_nodiscard;
 
 /* Wrappers for the socket API */
 
 /* Get context of peer socket, and set *con to refer to it.
    Caller must free via freecon. */
-extern int getpeercon(int fd, char ** con);
-extern int getpeercon_raw(int fd, char ** con);
+extern int getpeercon(int fd, char ** con) selinux_nonnull((2)) selinux_nodiscard;
+extern int getpeercon_raw(int fd, char ** con) selinux_nonnull((2)) selinux_nodiscard;
 
 /* Wrappers for the selinuxfs (policy) API. */
 
@@ -156,10 +154,8 @@ struct selinux_opt {
 union selinux_callback {
 	/* log the printf-style format and arguments,
 	   with the type code indicating the type of message */
-	int 
-#ifdef __GNUC__
-__attribute__ ((format(printf, 2, 3)))
-#endif
+	int
+	selinux_format((printf, 2, 3))
 	(*func_log) (int type, const char *fmt, ...);
 	/* store a string representation of auditdata (corresponding
 	   to the given security class) into msgbuf. */
@@ -179,7 +175,7 @@ __attribute__ ((format(printf, 2, 3)))
 #define SELINUX_CB_SETENFORCE	3
 #define SELINUX_CB_POLICYLOAD	4
 
-extern union selinux_callback selinux_get_callback(int type);
+extern union selinux_callback selinux_get_callback(int type) selinux_nodiscard;
 extern void selinux_set_callback(int type, union selinux_callback cb);
 
 	/* Logging type codes, passed to the logging callback */
@@ -196,66 +192,66 @@ extern int security_compute_av(const char * scon,
 			       const char * tcon,
 			       security_class_t tclass,
 			       access_vector_t requested,
-			       struct av_decision *avd);
+			       struct av_decision *avd) selinux_nonnull((1,2,5)) selinux_nodiscard;
 extern int security_compute_av_raw(const char * scon,
 				   const char * tcon,
 				   security_class_t tclass,
 				   access_vector_t requested,
-				   struct av_decision *avd);
+				   struct av_decision *avd) selinux_nonnull((1,2,5)) selinux_nodiscard;
 
 extern int security_compute_av_flags(const char * scon,
 				     const char * tcon,
 				     security_class_t tclass,
 				     access_vector_t requested,
-				     struct av_decision *avd);
+				     struct av_decision *avd) selinux_nonnull((1,2,5)) selinux_nodiscard;
 extern int security_compute_av_flags_raw(const char * scon,
 					 const char * tcon,
 					 security_class_t tclass,
 					 access_vector_t requested,
-					 struct av_decision *avd);
+					 struct av_decision *avd) selinux_nonnull((1,2,5)) selinux_nodiscard;
 
 /* Compute a labeling decision and set *newcon to refer to it.
    Caller must free via freecon. */
 extern int security_compute_create(const char * scon,
 				   const char * tcon,
 				   security_class_t tclass,
-				   char ** newcon);
+				   char ** newcon) selinux_nonnull((1,2,4)) selinux_nodiscard;
 extern int security_compute_create_raw(const char * scon,
 				       const char * tcon,
 				       security_class_t tclass,
-				       char ** newcon);
+				       char ** newcon) selinux_nonnull((1,2,4)) selinux_nodiscard;
 extern int security_compute_create_name(const char * scon,
 					const char * tcon,
 					security_class_t tclass,
 					const char *objname,
-					char ** newcon);
+					char ** newcon) selinux_nonnull((1,2,5)) selinux_nodiscard;
 extern int security_compute_create_name_raw(const char * scon,
 					    const char * tcon,
 					    security_class_t tclass,
 					    const char *objname,
-					    char ** newcon);
+					    char ** newcon) selinux_nonnull((1,2,5)) selinux_nodiscard;
 
 /* Compute a relabeling decision and set *newcon to refer to it.
    Caller must free via freecon. */
 extern int security_compute_relabel(const char * scon,
 				    const char * tcon,
 				    security_class_t tclass,
-				    char ** newcon);
+				    char ** newcon) selinux_nonnull((1,2,4)) selinux_nodiscard;
 extern int security_compute_relabel_raw(const char * scon,
 					const char * tcon,
 					security_class_t tclass,
-					char ** newcon);
+					char ** newcon) selinux_nonnull((1,2,4)) selinux_nodiscard;
 
 /* Compute a polyinstantiation member decision and set *newcon to refer to it.
    Caller must free via freecon. */
 extern int security_compute_member(const char * scon,
 				   const char * tcon,
 				   security_class_t tclass,
-				   char ** newcon);
+				   char ** newcon) selinux_nonnull((1,2,4)) selinux_nodiscard;
 extern int security_compute_member_raw(const char * scon,
 				       const char * tcon,
 				       security_class_t tclass,
-				       char ** newcon);
+				       char ** newcon) selinux_nonnull((1,2,4)) selinux_nodiscard;
 
 /*
  * Compute the set of reachable user contexts and set *con to refer to
@@ -265,10 +261,10 @@ extern int security_compute_member_raw(const char * scon,
  */
 extern int security_compute_user(const char * scon,
 				 const char *username,
-				 char *** con);
+				 char *** con) selinux_nonnull((1,2,3)) selinux_nodiscard;
 extern int security_compute_user_raw(const char * scon,
 				     const char *username,
-				     char *** con);
+				     char *** con) selinux_nonnull((1,2,3)) selinux_nodiscard;
 
 /* Validate a transition. This determines whether a transition from scon to newcon
    using tcon as the target for object class tclass is valid in the loaded policy.
@@ -277,21 +273,21 @@ extern int security_compute_user_raw(const char * scon,
 extern int security_validatetrans(const char *scon,
 				  const char *tcon,
 				  security_class_t tclass,
-				  const char *newcon);
+				  const char *newcon) selinux_nonnull((1,2,4)) selinux_nodiscard;
 extern int security_validatetrans_raw(const char *scon,
 				      const char *tcon,
 				      security_class_t tclass,
-				      const char *newcon);
+				      const char *newcon) selinux_nonnull((1,2,4)) selinux_nodiscard;
 
 /* Load a policy configuration. */
-extern int security_load_policy(const void *data, size_t len);
+extern int security_load_policy(const void *data, size_t len) selinux_nonnull((1)) selinux_nodiscard;
 
 /* Get the context of an initial kernel security identifier by name.  
    Caller must free via freecon */
 extern int security_get_initial_context(const char *name,
-					char ** con);
+					char ** con) selinux_nonnull((1,2)) selinux_nodiscard;
 extern int security_get_initial_context_raw(const char *name,
-					    char ** con);
+					    char ** con) selinux_nonnull((1,2)) selinux_nodiscard;
 
 /*
  * Make a policy image and load it.
@@ -303,7 +299,7 @@ extern int security_get_initial_context_raw(const char *name,
  *
  * 'preservebools' is no longer supported, set to 0.
  */
-extern int selinux_mkload_policy(int preservebools);
+extern int selinux_mkload_policy(int preservebools) selinux_nodiscard;
 
 /* 
  * Perform the initial policy load.
@@ -320,7 +316,7 @@ extern int selinux_mkload_policy(int preservebools);
  * determine how to proceed.  If enforcing (*enforce > 0), then init should
  * halt the system.  Otherwise, init may proceed normally without a re-exec.
  */
-extern int selinux_init_load_policy(int *enforce);
+extern int selinux_init_load_policy(int *enforce) selinux_nonnull((1)) selinux_nodiscard;
 
 /* Translate boolean strict to name value pair. */
 typedef struct {
@@ -331,62 +327,58 @@ typedef struct {
  * longer supported, set to 0.
  */
 extern int security_set_boolean_list(size_t boolcnt,
-				     SELboolean * boollist, int permanent);
+				     SELboolean * boollist, int permanent) selinux_nonnull((2)) selinux_nodiscard;
 
 /* Load policy boolean settings. Deprecated as local policy booleans no
  * longer supported. Will always return -1.
  */
-extern int security_load_booleans(char *path)
-#ifdef __GNUC__
-__attribute__ ((deprecated))
-#endif
-;
+extern int security_load_booleans(char *path) selinux_deprecated("Local booleans are no longer supported");
 
 /* Check the validity of a security context. */
-extern int security_check_context(const char * con);
-extern int security_check_context_raw(const char * con);
+extern int security_check_context(const char * con) selinux_nonnull((1)) selinux_nodiscard;
+extern int security_check_context_raw(const char * con) selinux_nonnull((1)) selinux_nodiscard;
 
 /* Canonicalize a security context. */
 extern int security_canonicalize_context(const char * con,
-					 char ** canoncon);
+					 char ** canoncon) selinux_nonnull((1,2)) selinux_nodiscard;
 extern int security_canonicalize_context_raw(const char * con,
-					     char ** canoncon);
+					     char ** canoncon) selinux_nonnull((1,2)) selinux_nodiscard;
 
 /* Get the enforce flag value. */
-extern int security_getenforce(void);
+extern int security_getenforce(void) selinux_nodiscard;
 
 /* Set the enforce flag value. */
-extern int security_setenforce(int value);
+extern int security_setenforce(int value) selinux_nodiscard;
 
 /* Get the load-time behavior for undefined classes/permissions */
-extern int security_reject_unknown(void);
+extern int security_reject_unknown(void) selinux_nodiscard;
 
 /* Get the runtime behavior for undefined classes/permissions */
-extern int security_deny_unknown(void);
+extern int security_deny_unknown(void); selinux_nodiscard
 
 /* Get the checkreqprot value */
-extern int security_get_checkreqprot(void);
+extern int security_get_checkreqprot(void) selinux_nodiscard;
 
 /* Disable SELinux at runtime (must be done prior to initial policy load). */
-extern int security_disable(void);
+extern int security_disable(void) selinux_nodiscard;
 
 /* Get the policy version number. */
-extern int security_policyvers(void);
+extern int security_policyvers(void) selinux_nodiscard;
 
 /* Get the boolean names */
-extern int security_get_boolean_names(char ***names, int *len);
+extern int security_get_boolean_names(char ***names, int *len) selinux_nodiscard;
 
 /* Get the pending value for the boolean */
-extern int security_get_boolean_pending(const char *name);
+extern int security_get_boolean_pending(const char *name) selinux_nodiscard;
 
 /* Get the active value for the boolean */
-extern int security_get_boolean_active(const char *name);
+extern int security_get_boolean_active(const char *name) selinux_nodiscard;
 
 /* Set the pending value for the boolean */
-extern int security_set_boolean(const char *name, int value);
+extern int security_set_boolean(const char *name, int value) selinux_nodiscard;
 
 /* Commit the pending values for the booleans */
-extern int security_commit_booleans(void);
+extern int security_commit_booleans(void) selinux_nodiscard;
 
 /* Userspace class mapping support */
 struct security_class_mapping {
@@ -413,26 +405,26 @@ struct security_class_mapping {
  * starting at 1, and have one security_class_mapping structure entry
  * per define.
  */
-extern int selinux_set_mapping(struct security_class_mapping *map);
+extern int selinux_set_mapping(struct security_class_mapping *map) selinux_nodiscard;
 
 /* Common helpers */
 
 /* Convert between mode and security class values */
-extern security_class_t mode_to_security_class(mode_t mode);
+extern security_class_t mode_to_security_class(mode_t mode) selinux_nodiscard;
 /* Convert between security class values and string names */
-extern security_class_t string_to_security_class(const char *name);
-extern const char *security_class_to_string(security_class_t cls);
+extern security_class_t string_to_security_class(const char *name) selinux_nonnull((1)) selinux_nodiscard;
+extern const char *security_class_to_string(security_class_t cls) selinux_nodiscard;
 
 /* Convert between individual access vector permissions and string names */
 extern const char *security_av_perm_to_string(security_class_t tclass,
-					      access_vector_t perm);
+					      access_vector_t perm) selinux_nodiscard;
 extern access_vector_t string_to_av_perm(security_class_t tclass,
-					 const char *name);
+					 const char *name) selinux_nonnull((2)) selinux_nodiscard;
 
 /* Returns an access vector in a string representation.  User must free the
  * returned string via free(). */
 extern int security_av_string(security_class_t tclass,
-			      access_vector_t av, char **result);
+			      access_vector_t av, char **result) selinux_nonnull((3)) selinux_nodiscard;
 
 /* Display an access vector in a string representation. */
 extern void print_access_vector(security_class_t tclass, access_vector_t av);
@@ -476,27 +468,19 @@ extern void set_matchpathcon_flags(unsigned int flags);
    function also checks for a 'path'.homedirs file and 
    a 'path'.local file and loads additional specifications 
    from them if present. */
-extern int matchpathcon_init(const char *path)
-#ifdef __GNUC__
-   __attribute__ ((deprecated("Use selabel_open with backend SELABEL_CTX_FILE")))
-#endif
-;
+extern int matchpathcon_init(const char *path) selinux_nodiscard selinux_deprecated("Use selabel_open(3) with backend SELABEL_CTX_FILE");
 
 /* Same as matchpathcon_init, but only load entries with
    regexes that have stems that are prefixes of 'prefix'. */
-extern int matchpathcon_init_prefix(const char *path, const char *prefix);
+extern int matchpathcon_init_prefix(const char *path, const char *prefix) selinux_nodiscard;
 
 /* Free the memory allocated by matchpathcon_init. */
-extern void matchpathcon_fini(void)
-#ifdef __GNUC__
-   __attribute__ ((deprecated("Use selabel_close")))
-#endif
-;
+extern void matchpathcon_fini(void) selinux_deprecated("Use selabel_close(3)");
 
 /* Resolve all of the symlinks and relative portions of a pathname, but NOT
  * the final component (same a realpath() unless the final component is a
  * symlink.  Resolved path must be a path of size PATH_MAX + 1 */
-extern int realpath_not_final(const char *name, char *resolved_path);
+extern int realpath_not_final(const char *name, char *resolved_path) selinux_nonnull((1,2)) selinux_nodiscard;
 
 /* Match the specified pathname and mode against the file contexts
    configuration and set *con to refer to the resulting context.
@@ -505,23 +489,19 @@ extern int realpath_not_final(const char *name, char *resolved_path);
    If matchpathcon_init has not already been called, then this function
    will call it upon its first invocation with a NULL path. */
 extern int matchpathcon(const char *path,
-			mode_t mode, char ** con)
-#ifdef __GNUC__
-	__attribute__ ((deprecated("Use selabel_lookup instead")))
-#endif
-;
+			mode_t mode, char ** con) selinux_nonnull((1,3)) selinux_nodiscard selinux_deprecated("Use selabel_lookup(3)");
 
 /* Same as above, but return a specification index for 
    later use in a matchpathcon_filespec_add() call - see below. */
 extern int matchpathcon_index(const char *path,
-			      mode_t mode, char ** con);
+			      mode_t mode, char ** con) selinux_nonnull((1,3)) selinux_nodiscard;
 
 /* Maintain an association between an inode and a specification index,
    and check whether a conflicting specification is already associated
    with the same inode (e.g. due to multiple hard links).  If so, then
    use the latter of the two specifications based on their order in the 
    file contexts configuration.  Return the used specification index. */
-extern int matchpathcon_filespec_add(ino_t ino, int specind, const char *file);
+extern int matchpathcon_filespec_add(ino_t ino, int specind, const char *file) selinux_nonnull((3)) selinux_nodiscard;
 
 /* Destroy any inode associations that have been added, e.g. to restart
    for a new filesystem. */
@@ -537,14 +517,14 @@ extern void matchpathcon_checkmatches(char *str);
 /* Match the specified media and against the media contexts 
    configuration and set *con to refer to the resulting context.
    Caller must free con via freecon. */
-extern int matchmediacon(const char *media, char ** con);
+extern int matchmediacon(const char *media, char ** con) selinux_nonnull((1,2)) selinux_nodiscard;
 
 /*
   selinux_getenforcemode reads the /etc/selinux/config file and determines 
   whether the machine should be started in enforcing (1), permissive (0) or 
   disabled (-1) mode.
  */
-extern int selinux_getenforcemode(int *enforce);
+extern int selinux_getenforcemode(int *enforce) selinux_nonnull((1)) selinux_nodiscard;
 
 /*
   selinux_boolean_sub reads the /etc/selinux/TYPE/booleans.subs_dist file
@@ -552,73 +532,65 @@ extern int selinux_getenforcemode(int *enforce);
   returns the translated name otherwise it returns the original name.
   The returned value needs to be freed. On failure NULL will be returned.
  */
-extern char *selinux_boolean_sub(const char *boolean_name);
+extern char *selinux_boolean_sub(const char *boolean_name) selinux_nodiscard;
 
 /*
   selinux_getpolicytype reads the /etc/selinux/config file and determines 
   what the default policy for the machine is.  Calling application must 
   free policytype.
  */
-extern int selinux_getpolicytype(char **policytype);
+extern int selinux_getpolicytype(char **policytype) selinux_nonnull((1)) selinux_nodiscard;
 
 /*
   selinux_policy_root reads the /etc/selinux/config file and returns 
   the directory path under which the compiled policy file and context 
   configuration files exist.
  */
-extern const char *selinux_policy_root(void);
+extern const char *selinux_policy_root(void) selinux_nodiscard;
 
 /*
   selinux_set_policy_root sets an alternate policy root directory path under
   which the compiled policy file and context configuration files exist.
  */
-extern int selinux_set_policy_root(const char *rootpath);
+extern int selinux_set_policy_root(const char *rootpath) selinux_nonnull((1)) selinux_nodiscard;
 
 /* These functions return the paths to specific files under the 
    policy root directory. */
-extern const char *selinux_current_policy_path(void);
-extern const char *selinux_binary_policy_path(void);
-extern const char *selinux_failsafe_context_path(void);
-extern const char *selinux_removable_context_path(void);
-extern const char *selinux_default_context_path(void);
-extern const char *selinux_user_contexts_path(void);
-extern const char *selinux_file_context_path(void);
-extern const char *selinux_file_context_homedir_path(void);
-extern const char *selinux_file_context_local_path(void);
-extern const char *selinux_file_context_subs_path(void);
-extern const char *selinux_file_context_subs_dist_path(void);
-extern const char *selinux_homedir_context_path(void);
-extern const char *selinux_media_context_path(void);
-extern const char *selinux_virtual_domain_context_path(void);
-extern const char *selinux_virtual_image_context_path(void);
-extern const char *selinux_lxc_contexts_path(void);
-extern const char *selinux_x_context_path(void);
-extern const char *selinux_sepgsql_context_path(void);
-extern const char *selinux_openrc_contexts_path(void);
-extern const char *selinux_openssh_contexts_path(void);
-extern const char *selinux_snapperd_contexts_path(void);
-extern const char *selinux_systemd_contexts_path(void);
-extern const char *selinux_contexts_path(void);
-extern const char *selinux_securetty_types_path(void);
-extern const char *selinux_booleans_subs_path(void);
+extern const char *selinux_current_policy_path(void) selinux_nodiscard;
+extern const char *selinux_binary_policy_path(void) selinux_nodiscard;
+extern const char *selinux_failsafe_context_path(void) selinux_nodiscard;
+extern const char *selinux_removable_context_path(void) selinux_nodiscard;
+extern const char *selinux_default_context_path(void) selinux_nodiscard;
+extern const char *selinux_user_contexts_path(void) selinux_nodiscard;
+extern const char *selinux_file_context_path(void) selinux_nodiscard;
+extern const char *selinux_file_context_homedir_path(void) selinux_nodiscard;
+extern const char *selinux_file_context_local_path(void) selinux_nodiscard;
+extern const char *selinux_file_context_subs_path(void) selinux_nodiscard;
+extern const char *selinux_file_context_subs_dist_path(void) selinux_nodiscard;
+extern const char *selinux_homedir_context_path(void) selinux_nodiscard;
+extern const char *selinux_media_context_path(void) selinux_nodiscard;
+extern const char *selinux_virtual_domain_context_path(void) selinux_nodiscard;
+extern const char *selinux_virtual_image_context_path(void) selinux_nodiscard;
+extern const char *selinux_lxc_contexts_path(void) selinux_nodiscard;
+extern const char *selinux_x_context_path(void) selinux_nodiscard;
+extern const char *selinux_sepgsql_context_path(void) selinux_nodiscard;
+extern const char *selinux_openrc_contexts_path(void) selinux_nodiscard;
+extern const char *selinux_openssh_contexts_path(void) selinux_nodiscard;
+extern const char *selinux_snapperd_contexts_path(void) selinux_nodiscard;
+extern const char *selinux_systemd_contexts_path(void) selinux_nodiscard;
+extern const char *selinux_contexts_path(void) selinux_nodiscard;
+extern const char *selinux_securetty_types_path(void) selinux_nodiscard;
+extern const char *selinux_booleans_subs_path(void) selinux_nodiscard;
 /* Deprecated as local policy booleans no longer supported. */
-extern const char *selinux_booleans_path(void)
-#ifdef __GNUC__
-__attribute__ ((deprecated))
-#endif
-;
-extern const char *selinux_customizable_types_path(void);
+extern const char *selinux_booleans_path(void) selinux_nodiscard selinux_deprecated("Local booleans are no longer supported");
+extern const char *selinux_customizable_types_path(void) selinux_nodiscard;
 /* Deprecated as policy ./users no longer supported. */
-extern const char *selinux_users_path(void)
-#ifdef __GNUC__
-__attribute__ ((deprecated))
-#endif
-;
-extern const char *selinux_usersconf_path(void);
-extern const char *selinux_translations_path(void);
-extern const char *selinux_colors_path(void);
-extern const char *selinux_netfilter_context_path(void);
-extern const char *selinux_path(void);
+extern const char *selinux_users_path(void) selinux_nodiscard selinux_deprecated("Local users are no longer supported");
+extern const char *selinux_usersconf_path(void) selinux_nodiscard;
+extern const char *selinux_translations_path(void) selinux_nodiscard;
+extern const char *selinux_colors_path(void) selinux_nodiscard;
+extern const char *selinux_netfilter_context_path(void) selinux_nodiscard;
+extern const char *selinux_path(void) selinux_nodiscard;
 
 /**
  * selinux_check_access - Check permissions and perform appropriate auditing.
@@ -637,56 +609,43 @@ extern const char *selinux_path(void);
  * If auditing or logging is configured the appropriate callbacks will be called
  * and passed the auditdata field
  */
-extern int selinux_check_access(const char * scon, const char * tcon, const char *tclass, const char *perm, void *auditdata);
+extern int selinux_check_access(const char * scon, const char * tcon, const char *tclass, const char *perm, void *auditdata) selinux_nonnull((1,2,3,4)) selinux_nodiscard;
 
 /* Check a permission in the passwd class.
    Return 0 if granted or -1 otherwise. */
-extern int selinux_check_passwd_access(access_vector_t requested)
-#ifdef __GNUC__
-  __attribute__ ((deprecated("Use selinux_check_access")))
-#endif
-;
-
-extern int checkPasswdAccess(access_vector_t requested)
-#ifdef __GNUC__
-   __attribute__ ((deprecated("Use selinux_check_access")))
-#endif
-;
+extern int selinux_check_passwd_access(access_vector_t requested) selinux_nodiscard selinux_deprecated("Use selinux_check_access(3)");
+extern int checkPasswdAccess(access_vector_t requested) selinux_nodiscard selinux_deprecated("Use selinux_check_access(3)");
 
 /* Check if the tty_context is defined as a securetty
    Return 0 if secure, < 0 otherwise. */
-extern int selinux_check_securetty_context(const char * tty_context);
+extern int selinux_check_securetty_context(const char * tty_context) selinux_nonnull((1)) selinux_nodiscard;
 
 /* Set the path to the selinuxfs mount point explicitly.
    Normally, this is determined automatically during libselinux 
    initialization, but this is not always possible, e.g. for /sbin/init
    which performs the initial mount of selinuxfs. */
-extern void set_selinuxmnt(const char *mnt);
+extern void set_selinuxmnt(const char *mnt) selinux_nonnull((1));
 
 /* Check if selinuxfs exists as a kernel filesystem */
-extern int selinuxfs_exists(void);
+extern int selinuxfs_exists(void) selinux_nodiscard;
 
 /* clear selinuxmnt variable and free allocated memory */
 extern void fini_selinuxmnt(void);
 
 /* Set an appropriate security context based on the filename of a helper
  * program, falling back to a new context with the specified type. */
-extern int setexecfilecon(const char *filename, const char *fallback_type);
+extern int setexecfilecon(const char *filename, const char *fallback_type) selinux_nonnull((1)) selinux_nodiscard;
 
 #ifndef DISABLE_RPM
 /* Execute a helper for rpm in an appropriate security context. */
 extern int rpm_execcon(unsigned int verified,
 		       const char *filename,
-		       char *const argv[], char *const envp[])
-#ifdef __GNUC__
-	__attribute__((deprecated("Use setexecfilecon and execve")))
-#endif
-;
+		       char *const argv[], char *const envp[]) selinux_deprecated("Use setexecfilecon(3) and execve(2)");
 #endif
 
 /* Returns whether a file context is customizable, and should not 
    be relabeled . */
-extern int is_context_customizable(const char * scontext);
+extern int is_context_customizable(const char * scontext) selinux_nonnull((1)) selinux_nodiscard;
 
 /* Perform context translation between the human-readable format
    ("translated") and the internal system format ("raw"). 
@@ -694,9 +653,9 @@ extern int is_context_customizable(const char * scontext);
    Returns -1 upon an error or 0 otherwise.
    If passed NULL, sets the returned context to NULL and returns 0. */
 extern int selinux_trans_to_raw_context(const char * trans,
-					char ** rawp);
+					char ** rawp) selinux_nonnull((2)) selinux_nodiscard;
 extern int selinux_raw_to_trans_context(const char * raw,
-					char ** transp);
+					char ** transp) selinux_nonnull((2)) selinux_nodiscard;
 
 /* Perform context translation between security contexts
    and display colors.  Returns a space-separated list of ten
@@ -704,14 +663,14 @@ extern int selinux_raw_to_trans_context(const char * raw,
    Caller must free the resulting string via free.
    Returns -1 upon an error or 0 otherwise. */
 extern int selinux_raw_context_to_color(const char * raw,
-					char **color_str);
+					char **color_str) selinux_nonnull((2)) selinux_nodiscard;
 
 /* Get the SELinux username and level to use for a given Linux username. 
    These values may then be passed into the get_ordered_context_list*
    and get_default_context* functions to obtain a context for the user.
    Returns 0 on success or -1 otherwise.
    Caller must free the returned strings via free. */
-extern int getseuserbyname(const char *linuxuser, char **seuser, char **level);
+extern int getseuserbyname(const char *linuxuser, char **seuser, char **level) selinux_nonnull((1,2,3)) selinux_nodiscard;
 
 /* Get the SELinux username and level to use for a given Linux username and service. 
    These values may then be passed into the get_ordered_context_list*
@@ -719,20 +678,21 @@ extern int getseuserbyname(const char *linuxuser, char **seuser, char **level);
    Returns 0 on success or -1 otherwise.
    Caller must free the returned strings via free. */
 extern int getseuser(const char *username, const char *service, 
-		     char **r_seuser, char **r_level);
+		     char **r_seuser, char **r_level) selinux_nonnull((1,3,4)) selinux_nodiscard;
 
-/* Compare two file contexts, return 0 if equivalent. */
+/* Compare two contexts to see if their differences are "significant",
+ * or whether the only difference is in the user. Return 0 if equivalent. */
 extern int selinux_file_context_cmp(const char * a,
-			     const char * b);
+			     const char * b) selinux_nodiscard;
 
 /* 
  * Verify the context of the file 'path' against policy.
  * Return 1 if match, 0 if not and -1 on error.
  */
-extern int selinux_file_context_verify(const char *path, mode_t mode);
+extern int selinux_file_context_verify(const char *path, mode_t mode) selinux_nonnull((1)) selinux_nodiscard;
 
 /* This function sets the file context on to the system defaults returns 0 on success */
-extern int selinux_lsetfilecon_default(const char *path);
+extern int selinux_lsetfilecon_default(const char *path) selinux_nonnull((1)) selinux_nodiscard;
 
 /* 
  * Force a reset of the loaded configuration
diff --git a/libselinux/src/exception.sh b/libselinux/src/exception.sh
index 3b7f2450..15413c7a 100755
--- a/libselinux/src/exception.sh
+++ b/libselinux/src/exception.sh
@@ -28,10 +28,10 @@ FILE_LIST=(
     ../include/selinux/label.h
     ../include/selinux/restorecon.h
 )
-if ! cat "${FILE_LIST[@]}" | ${CC:-gcc} -x c -c -I../include -o temp.o - -aux-info temp.aux
+if ! cat "${FILE_LIST[@]}" | ${CC:-gcc} -x c -c -I../include -DNO_INCLUDE_ERROR -o temp.o - -aux-info temp.aux
 then
     # clang does not support -aux-info so fall back to gcc
-    cat "${FILE_LIST[@]}" | gcc -x c -c -I../include -o temp.o - -aux-info temp.aux
+    cat "${FILE_LIST[@]}" | gcc -x c -c -I../include -DNO_INCLUDE_ERROR -o temp.o - -aux-info temp.aux
 fi
 for i in `awk '/<stdin>.*extern int/ { print $6 }' temp.aux`; do except $i ; done 
 rm -f -- temp.aux temp.o
diff --git a/libselinux/src/selinuxswig.i b/libselinux/src/selinuxswig.i
index dbdb4c3d..42e31e10 100644
--- a/libselinux/src/selinuxswig.i
+++ b/libselinux/src/selinuxswig.i
@@ -57,6 +57,7 @@
 %ignore avc_netlink_release_fd;
 %ignore avc_netlink_check_nb;
 
+%include "../include/selinux/_private.h"
 %include "../include/selinux/avc.h"
 %include "../include/selinux/context.h"
 %include "../include/selinux/get_context_list.h"
diff --git a/scripts/run-scan-build b/scripts/run-scan-build
index 931ffd2a..5a79c8bc 100755
--- a/scripts/run-scan-build
+++ b/scripts/run-scan-build
@@ -32,7 +32,7 @@ fi
 make -C .. clean distclean -j"$(nproc)"
 $SCAN_BUILD -analyze-headers -o "$OUTPUTDIR" make -C .. \
     DESTDIR="$DESTDIR" \
-    CFLAGS="-O2 -Wall -Wextra -D_FORTIFY_SOURCE=2 -D__CHECKER__ -I$DESTDIR/usr/include" \
+    CFLAGS="-O2 -Wall -Wextra -D_FORTIFY_SOURCE=2 -D__CHECKER__ -DNO_INCLUDE_ERROR -I$DESTDIR/usr/include" \
     -j"$(nproc)" \
     install install-pywrap install-rubywrap all test
 
-- 
2.40.1

