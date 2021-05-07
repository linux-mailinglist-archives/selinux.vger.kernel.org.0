Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 132B337698D
	for <lists+selinux@lfdr.de>; Fri,  7 May 2021 19:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233706AbhEGRix (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 7 May 2021 13:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbhEGRiw (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 7 May 2021 13:38:52 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6236EC061574
        for <selinux@vger.kernel.org>; Fri,  7 May 2021 10:37:52 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id q127so9290960qkb.1
        for <selinux@vger.kernel.org>; Fri, 07 May 2021 10:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b7LhBs4WHufBGsoYes1QfkCIJLn9/rdDGjl2rHEtDq4=;
        b=RclHM2h4vlowqt9pMA/T8BCL2DQF3HQSrwAfFgzwD5DtJsKhavo3h7Ws14lsHfUC+x
         qq84YBKSNZWbR8ADSgrFX0WtEFzcckEBV02P0Ki4uHkKF80kqm6XgDpbKO9pHPHauvu9
         OIRSA3IgFVlkE7wqNm2O0QozNSzjKGL0LD+UynLLII+AmFd5Lv0ypwysJwcQ7TScfPI9
         RbNSoPlVOVrBu2FOgX7Wg62C0/7jIJmcnwOdw1EAoXFe2Z8X8PSOdl8b9r0WiUhLFP6l
         QS2P0wFQr03AQCb2MY+aXjCLuFNHp7M5WK0TfsHYs+FXzfFuE06akutG8tM/eHs4wFEy
         fDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b7LhBs4WHufBGsoYes1QfkCIJLn9/rdDGjl2rHEtDq4=;
        b=IOcJSApSSqy0oCnVoEpAvaAvKQS2gTjH+1UydU+ij5qsRW0EximzapgTCMej7oueVc
         K7FebrI8pm1V4VseoPJHsJR/mroglEg39RaVv0n5RgX41jFzaSLqSkzyBKd/++tBr1K9
         uCfqPk6vWV6oTNqHX7cPdbQFF8nuO1UvneChzlPIOdI1yDJnVnO+hrMXMkLr+Wvv92I8
         gh88w4Ojz0bFyPNXRoUuzHiUFP4iKoUsWHh+Vma8mzV+6Gd1yaYxCzCxnvuhRQT/9q6Q
         V4HHUJu2MQ5ysPX7aN7XNE/nxloec4r0PQH77x39B0wqyHF7oOL6uq2kLWrbIymoemwk
         2DuQ==
X-Gm-Message-State: AOAM5300MbYq9CcLiGFYKjlSX0Y3u6Aa+xyQ91c72bTBLq6ctcNIIRSi
        C8LXa1PN2zK88OYOQ9nuyhTR2DfY4peaWw==
X-Google-Smtp-Source: ABdhPJwdsWinrhhFZSpmvOenExxcp5CeyrmeLn8ATblUwyCGRUZ36d6igZa1zO5aneDQsYWqGfR4kQ==
X-Received: by 2002:a37:a1d8:: with SMTP id k207mr11533589qke.285.1620409071226;
        Fri, 07 May 2021 10:37:51 -0700 (PDT)
Received: from localhost.localdomain (c-73-200-157-122.hsd1.md.comcast.net. [73.200.157.122])
        by smtp.gmail.com with ESMTPSA id f26sm5386475qtg.17.2021.05.07.10.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 10:37:50 -0700 (PDT)
From:   James Carter <jwcart2@gmail.com>
To:     selinux@vger.kernel.org
Cc:     James Carter <jwcart2@gmail.com>
Subject: [PATCH 2/3] libsepol/cil: Copy and resolve macro calls in one pass
Date:   Fri,  7 May 2021 13:37:43 -0400
Message-Id: <20210507173744.198858-2-jwcart2@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507173744.198858-1-jwcart2@gmail.com>
References: <20210507173744.198858-1-jwcart2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Lorenzo Ceragioli <lorenzo.ceragioli@phd.unipi.it> noted that the
following policy:
  (type a)
  (block A
    (macro m ((type x))
      (type a)
      (allow x x (file (read))))
  )
  (block B
    (call A.m(a))
  )
results in the allow rule (allow B.a B.a (file(read))). This makes
no sense because the "a" being passed as an argument has to be the
global "a" and not the "a" defined in the macro.

This behavior occurs because the call arguments are resolved AFTER
the macro body has been copied and the declaration of "a" in the
macro has been added to block B's namespace, so this is the "a"
that the call argument resolves to, rather than the one in the
global namespace.

It turns out that calls can be copied and resolved in one pass.

Resolve the call arguments first and then copy the macro rules
all in one pass.

Signed-off-by: James Carter <jwcart2@gmail.com>
---
 libsepol/cil/src/cil_resolve_ast.c | 620 +++++++++++++++--------------
 1 file changed, 312 insertions(+), 308 deletions(-)

diff --git a/libsepol/cil/src/cil_resolve_ast.c b/libsepol/cil/src/cil_resolve_ast.c
index bbe86e22..740a9b5e 100644
--- a/libsepol/cil/src/cil_resolve_ast.c
+++ b/libsepol/cil/src/cil_resolve_ast.c
@@ -2840,338 +2840,300 @@ exit:
 	return rc;
 }
 
-int cil_resolve_call1(struct cil_tree_node *current, void *extra_args)
+static int cil_build_call_args(struct cil_tree_node *call_node, struct cil_call *call, struct cil_macro *macro, void *extra_args)
 {
-	struct cil_call *new_call = current->data;
 	struct cil_args_resolve *args = extra_args;
-	struct cil_db *db = NULL;
-	struct cil_tree_node *macro_node = NULL;
-	struct cil_symtab_datum *macro_datum = NULL;
+	struct cil_list_item *item;
+	struct cil_args *arg = NULL;
+	struct cil_tree_node *arg_node = NULL;
 	int rc = SEPOL_ERR;
 
-	if (args != NULL) {
-		db = args->db;
+	if (macro->params == NULL) {
+		if (call->args_tree == NULL) {
+			return SEPOL_OK;
+		} else {
+			cil_tree_log(call_node, CIL_ERR, "Unexpected arguments");
+			return SEPOL_ERR;;
+		}
 	}
-
-	rc = cil_resolve_name(current, new_call->macro_str, CIL_SYM_BLOCKS, extra_args, &macro_datum);
-	if (rc != SEPOL_OK) {
-		goto exit;
+	if (call->args_tree == NULL) {
+		cil_tree_log(call_node, CIL_ERR, "Missing arguments");
+		return SEPOL_ERR;
 	}
 
-	macro_node = NODE(macro_datum);
+	arg_node = call->args_tree->root->cl_head;
 
-	if (macro_node->flavor != CIL_MACRO) {
-		cil_tree_log(current, CIL_ERR, "Failed to resolve %s to a macro", new_call->macro_str);
-		rc = SEPOL_ERR;
-		goto exit;
-	}
-	new_call->macro = (struct cil_macro*)macro_datum;
+	cil_list_init(&call->args, CIL_LIST_ITEM);
 
-	if (new_call->macro->params != NULL ) {
-
-		struct cil_list_item *item;
-		struct cil_args *new_arg = NULL;
-		struct cil_tree_node *pc = NULL;
+	cil_list_for_each(item, macro->params) {
+		enum cil_flavor flavor = ((struct cil_param*)item->data)->flavor;
 
-		if (new_call->args_tree == NULL) {
-			cil_tree_log(current, CIL_ERR, "Missing arguments");
+		if (arg_node == NULL) {
+			cil_tree_log(call_node, CIL_ERR, "Missing arguments");
+			rc = SEPOL_ERR;
+			goto exit;
+		}
+		if (item->flavor != CIL_PARAM) {
 			rc = SEPOL_ERR;
 			goto exit;
 		}
 
-		pc = new_call->args_tree->root->cl_head;
-
-		cil_list_init(&new_call->args, CIL_LIST_ITEM);
-
-		cil_list_for_each(item, new_call->macro->params) {
-			enum cil_flavor flavor = ((struct cil_param*)item->data)->flavor;
+		cil_args_init(&arg);
 
-			if (pc == NULL) {
-				cil_tree_log(current, CIL_ERR, "Missing arguments");
+		switch (flavor) {
+		case CIL_NAME: {
+			struct cil_name *name;
+			if (arg_node->data == NULL) {
+				cil_tree_log(call_node, CIL_ERR, "Invalid macro parameter");
+				cil_destroy_args(arg);
 				rc = SEPOL_ERR;
 				goto exit;
 			}
-			if (item->flavor != CIL_PARAM) {
+			name = __cil_insert_name(args->db, arg_node->data, call_node);
+			if (name != NULL) {
+				arg->arg = (struct cil_symtab_datum *)name;
+			} else {
+				arg->arg_str = arg_node->data;
+			}
+		}
+			break;
+		case CIL_TYPE:
+			if (arg_node->data == NULL) {
+				cil_tree_log(call_node, CIL_ERR, "Invalid macro parameter");
+				cil_destroy_args(arg);
 				rc = SEPOL_ERR;
 				goto exit;
 			}
-
-			cil_args_init(&new_arg);
-
-			switch (flavor) {
-			case CIL_NAME: {
-				struct cil_name *name;
-				if (pc->data == NULL) {
-					cil_tree_log(current, CIL_ERR, "Invalid macro parameter");
-					cil_destroy_args(new_arg);
-					rc = SEPOL_ERR;
-					goto exit;
-				}
-				name = __cil_insert_name(args->db, pc->data, current);
-				if (name != NULL) {
-					new_arg->arg = (struct cil_symtab_datum *)name;
-				} else {
-					new_arg->arg_str = pc->data;
-				}
+			arg->arg_str = arg_node->data;
+			break;
+		case CIL_ROLE:
+			if (arg_node->data == NULL) {
+				cil_tree_log(call_node, CIL_ERR, "Invalid macro parameter");
+				cil_destroy_args(arg);
+				rc = SEPOL_ERR;
+				goto exit;
 			}
-				break;
-			case CIL_TYPE:
-				if (pc->data == NULL) {
-					cil_tree_log(current, CIL_ERR, "Invalid macro parameter");
-					cil_destroy_args(new_arg);
-					rc = SEPOL_ERR;
-					goto exit;
-				}
-				new_arg->arg_str = pc->data;
-				break;
-			case CIL_ROLE:
-				if (pc->data == NULL) {
-					cil_tree_log(current, CIL_ERR, "Invalid macro parameter");
-					cil_destroy_args(new_arg);
-					rc = SEPOL_ERR;
-					goto exit;
-				}
-				new_arg->arg_str = pc->data;
-				break;
-			case CIL_USER:
-				if (pc->data == NULL) {
-					cil_tree_log(current, CIL_ERR, "Invalid macro parameter");
-					cil_destroy_args(new_arg);
-					rc = SEPOL_ERR;
-					goto exit;
-				}
-				new_arg->arg_str = pc->data;
-				break;
-			case CIL_SENS:
-				if (pc->data == NULL) {
-					cil_tree_log(current, CIL_ERR, "Invalid macro parameter");
-					cil_destroy_args(new_arg);
-					rc = SEPOL_ERR;
-					goto exit;
-				}
-				new_arg->arg_str = pc->data;
-				break;
-			case CIL_CAT:
-				if (pc->data == NULL) {
-					cil_tree_log(current, CIL_ERR, "Invalid macro parameter");
-					cil_destroy_args(new_arg);
-					rc = SEPOL_ERR;
-					goto exit;
-				}
-				new_arg->arg_str = pc->data;
-				break;
-			case CIL_BOOL:
-				if (pc->data == NULL) {
-					cil_tree_log(current, CIL_ERR, "Invalid macro parameter");
-					cil_destroy_args(new_arg);
-					rc = SEPOL_ERR;
-					goto exit;
-				}
-				new_arg->arg_str = pc->data;
-				break;
-			case CIL_CATSET: {
-				if (pc->cl_head != NULL) {
-					struct cil_catset *catset = NULL;
-					struct cil_tree_node *cat_node = NULL;
-					cil_catset_init(&catset);
-					rc = cil_fill_cats(pc, &catset->cats);
-					if (rc != SEPOL_OK) {
-						cil_destroy_catset(catset);
-						cil_destroy_args(new_arg);
-						goto exit;
-					}
-					cil_tree_node_init(&cat_node);
-					cat_node->flavor = CIL_CATSET;
-					cat_node->data = catset;
-					cil_list_append(((struct cil_symtab_datum*)catset)->nodes,
-									CIL_LIST_ITEM, cat_node);
-					new_arg->arg = (struct cil_symtab_datum*)catset;
-				} else if (pc->data == NULL) {
-					cil_tree_log(current, CIL_ERR, "Invalid macro parameter");
-					cil_destroy_args(new_arg);
-					rc = SEPOL_ERR;
+			arg->arg_str = arg_node->data;
+			break;
+		case CIL_USER:
+			if (arg_node->data == NULL) {
+				cil_tree_log(call_node, CIL_ERR, "Invalid macro parameter");
+				cil_destroy_args(arg);
+				rc = SEPOL_ERR;
+				goto exit;
+			}
+			arg->arg_str = arg_node->data;
+			break;
+		case CIL_SENS:
+			if (arg_node->data == NULL) {
+				cil_tree_log(call_node, CIL_ERR, "Invalid macro parameter");
+				cil_destroy_args(arg);
+				rc = SEPOL_ERR;
+				goto exit;
+			}
+			arg->arg_str = arg_node->data;
+			break;
+		case CIL_CAT:
+			if (arg_node->data == NULL) {
+				cil_tree_log(call_node, CIL_ERR, "Invalid macro parameter");
+				cil_destroy_args(arg);
+				rc = SEPOL_ERR;
+				goto exit;
+			}
+			arg->arg_str = arg_node->data;
+			break;
+		case CIL_BOOL:
+			if (arg_node->data == NULL) {
+				cil_tree_log(call_node, CIL_ERR, "Invalid macro parameter");
+				cil_destroy_args(arg);
+				rc = SEPOL_ERR;
+				goto exit;
+			}
+			arg->arg_str = arg_node->data;
+			break;
+		case CIL_CATSET: {
+			if (arg_node->cl_head != NULL) {
+				struct cil_catset *catset = NULL;
+				struct cil_tree_node *cat_node = NULL;
+				cil_catset_init(&catset);
+				rc = cil_fill_cats(arg_node, &catset->cats);
+				if (rc != SEPOL_OK) {
+					cil_destroy_catset(catset);
+					cil_destroy_args(arg);
 					goto exit;
-				} else {
-					new_arg->arg_str = pc->data;
 				}
-
-				break;
+				cil_tree_node_init(&cat_node);
+				cat_node->flavor = CIL_CATSET;
+				cat_node->data = catset;
+				cil_list_append(((struct cil_symtab_datum*)catset)->nodes,
+								CIL_LIST_ITEM, cat_node);
+				arg->arg = (struct cil_symtab_datum*)catset;
+			} else if (arg_node->data == NULL) {
+				cil_tree_log(call_node, CIL_ERR, "Invalid macro parameter");
+				cil_destroy_args(arg);
+				rc = SEPOL_ERR;
+				goto exit;
+			} else {
+				arg->arg_str = arg_node->data;
 			}
-			case CIL_LEVEL: {
-				if (pc->cl_head != NULL) {
-					struct cil_level *level = NULL;
-					struct cil_tree_node *lvl_node = NULL;
-					cil_level_init(&level);
-
-					rc = cil_fill_level(pc->cl_head, level);
-					if (rc != SEPOL_OK) {
-						cil_log(CIL_ERR, "Failed to create anonymous level, rc: %d\n", rc);
-						cil_destroy_level(level);
-						cil_destroy_args(new_arg);
-						goto exit;
-					}
-					cil_tree_node_init(&lvl_node);
-					lvl_node->flavor = CIL_LEVEL;
-					lvl_node->data = level;
-					cil_list_append(((struct cil_symtab_datum*)level)->nodes, 
-									CIL_LIST_ITEM, lvl_node);
-					new_arg->arg = (struct cil_symtab_datum*)level;
-				} else if (pc->data == NULL) {
-					cil_tree_log(current, CIL_ERR, "Invalid macro parameter");
-					cil_destroy_args(new_arg);
-					rc = SEPOL_ERR;
+
+			break;
+		}
+		case CIL_LEVEL: {
+			if (arg_node->cl_head != NULL) {
+				struct cil_level *level = NULL;
+				struct cil_tree_node *lvl_node = NULL;
+				cil_level_init(&level);
+
+				rc = cil_fill_level(arg_node->cl_head, level);
+				if (rc != SEPOL_OK) {
+					cil_log(CIL_ERR, "Failed to create anonymous level, rc: %d\n", rc);
+					cil_destroy_level(level);
+					cil_destroy_args(arg);
 					goto exit;
-				} else {
-					new_arg->arg_str = pc->data;
 				}
-
-				break;
+				cil_tree_node_init(&lvl_node);
+				lvl_node->flavor = CIL_LEVEL;
+				lvl_node->data = level;
+				cil_list_append(((struct cil_symtab_datum*)level)->nodes,
+								CIL_LIST_ITEM, lvl_node);
+				arg->arg = (struct cil_symtab_datum*)level;
+			} else if (arg_node->data == NULL) {
+				cil_tree_log(call_node, CIL_ERR, "Invalid macro parameter");
+				cil_destroy_args(arg);
+				rc = SEPOL_ERR;
+				goto exit;
+			} else {
+				arg->arg_str = arg_node->data;
 			}
-			case CIL_LEVELRANGE: {
-				if (pc->cl_head != NULL) {
-					struct cil_levelrange *range = NULL;
-					struct cil_tree_node *range_node = NULL;
-					cil_levelrange_init(&range);
-
-					rc = cil_fill_levelrange(pc->cl_head, range);
-					if (rc != SEPOL_OK) {
-						cil_log(CIL_ERR, "Failed to create anonymous levelrange, rc: %d\n", rc);
-						cil_destroy_levelrange(range);
-						cil_destroy_args(new_arg);
-						goto exit;
-					}
-					cil_tree_node_init(&range_node);
-					range_node->flavor = CIL_LEVELRANGE;
-					range_node->data = range;
-					cil_list_append(((struct cil_symtab_datum*)range)->nodes, 
-									CIL_LIST_ITEM, range_node);
-					new_arg->arg = (struct cil_symtab_datum*)range;
-				} else if (pc->data == NULL) {
-					cil_tree_log(current, CIL_ERR, "Invalid macro parameter");
-					cil_destroy_args(new_arg);
-					rc = SEPOL_ERR;
+
+			break;
+		}
+		case CIL_LEVELRANGE: {
+			if (arg_node->cl_head != NULL) {
+				struct cil_levelrange *range = NULL;
+				struct cil_tree_node *range_node = NULL;
+				cil_levelrange_init(&range);
+
+				rc = cil_fill_levelrange(arg_node->cl_head, range);
+				if (rc != SEPOL_OK) {
+					cil_log(CIL_ERR, "Failed to create anonymous levelrange, rc: %d\n", rc);
+					cil_destroy_levelrange(range);
+					cil_destroy_args(arg);
 					goto exit;
-				} else {
-					new_arg->arg_str = pc->data;
 				}
-
-				break;
+				cil_tree_node_init(&range_node);
+				range_node->flavor = CIL_LEVELRANGE;
+				range_node->data = range;
+				cil_list_append(((struct cil_symtab_datum*)range)->nodes,
+								CIL_LIST_ITEM, range_node);
+				arg->arg = (struct cil_symtab_datum*)range;
+			} else if (arg_node->data == NULL) {
+				cil_tree_log(call_node, CIL_ERR, "Invalid macro parameter");
+				cil_destroy_args(arg);
+				rc = SEPOL_ERR;
+				goto exit;
+			} else {
+				arg->arg_str = arg_node->data;
 			}
-			case CIL_IPADDR: {
-				if (pc->cl_head != NULL) {
-					struct cil_ipaddr *ipaddr = NULL;
-					struct cil_tree_node *addr_node = NULL;
-					cil_ipaddr_init(&ipaddr);
-
-					rc = cil_fill_ipaddr(pc->cl_head, ipaddr);
-					if (rc != SEPOL_OK) {
-						cil_log(CIL_ERR, "Failed to create anonymous ip address, rc: %d\n", rc);
-						cil_destroy_ipaddr(ipaddr);
-						cil_destroy_args(new_arg);
-						goto exit;
-					}
-					cil_tree_node_init(&addr_node);
-					addr_node->flavor = CIL_IPADDR;
-					addr_node->data = ipaddr;
-					cil_list_append(((struct cil_symtab_datum*)ipaddr)->nodes,
-									CIL_LIST_ITEM, addr_node);
-					new_arg->arg = (struct cil_symtab_datum*)ipaddr;
-				} else if (pc->data == NULL) {
-					cil_tree_log(current, CIL_ERR, "Invalid macro parameter");
-					cil_destroy_args(new_arg);
-					rc = SEPOL_ERR;
+
+			break;
+		}
+		case CIL_IPADDR: {
+			if (arg_node->cl_head != NULL) {
+				struct cil_ipaddr *ipaddr = NULL;
+				struct cil_tree_node *addr_node = NULL;
+				cil_ipaddr_init(&ipaddr);
+
+				rc = cil_fill_ipaddr(arg_node->cl_head, ipaddr);
+				if (rc != SEPOL_OK) {
+					cil_log(CIL_ERR, "Failed to create anonymous ip address, rc: %d\n", rc);
+					cil_destroy_ipaddr(ipaddr);
+					cil_destroy_args(arg);
 					goto exit;
-				} else {
-					new_arg->arg_str = pc->data;
 				}
+				cil_tree_node_init(&addr_node);
+				addr_node->flavor = CIL_IPADDR;
+				addr_node->data = ipaddr;
+				cil_list_append(((struct cil_symtab_datum*)ipaddr)->nodes,
+								CIL_LIST_ITEM, addr_node);
+				arg->arg = (struct cil_symtab_datum*)ipaddr;
+			} else if (arg_node->data == NULL) {
+				cil_tree_log(call_node, CIL_ERR, "Invalid macro parameter");
+				cil_destroy_args(arg);
+				rc = SEPOL_ERR;
+				goto exit;
+			} else {
+				arg->arg_str = arg_node->data;
+			}
 
-				break;
+			break;
+		}
+		case CIL_CLASS:
+			if (arg_node->data == NULL) {
+				cil_tree_log(call_node, CIL_ERR, "Invalid macro parameter");
+				cil_destroy_args(arg);
+				rc = SEPOL_ERR;
+				goto exit;
 			}
-			case CIL_CLASS:
-				if (pc->data == NULL) {
-					cil_tree_log(current, CIL_ERR, "Invalid macro parameter");
-					cil_destroy_args(new_arg);
-					rc = SEPOL_ERR;
-					goto exit;
-				}
-				new_arg->arg_str = pc->data;
-				break;
-			case CIL_MAP_CLASS:
-				if (pc->data == NULL) {
-					cil_tree_log(current, CIL_ERR, "Invalid macro parameter");
-					cil_destroy_args(new_arg);
-					rc = SEPOL_ERR;
-					goto exit;
-				}
-				new_arg->arg_str = pc->data;
-				break;
-			case CIL_CLASSPERMISSION: {
-				if (pc->cl_head != NULL) {
-					struct cil_classpermission *cp = NULL;
-					struct cil_tree_node *cp_node = NULL;
-
-					cil_classpermission_init(&cp);
-					rc = cil_fill_classperms_list(pc, &cp->classperms);
-					if (rc != SEPOL_OK) {
-						cil_log(CIL_ERR, "Failed to create anonymous classpermission\n");
-						cil_destroy_classpermission(cp);
-						cil_destroy_args(new_arg);
-						goto exit;
-					}
-					cil_tree_node_init(&cp_node);
-					cp_node->flavor = CIL_CLASSPERMISSION;
-					cp_node->data = cp;
-					cil_list_append(cp->datum.nodes, CIL_LIST_ITEM, cp_node);
-					new_arg->arg = (struct cil_symtab_datum*)cp;
-				} else if (pc->data == NULL) {
-					cil_tree_log(current, CIL_ERR, "Invalid macro parameter");
-					cil_destroy_args(new_arg);
-					rc = SEPOL_ERR;
+			arg->arg_str = arg_node->data;
+			break;
+		case CIL_MAP_CLASS:
+			if (arg_node->data == NULL) {
+				cil_tree_log(call_node, CIL_ERR, "Invalid macro parameter");
+				cil_destroy_args(arg);
+				rc = SEPOL_ERR;
+				goto exit;
+			}
+			arg->arg_str = arg_node->data;
+			break;
+		case CIL_CLASSPERMISSION: {
+			if (arg_node->cl_head != NULL) {
+				struct cil_classpermission *cp = NULL;
+				struct cil_tree_node *cp_node = NULL;
+
+				cil_classpermission_init(&cp);
+				rc = cil_fill_classperms_list(arg_node, &cp->classperms);
+				if (rc != SEPOL_OK) {
+					cil_log(CIL_ERR, "Failed to create anonymous classpermission\n");
+					cil_destroy_classpermission(cp);
+					cil_destroy_args(arg);
 					goto exit;
-				} else {
-					new_arg->arg_str = pc->data;
 				}
-				break;
-			}
-			default:
-				cil_log(CIL_ERR, "Unexpected flavor: %d\n", 
-						(((struct cil_param*)item->data)->flavor));
-				cil_destroy_args(new_arg);
+				cil_tree_node_init(&cp_node);
+				cp_node->flavor = CIL_CLASSPERMISSION;
+				cp_node->data = cp;
+				cil_list_append(cp->datum.nodes, CIL_LIST_ITEM, cp_node);
+				arg->arg = (struct cil_symtab_datum*)cp;
+			} else if (arg_node->data == NULL) {
+				cil_tree_log(call_node, CIL_ERR, "Invalid macro parameter");
+				cil_destroy_args(arg);
 				rc = SEPOL_ERR;
 				goto exit;
+			} else {
+				arg->arg_str = arg_node->data;
 			}
-			new_arg->param_str = ((struct cil_param*)item->data)->str;
-			new_arg->flavor = flavor;
-
-			cil_list_append(new_call->args, CIL_ARGS, new_arg);
-
-			pc = pc->next;
+			break;
 		}
-
-		if (pc != NULL) {
-			cil_tree_log(current, CIL_ERR, "Unexpected arguments");
+		default:
+			cil_log(CIL_ERR, "Unexpected flavor: %d\n",
+					(((struct cil_param*)item->data)->flavor));
+			cil_destroy_args(arg);
 			rc = SEPOL_ERR;
 			goto exit;
 		}
-	} else if (new_call->args_tree != NULL) {
-		cil_tree_log(current, CIL_ERR, "Unexpected arguments");
-		rc = SEPOL_ERR;
-		goto exit;
-	}
+		arg->param_str = ((struct cil_param*)item->data)->str;
+		arg->flavor = flavor;
 
-	if (new_call->copied == 0) {
-		new_call->copied = 1;
+		cil_list_append(call->args, CIL_ARGS, arg);
 
-		rc = cil_check_recursive_call(current, macro_node);
-		if (rc != SEPOL_OK) {
-			goto exit;
-		}
+		arg_node = arg_node->next;
+	}
 
-		rc = cil_copy_ast(db, macro_node, current);
-		if (rc != SEPOL_OK) {
-			cil_log(CIL_ERR, "Failed to copy macro, rc: %d\n", rc);
-			goto exit;
-		}
+	if (arg_node != NULL) {
+		cil_tree_log(call_node, CIL_ERR, "Unexpected arguments");
+		rc = SEPOL_ERR;
+		goto exit;
 	}
 
 	return SEPOL_OK;
@@ -3180,19 +3142,17 @@ exit:
 	return rc;
 }
 
-int cil_resolve_call2(struct cil_tree_node *current, void *extra_args)
+static int cil_resolve_call_args(struct cil_tree_node *call_node, struct cil_call *call, void *extra_args)
 {
-	struct cil_call *new_call = current->data;
-	int rc = SEPOL_ERR;
-	enum cil_sym_index sym_index = CIL_SYM_UNKNOWN;
 	struct cil_list_item *item;
+	enum cil_sym_index sym_index = CIL_SYM_UNKNOWN;
+	int rc = SEPOL_ERR;
 
-	if (new_call->args == NULL) {
-		rc = SEPOL_OK;
-		goto exit;
+	if (call->args == NULL) {
+		return SEPOL_OK;
 	}
 
-	cil_list_for_each(item, new_call->args) {
+	cil_list_for_each(item, call->args) {
 		struct cil_args *arg = item->data;
 		if (arg->arg == NULL && arg->arg_str == NULL) {
 			cil_log(CIL_ERR, "Arguments not created correctly\n");
@@ -3275,9 +3235,9 @@ int cil_resolve_call2(struct cil_tree_node *current, void *extra_args)
 		}
 
 		if (sym_index != CIL_SYM_UNKNOWN) {
-			rc = cil_resolve_name(current, arg->arg_str, sym_index, extra_args, &(arg->arg));
+			rc = cil_resolve_name(call_node, arg->arg_str, sym_index, extra_args, &(arg->arg));
 			if (rc != SEPOL_OK) {
-				cil_tree_log(current, CIL_ERR, "Failed to resolve %s in call argument list", arg->arg_str);
+				cil_tree_log(call_node, CIL_ERR, "Failed to resolve %s in call argument list", arg->arg_str);
 				goto exit;
 			}
 		}
@@ -3289,6 +3249,61 @@ exit:
 	return rc;
 }
 
+int cil_resolve_call(struct cil_tree_node *current, void *extra_args)
+{
+	struct cil_call *call = current->data;
+	struct cil_args_resolve *args = extra_args;
+	struct cil_tree_node *macro_node = NULL;
+	struct cil_symtab_datum *macro_datum = NULL;
+	int rc = SEPOL_ERR;
+
+	if (call->copied) {
+		return SEPOL_OK;
+	}
+
+	rc = cil_resolve_name(current, call->macro_str, CIL_SYM_BLOCKS, extra_args, &macro_datum);
+	if (rc != SEPOL_OK) {
+		goto exit;
+	}
+
+	macro_node = NODE(macro_datum);
+
+	if (macro_node->flavor != CIL_MACRO) {
+		cil_tree_log(current, CIL_ERR, "Failed to resolve %s to a macro", call->macro_str);
+		rc = SEPOL_ERR;
+		goto exit;
+	}
+	call->macro = (struct cil_macro*)macro_datum;
+
+	rc = cil_build_call_args(current, call, call->macro, extra_args);
+	if (rc != SEPOL_OK) {
+		goto exit;
+	}
+
+	rc = cil_resolve_call_args(current, call, extra_args);
+	if (rc != SEPOL_OK) {
+		goto exit;
+	}
+
+	call->copied = 1;
+
+	rc = cil_check_recursive_call(current, macro_node);
+	if (rc != SEPOL_OK) {
+		goto exit;
+	}
+
+	rc = cil_copy_ast(args->db, macro_node, current);
+	if (rc != SEPOL_OK) {
+		cil_log(CIL_ERR, "Failed to copy macro, rc: %d\n", rc);
+		goto exit;
+	}
+
+	return SEPOL_OK;
+
+exit:
+	return rc;
+}
+
 int cil_resolve_name_call_args(struct cil_call *call, char *name, enum cil_sym_index sym_index, struct cil_symtab_datum **datum)
 {
 	struct cil_list_item *item;
@@ -3604,18 +3619,8 @@ int __cil_resolve_ast_node(struct cil_tree_node *node, void *extra_args)
 		}
 		break;
 	case CIL_PASS_MACRO:
-		if (node->flavor == CIL_CALL && args->macro != NULL) {
-			rc = cil_resolve_call1(node, args);
-		}
-		break;
-	case CIL_PASS_CALL1:
-		if (node->flavor == CIL_CALL) {
-			rc = cil_resolve_call1(node, args);
-		}
-		break;
-	case CIL_PASS_CALL2:
-		if (node->flavor == CIL_CALL) {
-			rc = cil_resolve_call2(node, args);
+		if (node->flavor == CIL_CALL && args->macro == NULL) {
+			rc = cil_resolve_call(node, args);
 		}
 		break;
 	case CIL_PASS_ALIAS1:
@@ -4188,7 +4193,6 @@ exit:
 static int __cil_resolve_name_with_root(struct cil_db *db, char *name, enum cil_sym_index sym_index, struct cil_symtab_datum **datum)
 {
 	symtab_t *symtab = &((struct cil_root *)db->ast->root->data)->symtab[sym_index];
-
 	return cil_symtab_get_datum(symtab, name, datum);
 }
 
-- 
2.26.3

