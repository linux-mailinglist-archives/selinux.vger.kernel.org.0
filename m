Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B757246E64
	for <lists+selinux@lfdr.de>; Mon, 17 Aug 2020 19:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389409AbgHQR2m (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 17 Aug 2020 13:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389325AbgHQRI1 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 17 Aug 2020 13:08:27 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C61C061344
        for <selinux@vger.kernel.org>; Mon, 17 Aug 2020 10:08:27 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id w30so12508618qte.14
        for <selinux@vger.kernel.org>; Mon, 17 Aug 2020 10:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=UJJuAgJHQPnZMmpmLTzANSSOedGbmL0b+IVXcx3Ufzs=;
        b=v0rOCwpTkjRzfGnF2j8U3++ah+cWR7bAfIci0JLRCzHhoCND9w63qxJtFji0g8qm9H
         JW5ukYsE4fnaO28tNwcBnJBn+DfmI6r3Y8OpLmZ09l2xXBekBeJYwvliiHfSCzfZCYZr
         xpmhjHdU9y/aXL1u2l7zv4WdzHctL3iaH5QPKoW5+ZbyJAP434SVP1+HMc+UlaLV6csV
         1f2KBTPi23YkBo9huXsOLBGbm8eUZlzOXnlnB7+nsmHQmjHxCwRIY0Vl8jnb8MnPPL7g
         kYLQTvVM+GkrKIDg644UJzInyNQ7U+yQcJke/tymBPP0BEs0jK63wAwJWMpVQW1GLoJ4
         Mq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=UJJuAgJHQPnZMmpmLTzANSSOedGbmL0b+IVXcx3Ufzs=;
        b=X53D29TWyV/dWxk3jAWX3iqJ1bsycuN0eJvD7Q+Glf4ensS6joODcTCxt2oAYABD9E
         JHvpsHzeM3U6NO+RmT0c7pg8zcAR0IBulifMe13CNHrnBhHhmHhhdv81FwDaOLHyRu07
         5D75R72HB1Ecnkpke8cH5bAYc8b3US/E5+tyr8AWiAnQoQu9kBYNKcUpLFCxazcftWjx
         OCsyNJJAJx6pquVA/GM/mrMWtfYnqGYfvlTl1GDVoqgVvLSNVxyWJmUO3ZWNxsP4TVrH
         m151fVdzFnrIBLnnmOrlrthspYkFEa1pWt1AyNxIOR0H9ccxu78un2Fnn0xa8Lozihak
         6QcQ==
X-Gm-Message-State: AOAM5334WzPI1p2j/UKXvFETx2kdFo3bc72qGbJl/b5WOv4pt1UNxDJl
        WQiMXPq28cACPnvFhyHuwsJl8/+SIA==
X-Google-Smtp-Source: ABdhPJz6qBKxAvbT13/LVRv5sOiMCXyLh1r546HBd6vDU0zkwqi5WeiV04XRE3fbBoM67yo8+87qI6KMZw==
X-Received: by 2002:a0c:f6cb:: with SMTP id d11mr15516103qvo.84.1597684106062;
 Mon, 17 Aug 2020 10:08:26 -0700 (PDT)
Date:   Mon, 17 Aug 2020 19:07:12 +0200
In-Reply-To: <20200817170729.2605279-1-tweek@google.com>
Message-Id: <20200817170729.2605279-2-tweek@google.com>
Mime-Version: 1.0
References: <20200817170729.2605279-1-tweek@google.com>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: [PATCH v3 1/3] selinux: add tracepoint on audited events
From:   "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>
To:     Paul Moore <paul@paul-moore.com>
Cc:     Nick Kralevich <nnk@google.com>,
        "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>,
        Joel Fernandes <joelaf@google.com>,
        Peter Enderborg <peter.enderborg@sony.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
        selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The audit data currently captures which process and which target
is responsible for a denial. There is no data on where exactly in the
process that call occurred. Debugging can be made easier by being able to
reconstruct the unified kernel and userland stack traces [1]. Add a
tracepoint on the SELinux denials which can then be used by userland
(i.e. perf).

Although this patch could manually be added by each OS developer to
trouble shoot a denial, adding it to the kernel streamlines the
developers workflow.

It is possible to use perf for monitoring the event:
  # perf record -e avc:selinux_audited -g -a
  ^C
  # perf report -g
  [...]
      6.40%     6.40%  audited=3D800000 tclass=3D4
               |
                  __libc_start_main
                  |
                  |--4.60%--__GI___ioctl
                  |          entry_SYSCALL_64
                  |          do_syscall_64
                  |          __x64_sys_ioctl
                  |          ksys_ioctl
                  |          binder_ioctl
                  |          binder_set_nice
                  |          can_nice
                  |          capable
                  |          security_capable
                  |          cred_has_capability.isra.0
                  |          slow_avc_audit
                  |          common_lsm_audit
                  |          avc_audit_post_callback
                  |          avc_audit_post_callback
                  |

It is also possible to use the ftrace interface:
  # echo 1 > /sys/kernel/debug/tracing/events/avc/selinux_audited/enable
  # cat /sys/kernel/debug/tracing/trace
  tracer: nop
  entries-in-buffer/entries-written: 1/1   #P:8
  [...]
  dmesg-3624  [001] 13072.325358: selinux_denied: audited=3D800000 tclass=
=3D4

The tclass value can be mapped to a class by searching
security/selinux/flask.h. The audited value is a bit field of the
permissions described in security/selinux/av_permissions.h for the
corresponding class.

[1] https://source.android.com/devices/tech/debug/native_stack_dump

Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
Suggested-by: Joel Fernandes <joelaf@google.com>
Reviewed-by: Peter Enderborg <peter.enderborg@sony.com>
---
 MAINTAINERS                |  1 +
 include/trace/events/avc.h | 37 +++++++++++++++++++++++++++++++++++++
 security/selinux/avc.c     |  5 +++++
 3 files changed, 43 insertions(+)
 create mode 100644 include/trace/events/avc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c8e8232c65da..0efaea0e144c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15426,6 +15426,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/gi=
t/pcmoore/selinux.git
 F:	Documentation/ABI/obsolete/sysfs-selinux-checkreqprot
 F:	Documentation/ABI/obsolete/sysfs-selinux-disable
 F:	Documentation/admin-guide/LSM/SELinux.rst
+F:	include/trace/events/avc.h
 F:	include/uapi/linux/selinux_netlink.h
 F:	scripts/selinux/
 F:	security/selinux/
diff --git a/include/trace/events/avc.h b/include/trace/events/avc.h
new file mode 100644
index 000000000000..07c058a9bbcd
--- /dev/null
+++ b/include/trace/events/avc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Author: Thi=C3=A9baud Weksteen <tweek@google.com>
+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM avc
+
+#if !defined(_TRACE_SELINUX_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_SELINUX_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(selinux_audited,
+
+	TP_PROTO(struct selinux_audit_data *sad),
+
+	TP_ARGS(sad),
+
+	TP_STRUCT__entry(
+		__field(unsigned int, tclass)
+		__field(unsigned int, audited)
+	),
+
+	TP_fast_assign(
+		__entry->tclass =3D sad->tclass;
+		__entry->audited =3D sad->audited;
+	),
+
+	TP_printk("tclass=3D%u audited=3D%x",
+		__entry->tclass,
+		__entry->audited)
+);
+
+#endif
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
diff --git a/security/selinux/avc.c b/security/selinux/avc.c
index d18cb32a242a..b0a0af778b70 100644
--- a/security/selinux/avc.c
+++ b/security/selinux/avc.c
@@ -31,6 +31,9 @@
 #include "avc_ss.h"
 #include "classmap.h"
=20
+#define CREATE_TRACE_POINTS
+#include <trace/events/avc.h>
+
 #define AVC_CACHE_SLOTS			512
 #define AVC_DEF_CACHE_THRESHOLD		512
 #define AVC_CACHE_RECLAIM		16
@@ -706,6 +709,8 @@ static void avc_audit_post_callback(struct audit_buffer=
 *ab, void *a)
 	u32 scontext_len;
 	int rc;
=20
+	trace_selinux_audited(sad);
+
 	rc =3D security_sid_to_context(sad->state, sad->ssid, &scontext,
 				     &scontext_len);
 	if (rc)
--=20
2.28.0.220.ged08abb693-goog

