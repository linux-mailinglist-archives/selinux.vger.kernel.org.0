Return-Path: <selinux+bounces-75-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6CD8066FB
	for <lists+selinux@lfdr.de>; Wed,  6 Dec 2023 07:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E0E31C21275
	for <lists+selinux@lfdr.de>; Wed,  6 Dec 2023 06:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA756134AA;
	Wed,  6 Dec 2023 06:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="Xjve/251"
X-Original-To: selinux@vger.kernel.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 796D3D41
	for <selinux@vger.kernel.org>; Tue,  5 Dec 2023 22:06:35 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6ce72faf1e8so1039066b3a.0
        for <selinux@vger.kernel.org>; Tue, 05 Dec 2023 22:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1701842795; x=1702447595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8wgNl1PchXcHI5F0qOFxbj06sbuE+5yXttvrgVz+ro=;
        b=Xjve/251Fqx9HCpRQ+sthCif1vXTCZi9TuR3dET8NQ5NeHqYD1yi+XNWOLpLkuK8IO
         01Ohgxf0N/isIx5y0MdGk72WDMA4YrIEbeO+E0EYikWDO2FkIejJgiys1VYPmwXT5nrW
         D6eUEuoK/+u9lOIpKSYJwd2RFXp+wnah6N1enac4ckeuZ5vQGPMOXVUVkUIlQo/XzBL9
         lyxMzrceGSNV/3XAIKiwTri/q9fMAdZXqc9w0t0zjgiO3UgnSj1gyGj7fbqmGbEITj9D
         kOLZ5A0r+dw5szr5k3BT8OXKr6OBrHs1C6uGgOyY09Ug4gKA4qDSy/uJHZgYnnart1+n
         +jLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701842795; x=1702447595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8wgNl1PchXcHI5F0qOFxbj06sbuE+5yXttvrgVz+ro=;
        b=BP14w+HkPZ+Cgqj9W31fTMAfhl5K0wg6oY9ocvMWyaRnjLYlsjQlQgkE4zV6+BhL4j
         /QddFJCy4f8rquFsBrRff0d3p7uMFHwrEIJ4awWYt9cI5zLwClqqzpJ0ak6QCRk9oaHi
         FGZ5wgzPra8Z6nx+wGlD+OgT+O4XQMG2orayUBbAiXlJjwioy6BJ2cSegooylGMtIhvW
         ONo1Mq7KkP3VDCPoOZOeveQpkmmz90EjJ9JIBmuUIuP2kLdQvBbEjzhaDeyBNlVPkSkw
         JAXvMIAqcXPYmYrbGa3JlG2JenPZ/XrtDla9qMwzN+MJXfEw4z0SkFUlw4ORJmuH+eIA
         KxoA==
X-Gm-Message-State: AOJu0YycKo48GXGV0z9qu3yf0vJ5LC5unSSXswR7sEzRT92ZrTZ8vQAd
	tdWzsZG4TKX87QDeDU1vmTe5lg==
X-Google-Smtp-Source: AGHT+IEdPXfNmvKvrswUKJHm+sFsPS7aPY/u0WjJJT2ny1b5k9BwlvRmtzalQC13yVeEtaaHy4KiTw==
X-Received: by 2002:a05:6a20:c19e:b0:18f:97c:8254 with SMTP id bg30-20020a056a20c19e00b0018f097c8254mr292006pzb.94.1701842794864;
        Tue, 05 Dec 2023 22:06:34 -0800 (PST)
Received: from dread.disaster.area (pa49-180-125-5.pa.nsw.optusnet.com.au. [49.180.125.5])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902bd0c00b001d0c5037ed3sm2322833pls.46.2023.12.05.22.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 22:06:33 -0800 (PST)
Received: from [192.168.253.23] (helo=devoid.disaster.area)
	by dread.disaster.area with esmtp (Exim 4.96)
	(envelope-from <dave@fromorbit.com>)
	id 1rAl3I-004VOz-0c;
	Wed, 06 Dec 2023 17:06:31 +1100
Received: from dave by devoid.disaster.area with local (Exim 4.97-RC0)
	(envelope-from <dave@devoid.disaster.area>)
	id 1rAl3H-0000000BrVV-32vJ;
	Wed, 06 Dec 2023 17:06:31 +1100
From: Dave Chinner <david@fromorbit.com>
To: linux-fsdevel@vger.kernel.org
Cc: linux-block@vger.kernel.org,
	linux-cachefs@redhat.com,
	dhowells@redhat.com,
	gfs2@lists.linux.dev,
	dm-devel@lists.linux.dev,
	linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] hlist-bl: add hlist_bl_fake()
Date: Wed,  6 Dec 2023 17:05:36 +1100
Message-ID: <20231206060629.2827226-8-david@fromorbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231206060629.2827226-1-david@fromorbit.com>
References: <20231206060629.2827226-1-david@fromorbit.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dave Chinner <dchinner@redhat.com>

in preparation for switching the VFS inode cache over the hlist_bl
lists, we nee dto be able to fake a list node that looks like it is
hased for correct operation of filesystems that don't directly use
the VFS indoe cache.

Signed-off-by: Dave Chinner <dchinner@redhat.com>
---
 include/linux/list_bl.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/list_bl.h b/include/linux/list_bl.h
index ae1b541446c9..8ee2bf5af131 100644
--- a/include/linux/list_bl.h
+++ b/include/linux/list_bl.h
@@ -143,6 +143,28 @@ static inline void hlist_bl_del_init(struct hlist_bl_node *n)
 	}
 }
 
+/**
+ * hlist_bl_add_fake - create a fake list consisting of a single headless node
+ * @n: Node to make a fake list out of
+ *
+ * This makes @n appear to be its own predecessor on a headless hlist.
+ * The point of this is to allow things like hlist_bl_del() to work correctly
+ * in cases where there is no list.
+ */
+static inline void hlist_bl_add_fake(struct hlist_bl_node *n)
+{
+	n->pprev = &n->next;
+}
+
+/**
+ * hlist_fake: Is this node a fake hlist_bl?
+ * @h: Node to check for being a self-referential fake hlist.
+ */
+static inline bool hlist_bl_fake(struct hlist_bl_node *n)
+{
+	return n->pprev == &n->next;
+}
+
 static inline void hlist_bl_lock(struct hlist_bl_head *b)
 {
 	bit_spin_lock(0, (unsigned long *)b);
-- 
2.42.0


