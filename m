Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD4068A65A
	for <lists+selinux@lfdr.de>; Fri,  3 Feb 2023 23:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbjBCWyg (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 3 Feb 2023 17:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbjBCWyg (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 3 Feb 2023 17:54:36 -0500
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BA3BB1EBCC
        for <selinux@vger.kernel.org>; Fri,  3 Feb 2023 14:54:32 -0800 (PST)
Received: from [192.168.1.10] (pool-96-241-71-43.washdc.fios.verizon.net [96.241.71.43])
        by linux.microsoft.com (Postfix) with ESMTPSA id 1743E20C7DCC;
        Fri,  3 Feb 2023 14:54:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1743E20C7DCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1675464872;
        bh=1c1XV9IKrYYqE4cIwhPQ1kcSotgaQ59/XRgaL0DXVd0=;
        h=Date:From:Subject:To:References:In-Reply-To:From;
        b=QUNAo/CV3y9fCUUXzW803WDQDOs8P69BluJRKU8nopCfI3FGtX5UqE1Qoly79wdMN
         zy/pNZhgdF4ZKiuc05XeZMyrRkVgV8yDU2Ve1PM08QWmeb3lsHhqB36zWv/8ESDo2X
         R/mPx1JdxLuWVE4L/arU13YvTgG9yjAtDyRnBQ4U=
Message-ID: <f701506d-4158-ed6d-8ed3-76b1ab1d3878@linux.microsoft.com>
Date:   Fri, 3 Feb 2023 17:54:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From:   Daniel Burgener <dburgener@linux.microsoft.com>
Subject: Re: [RFC PATCH 4/9] libsepol/cil: Process deny rules
To:     James Carter <jwcart2@gmail.com>, selinux@vger.kernel.org
References: <20221215213429.998948-1-jwcart2@gmail.com>
 <20221215213429.998948-5-jwcart2@gmail.com>
Content-Language: en-US
In-Reply-To: <20221215213429.998948-5-jwcart2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-19.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 12/15/2022 4:34 PM, James Carter wrote:
> A deny rule is like a neverallow rule, except that permissions are
> removed rather than an error reported.
> 
> (allow S1 T1 P1)
> (deny  S2 T2 P2)
> 
> In general what is needed is:
> 1) Allow permissions that do not match the deny rule
>    P3 = P1 and not P2
>    (allow S1 T1 P3)
> 2) Allow source types that do not match the deny rule
>    S3 = S1 and not S2
>    (allow S3 T1 P1)
> 3) Allow target types that do not match the deny rule
>    T3 = T1 and not T2
>    (allow S1 T3 P1)
> 
> If a self rule is involved then
>    If S1 is an attribute then
>      If T1 is self and T2 is not self then
>        S3 = S1 and not (S2 and T2)
>      else if T1 is not self and T2 is self then
>        S3 = S1 and not (T1 and S2)
>      else if T1 is self and T2 is self then
>        S3 = S1 and not S2
>      (allow S3 T1 P1)
>    If T1 is an attribute then
>      If T2 is self then
>        T3 = T1 and not (S1 and S2)
>      (allow S1 T3 P1)
>      If S1 is attribute and S2 is attribute and T2 is self then
>        # In addition to any rules involving S3 and T3 above
>        SX = S1 and S2 and T1
>        For S in SX do
>          T = SX and not S
>          (allow S T P1)
> 
> In all cases, do not create a rule that has an empty set
> 
> Signed-off-by: James Carter <jwcart2@gmail.com>
> ---
>   libsepol/cil/src/cil_deny.c | 957 ++++++++++++++++++++++++++++++++++++
>   libsepol/cil/src/cil_deny.h |  34 ++
>   libsepol/cil/src/cil_post.c |   7 +
>   3 files changed, 998 insertions(+)
>   create mode 100644 libsepol/cil/src/cil_deny.c
>   create mode 100644 libsepol/cil/src/cil_deny.h
> 
> diff --git a/libsepol/cil/src/cil_deny.c b/libsepol/cil/src/cil_deny.c
> new file mode 100644
> index 00000000..43043c37
> --- /dev/null
> +++ b/libsepol/cil/src/cil_deny.c
> @@ -0,0 +1,957 @@
> +/*
> + * This file is public domain software, i.e. not copyrighted.
> + *
> + * Warranty Exclusion
> + * ------------------
> + * You agree that this software is a non-commercially developed program
> + * that may contain "bugs" (as that term is used in the industry) and
> + * that it may not function as intended. The software is licensed
> + * "as is". NSA makes no, and hereby expressly disclaims all, warranties,
> + * express, implied, statutory, or otherwise with respect to the software,
> + * including noninfringement and the implied warranties of merchantability
> + * and fitness for a particular purpose.
> + *
> + * Limitation of Liability
> + *-----------------------
> + * In no event will NSA be liable for any damages, including loss of data,
> + * lost profits, cost of cover, or other special, incidental, consequential,
> + * direct or indirect damages arising from the software or the use thereof,
> + * however caused and on any theory of liability. This limitation will apply
> + * even if NSA has been advised of the possibility of such damage. You
> + * acknowledge that this is a reasonable allocation of risk.
> + *
> + * Original author: James Carter
> + */
> +
> +#include <sepol/policydb/ebitmap.h>
> +
> +#include "cil_internal.h"
> +#include "cil_find.h"
> +#include "cil_flavor.h"
> +#include "cil_list.h"
> +#include "cil_strpool.h"
> +#include "cil_log.h"
> +#include "cil_symtab.h"
> +#include "cil_build_ast.h"
> +#include "cil_copy_ast.h"
> +#include "cil_deny.h"
> +
> +#define CIL_DENY_ATTR_PREFIX "deny_rule_attr"
> +
> +/*
> + * A deny rule will remove the specified permissions from the CIL AST.
> + *
> + * (allow S1 T1 P1)
> + * (deny  S2 T2 P2)
> + *
> + * In general what is needed is:
> + * 1) Allow permissions that do not match the deny rule
> + *   P3 = P1 and not P2
> + *   (allow S1 T1 P3)
> + * 2) Allow source types that do not match the deny rule
> + *   S3 = S1 and not S2
> + *   (allow S3 T1 P1)
> + * 3) Allow target types that do not match the deny rule
> + *   T3 = T1 and not T2
> + *   (allow S1 T3 P1)
> + *
> + * If a self rule is involved then
> + *   If S1 is an attribute then
> + *     If T1 is self and T2 is not self then
> + *       S3 = S1 and not (S2 and T2)
> + *     else if T1 is not self and T2 is self then
> + *       S3 = S1 and not (T1 and S2)
> + *     else if T1 is self and T2 is self then
> + *       S3 = S1 and not S2
> + *     (allow S3 T1 P1)
> + *   If T1 is an attribute then
> + *     If T2 is self then
> + *       T3 = T1 and not (S1 and S2)
> + *     (allow S1 T3 P1)
> + *     If S1 is attribute and S2 is attribute and T2 is self then

nit: The rest of the lines refer to "an" attribute, and this one drops 
the article.

BTW, thanks for this description of the cases.  It's very helpful 
working through the logic.

> + *       # In addition to any rules involving S3 and T3 above
> + *       SX = S1 and S2 and T1
> + *       For S in SX do
> + *         T = SX and not S
> + *         (allow S T P1)
> + *
> + * Do not create a rule that has an empty set
> + */
> +
> +static int cil_perm_match(const struct cil_perm *p1, const struct cil_list *pl2)
> +{
> +	struct cil_list_item *curr;
> +
> +	cil_list_for_each(curr, pl2) {
> +		struct cil_perm *p = curr->data;
> +		if (p == p1) {
> +			return CIL_TRUE;
> +		}

Why are we comparing the pointers rather than the value fields?

> +	}
> +	return CIL_FALSE;
> +}
> +
> +static int cil_class_perm_match(const struct cil_class *c1, const struct cil_perm *p1, const struct cil_list *cpl2)
> +{
> +	struct cil_list_item *curr;
> +
> +	cil_list_for_each(curr, cpl2) {
> +		if (curr->flavor == CIL_CLASSPERMS) {
> +			struct cil_classperms *cp = curr->data;
> +			if (FLAVOR(cp->class) == CIL_CLASS) {
> +				if (cp->class == c1) {
> +					if (cil_perm_match(p1, cp->perms)) {
> +						return CIL_TRUE;
> +					}
> +				}
> +			} else { /* MAP */
> +				struct cil_list_item *p;
> +				cil_list_for_each(p, cp->perms) {
> +					struct cil_perm *cmp = p->data;
> +					if (cil_class_perm_match(c1, p1, cmp->classperms)) {
> +						return CIL_TRUE;
> +					}
> +				}
> +			}
> +		} else { /* SET */
> +			struct cil_classperms_set *cp_set = curr->data;
> +			struct cil_classpermission *cp = cp_set->set;
> +			if (cil_class_perm_match(c1, p1, cp->classperms)) {
> +				return CIL_TRUE;
> +			}
> +		}
> +	}
> +	return CIL_FALSE;
> +}
> +
> +static int cil_classperms_match(const struct cil_classperms *cp1, const struct cil_list *cpl2)
> +{
> +	struct cil_list_item *curr;
> +
> +	cil_list_for_each(curr, cp1->perms) {
> +		struct cil_perm *perm = curr->data;
> +		if (cil_class_perm_match(cp1->class, perm, cpl2)) {
> +			return CIL_TRUE;
> +		}
> +	}
> +	return CIL_FALSE;
> +}
> +
> +int cil_classperms_list_match(const struct cil_list *cpl1, const struct cil_list *cpl2)
> +{
> +	struct cil_list_item *curr;
> +
> +	if (!cpl1 || !cpl2) {
> +		return (!cpl1 && !cpl2) ? CIL_TRUE : CIL_FALSE;
> +	}
> +
> +	cil_list_for_each(curr, cpl1) {
> +		if (curr->flavor == CIL_CLASSPERMS) {
> +			struct cil_classperms *cp = curr->data;
> +			if (FLAVOR(cp->class) == CIL_CLASS) {
> +				if (cil_classperms_match(cp, cpl2)) {
> +					return CIL_TRUE;
> +				}
> +			} else { /* MAP */
> +				struct cil_list_item *p;
> +				cil_list_for_each(p, cp->perms) {
> +					struct cil_perm *cmp = p->data;
> +					if (cil_classperms_list_match(cmp->classperms, cpl2)) {
> +						return CIL_TRUE;
> +					}
> +				}
> +			}
> +		} else { /* SET */
> +			struct cil_classperms_set *cp_set = curr->data;
> +			struct cil_classpermission *cp = cp_set->set;
> +			if (cil_classperms_list_match(cp->classperms, cpl2)) {
> +				return CIL_TRUE;
> +			}
> +		}
> +	}
> +	return CIL_FALSE;
> +}
> +
> +static void cil_classperms_copy(struct cil_classperms **new, const struct cil_classperms *old)
> +{
> +	cil_classperms_init(new);
> +	(*new)->class_str = old->class_str;
> +	(*new)->class = old->class;
> +	cil_copy_list(old->perm_strs, &(*new)->perm_strs);
> +	cil_copy_list(old->perms, &(*new)->perms);
> +}
> +
> +static void cil_classperms_set_copy(struct cil_classperms_set **new, const struct cil_classperms_set *old)
> +{
> +	cil_classperms_set_init(new);
> +	(*new)->set_str = old->set_str;
> +	(*new)->set = old->set;
> +}
> +
> +void cil_classperms_list_copy(struct cil_list **new, const struct cil_list *old)
> +{
> +	struct cil_list_item *curr;
> +
> +	if (!new) {
> +		return;
> +	}
> +
> +	if (!old) {
> +		*new = NULL;
> +		return;
> +	}
> +
> +	cil_list_init(new, CIL_LIST);
> +
> +	cil_list_for_each(curr, old) {
> +		if (curr->flavor == CIL_CLASSPERMS) {
> +			struct cil_classperms *new_cp;
> +			cil_classperms_copy(&new_cp, curr->data);
> +			cil_list_append(*new, CIL_CLASSPERMS, new_cp);
> +		} else { /* SET */
> +			struct cil_classperms_set *new_cps;
> +			cil_classperms_set_copy(&new_cps, curr->data);
> +			cil_list_append(*new, CIL_CLASSPERMS_SET, new_cps);
> +		}
> +	}
> +
> +	if (cil_list_is_empty(*new)) {
> +		cil_list_destroy(new, CIL_FALSE);
> +	}
> +}
> +
> +/* Append cp1 and not cpl2 to result */
> +static void cil_classperms_andnot(struct cil_list **result, const struct cil_classperms *cp1, const struct cil_list *cpl2)
> +{
> +	struct cil_classperms *new_cp = NULL;
> +	struct cil_list_item *curr;
> +
> +	if (!cil_classperms_match(cp1, cpl2)) {
> +		cil_classperms_copy(&new_cp, cp1);
> +		cil_list_append(*result, CIL_CLASSPERMS, new_cp);
> +		return;
> +	}
> +
> +	cil_list_for_each(curr, cp1->perms) {
> +		struct cil_perm *perm = curr->data;
> +		if (!cil_class_perm_match(cp1->class, perm, cpl2)) {
> +			if (new_cp == NULL) {
> +				cil_classperms_init(&new_cp);
> +				new_cp->class_str = cp1->class_str;
> +				new_cp->class = cp1->class;
> +				cil_list_init(&new_cp->perm_strs, CIL_PERM);
> +				cil_list_init(&new_cp->perms, CIL_PERM);
> +				cil_list_append(*result, CIL_CLASSPERMS, new_cp) > +			}
> +			cil_list_append(new_cp->perm_strs, CIL_STRING, perm->datum.fqn);
> +			cil_list_append(new_cp->perms, CIL_DATUM, perm);

Why can't you just use cil_classperms_copy() here?

> +		}
> +	}
> +}
> +
> +/* Append cp1 and not cpl2 to result */
> +static void cil_classperms_map_andnot(struct cil_list **result, const struct cil_classperms *cp1, const struct cil_list *cpl2)
> +{
> +	struct cil_classperms *new_cp = NULL;
> +	struct cil_list_item *p;
> +
> +	cil_list_for_each(p, cp1->perms) {
> +		struct cil_perm *map_perm = p->data;
> +		if (!cil_classperms_list_match(map_perm->classperms, cpl2)) {
> +			if (new_cp == NULL) {
> +				cil_classperms_init(&new_cp);
> +				new_cp->class_str = cp1->class_str;
> +				new_cp->class = cp1->class;
> +				cil_list_init(&new_cp->perm_strs, CIL_PERM);
> +				cil_list_init(&new_cp->perms, CIL_PERM);
> +				cil_list_append(*result, CIL_CLASSPERMS, new_cp);
> +			}
> +			cil_list_append(new_cp->perm_strs, CIL_STRING, map_perm->datum.fqn);
> +			cil_list_append(new_cp->perms, CIL_DATUM, map_perm);

Same question about cil_classperms_copy().

> +		} else {
> +			struct cil_list *new_cpl = NULL;
> +			cil_classperms_list_andnot(&new_cpl, map_perm->classperms, cpl2);
> +			if (new_cpl) {
> +				struct cil_list_item *i;
> +				cil_list_for_each(i, new_cpl) {
> +					cil_list_append(*result, i->flavor, i->data);
> +				}
> +				cil_list_destroy(&new_cpl, CIL_FALSE);
> +			}
> +		}
> +	}
> +}
> +
> +/* Append cps1 and not cpl2 to result */
> +static void cil_classperms_set_andnot(struct cil_list **result, const struct cil_classperms_set *cps1, const struct cil_list *cpl2)
> +{
> +	struct cil_classpermission *cp = cps1->set;
> +
> +	if (!cil_classperms_list_match(cp->classperms, cpl2)) {
> +		struct cil_classperms_set *new_cps;
> +		cil_classperms_set_copy(&new_cps, cps1);
> +		cil_list_append(*result, CIL_CLASSPERMS_SET, new_cps);
> +	} else {
> +		struct cil_list *new_cpl;
> +		cil_classperms_list_andnot(&new_cpl, cp->classperms, cpl2);
> +		if (new_cpl) {
> +			struct cil_list_item *i;
> +			cil_list_for_each(i, new_cpl) {
> +				cil_list_append(*result, i->flavor, i->data);
> +			}
> +			cil_list_destroy(&new_cpl, CIL_FALSE);
> +		}
> +	}
> +}
> +
> +/* result = cpl1 and not cpl2 */
> +void cil_classperms_list_andnot(struct cil_list **result, const struct cil_list *cpl1, const struct cil_list *cpl2)
> +{
> +	struct cil_list_item *curr;
> +
> +	if (!result) {
> +		return;
> +	}
> +
> +	if (!cpl1) {
> +		*result = NULL;
> +		return;
> +	}
> +
> +	cil_list_init(result, CIL_LIST);
> +
> +	if (!cpl2 || !cil_classperms_list_match(cpl1, cpl2)) {
> +		cil_classperms_list_copy(result, cpl1);
> +		return;
> +	}
> +
> +	cil_list_for_each(curr, cpl1) {
> +		if (curr->flavor == CIL_CLASSPERMS) {
> +			struct cil_classperms *cp = curr->data;
> +			if (FLAVOR(cp->class) == CIL_CLASS) {
> +				cil_classperms_andnot(result, cp, cpl2);
> +			} else { /* MAP */
> +				cil_classperms_map_andnot(result, cp, cpl2);
> +			}
> +		} else { /* SET */
> +			struct cil_classperms_set *cps = curr->data;
> +			cil_classperms_set_andnot(result, cps, cpl2);
> +		}
> +	}
> +
> +	if (cil_list_is_empty(*result)) {
> +		cil_list_destroy(result, CIL_FALSE);
> +	}
> +}
> +
> +/* result = d1 and d2 */
> +static int cil_datums_and(ebitmap_t *result, const struct cil_symtab_datum *d1, const struct cil_symtab_datum *d2)
> +{
> +	int rc = SEPOL_OK;
> +	enum cil_flavor f1 = FLAVOR(d1);
> +	enum cil_flavor f2 = FLAVOR(d2);
> +
> +	if (f1 != CIL_TYPEATTRIBUTE && f2 != CIL_TYPEATTRIBUTE) {
> +		struct cil_type *t1 = (struct cil_type *)d1;
> +		struct cil_type *t2 = (struct cil_type *)d2;
> +		ebitmap_init(result);
> +		if (t1->value == t2->value) {
> +			rc = ebitmap_set_bit(result, t1->value, 1);
> +			if (rc != SEPOL_OK) {
> +				ebitmap_destroy(result);
> +				goto exit;
> +			}
> +		}
> +	} else if (f1 == CIL_TYPEATTRIBUTE && f2 != CIL_TYPEATTRIBUTE) {
> +		struct cil_typeattribute *a1 = (struct cil_typeattribute *)d1;
> +		struct cil_type *t2 = (struct cil_type *)d2;
> +		ebitmap_init(result);
> +		if (ebitmap_get_bit(a1->types, t2->value)) {
> +			rc = ebitmap_set_bit(result, t2->value, 1);
> +			if (rc != SEPOL_OK) {
> +				ebitmap_destroy(result);
> +				goto exit;
> +			}
> +		}
> +	} else if (f1 != CIL_TYPEATTRIBUTE && f2 == CIL_TYPEATTRIBUTE) {
> +		struct cil_type *t1 = (struct cil_type *)d1;
> +		struct cil_typeattribute *a2 = (struct cil_typeattribute *)d2;
> +		ebitmap_init(result);
> +		if (ebitmap_get_bit(a2->types, t1->value)) {
> +			rc = ebitmap_set_bit(result, t1->value, 1);
> +			if (rc != SEPOL_OK) {
> +				ebitmap_destroy(result);
> +				goto exit;
> +			}
> +		}
> +	} else {
> +		/* Both are attributes */
> +		struct cil_typeattribute *a1 = (struct cil_typeattribute *)d1;
> +		struct cil_typeattribute *a2 = (struct cil_typeattribute *)d2;
> +		rc = ebitmap_and(result, a1->types, a2->types);
> +		if (rc != SEPOL_OK) {
> +			ebitmap_destroy(result);
> +			goto exit;
> +		}
> +	}
> +exit:
> +	return rc;
> +}
> +
> +/* result = d1 and not d2 */
> +static int cil_datums_andnot(ebitmap_t *result, const struct cil_symtab_datum *d1, const struct cil_symtab_datum *d2)
> +{
> +	int rc = SEPOL_OK;
> +	enum cil_flavor f1 = FLAVOR(d1);
> +	enum cil_flavor f2 = FLAVOR(d2);
> +
> +	if (f1 != CIL_TYPEATTRIBUTE && f2 != CIL_TYPEATTRIBUTE) {
> +		struct cil_type *t1 = (struct cil_type *)d1;
> +		struct cil_type *t2 = (struct cil_type *)d2;
> +		ebitmap_init(result);
> +		if (t1->value != t2->value) {
> +			rc = ebitmap_set_bit(result, t1->value, 1);
> +			if (rc != SEPOL_OK) {
> +				ebitmap_destroy(result);
> +				goto exit;
> +			}
> +		}
> +	} else if (f1 == CIL_TYPEATTRIBUTE && f2 != CIL_TYPEATTRIBUTE) {
> +		struct cil_typeattribute *a1 = (struct cil_typeattribute *)d1;
> +		struct cil_type *t2 = (struct cil_type *)d2;
> +		rc = ebitmap_cpy(result, a1->types);
> +		if (rc != SEPOL_OK) {
> +			goto exit;
> +		}
> +		rc = ebitmap_set_bit(result, t2->value, 0);
> +		if (rc != SEPOL_OK) {
> +			ebitmap_destroy(result);
> +			goto exit;
> +		}
> +	} else if (f1 != CIL_TYPEATTRIBUTE && f2 == CIL_TYPEATTRIBUTE) {
> +		struct cil_type *t1 = (struct cil_type *)d1;
> +		struct cil_typeattribute *a2 = (struct cil_typeattribute *)d2;
> +		ebitmap_init(result);
> +		if (!ebitmap_get_bit(a2->types, t1->value)) {
> +			rc = ebitmap_set_bit(result, t1->value, 1);
> +			if (rc != SEPOL_OK) {
> +				ebitmap_destroy(result);
> +				goto exit;
> +			}
> +		}
> +	} else {
> +		/* Both are attributes */
> +		struct cil_typeattribute *a1 = (struct cil_typeattribute *)d1;
> +		struct cil_typeattribute *a2 = (struct cil_typeattribute *)d2;
> +		rc = ebitmap_andnot(result, a1->types, a2->types, a1->types->highbit);
> +		if (rc != SEPOL_OK) {
> +			ebitmap_destroy(result);
> +			goto exit;
> +		}
> +	}
> +exit:
> +	return rc;
> +}
> +
> +static size_t num_digits(unsigned n)
> +{
> +	size_t num = 1;
> +	while (n >= 10) {
> +		n /= 10;
> +		num++;
> +	}
> +	return num;
> +}
> +
> +static char *cil_create_new_attribute_name(unsigned num)
> +{
> +	char *s1 = NULL;
> +	char *s2 = NULL;
> +	size_t len_num = num_digits(num);
> +	size_t len = strlen(CIL_DENY_ATTR_PREFIX) + 1 + len_num + 1;
> +	int rc;
> +
> +	if (len >= CIL_MAX_NAME_LENGTH) {
> +		cil_log(CIL_ERR, "Name length greater than max name length of %d",
> +				CIL_MAX_NAME_LENGTH);
> +		goto exit;
> +	}
> +
> +	s1 = cil_malloc(len);
> +	rc = snprintf(s1, len, "%s_%u", CIL_DENY_ATTR_PREFIX, num);
> +	if (rc < 0 || (size_t)rc >= len) {
> +		cil_log(CIL_ERR, "Error creating new attribute name");
> +		free(s1);
> +		goto exit;
> +	}
> +
> +	s2 = cil_strpool_add(s1);
> +	free(s1);
> +
> +exit:
> +	return s2;
> +}
> +
> +static struct cil_list *cil_create_and_expr_list(enum cil_flavor flavor, void *v1, void *v2)
> +{
> +	struct cil_list *expr;
> +
> +	cil_list_init(&expr, CIL_TYPE);
> +	cil_list_append(expr, CIL_OP, (void *)CIL_AND);
> +	cil_list_append(expr, flavor, v1);
> +	cil_list_append(expr, flavor, v2);
> +
> +	return expr;
> +}
> +
> +static struct cil_list *cil_create_andnot_expr_list(enum cil_flavor flavor, void *v1, void *v2)
> +{
> +	struct cil_list *expr, *sub_expr;
> +
> +	cil_list_init(&expr, CIL_TYPE);
> +	cil_list_append(expr, CIL_OP, (void *)CIL_AND);
> +	cil_list_append(expr, flavor, v1);
> +	cil_list_init(&sub_expr, CIL_TYPE);
> +	cil_list_append(sub_expr, CIL_OP, (void *)CIL_NOT);
> +	cil_list_append(sub_expr, flavor, v2);
> +	cil_list_append(expr, CIL_LIST, sub_expr);
> +
> +	return expr;
> +}
> +
> +static struct cil_tree_node *cil_create_and_insert_node(struct cil_tree_node *prev, enum cil_flavor flavor, void *data)
> +{
> +	struct cil_tree_node *new;
> +
> +	cil_tree_node_init(&new);
> +	new->parent = prev->parent;
> +	new->line = prev->line;
> +	new->hll_offset = prev->hll_offset;
> +	new->flavor = flavor;
> +	new->data = data;
> +	new->next = prev->next;
> +	prev->next = new;
> +
> +	return new;
> +}
> +
> +static int cil_create_and_insert_attribute_and_set(struct cil_db *db, struct cil_tree_node *prev, struct cil_list *str_expr, struct cil_list *datum_expr, ebitmap_t *types, struct cil_symtab_datum **d)
> +{
> +	struct cil_tree_node *attr_node = NULL;
> +	char *name;
> +	struct cil_typeattribute *attr = NULL;
> +	struct cil_tree_node *attrset_node = NULL;
> +	struct cil_typeattributeset *attrset = NULL;
> +	symtab_t *symtab = NULL;
> +	int rc = SEPOL_ERR;
> +
> +	name = cil_create_new_attribute_name(db->num_types_and_attrs);
> +	if (!name) {
> +		goto exit;
> +	}
> +
> +	cil_typeattributeset_init(&attrset);
> +	attrset->attr_str = name;
> +	attrset->str_expr = str_expr;
> +	attrset->datum_expr = datum_expr;
> +
> +	cil_typeattribute_init(&attr);
> +	cil_list_init(&attr->expr_list, CIL_TYPE);
> +	cil_list_append(attr->expr_list, CIL_LIST, datum_expr);
> +	attr->types = types;
> +	attr->used = CIL_ATTR_AVRULE;
> +	attr->keep = (ebitmap_cardinality(types) < db->attrs_expand_size) ? CIL_FALSE : CIL_TRUE;
> +
> +	attr_node = cil_create_and_insert_node(prev, CIL_TYPEATTRIBUTE, attr);
> +	attrset_node = cil_create_and_insert_node(attr_node, CIL_TYPEATTRIBUTESET, attrset);
> +
> +	rc = cil_get_symtab(prev->parent, &symtab, CIL_SYM_TYPES);
> +	if (rc != SEPOL_OK) {
> +		goto exit;
> +	}
> +
> +	rc = cil_symtab_insert(symtab, name, &attr->datum, attr_node);
> +	if (rc != SEPOL_OK) {
> +		goto exit;
> +	}
> +
> +	db->num_types_and_attrs++;
> +
> +	*d = &attr->datum;
> +
> +	return SEPOL_OK;
> +
> +exit:
> +	if (attrset_node) {
> +		prev->next = attrset_node->next;
> +		cil_destroy_typeattribute(attr_node->data);
> +		free(attr_node);
> +		cil_destroy_typeattributeset(attrset_node->data);
> +		free(attrset_node);
> +	}
> +	return rc;
> +}
> +
> +static int cil_create_attribute_d1_and_not_d2(struct cil_db *db, struct cil_tree_node *prev, struct cil_symtab_datum *d1, struct cil_symtab_datum *d2, struct cil_symtab_datum **d3)
> +{
> +	struct cil_list *str_expr;
> +	struct cil_list *datum_expr;
> +	ebitmap_t *types;
> +	int rc;
> +
> +	*d3 = NULL;
> +
> +	if (d1 == d2) {
> +		return SEPOL_OK;
> +	}
> +
> +	str_expr = cil_create_andnot_expr_list(CIL_STRING, d1->fqn, d2->fqn);
> +	datum_expr = cil_create_andnot_expr_list(CIL_DATUM, d1, d2);
> +
> +	types = cil_malloc(sizeof(*types));
> +	rc = cil_datums_andnot(types, d1, d2);
> +	if (rc != SEPOL_OK) {
> +		goto exit;
> +	}
> +	if (ebitmap_is_empty(types)) {
> +		rc = SEPOL_OK;
> +		goto exit;
> +	}
> +
> +	if (ebitmap_cardinality(types) == 1) {
> +		unsigned i = ebitmap_highest_set_bit(types);
> +		*d3 = DATUM(db->val_to_type[i]);
> +		ebitmap_destroy(types);
> +		rc = SEPOL_OK;
> +		goto exit;
> +	}
> +
> +	return cil_create_and_insert_attribute_and_set(db, prev, str_expr, datum_expr, types, d3);
> +
> +exit:
> +	cil_list_destroy(&str_expr, CIL_FALSE);
> +	cil_list_destroy(&datum_expr, CIL_FALSE);
> +	free(types);
> +	return rc;
> +}
> +
> +static int cil_create_attribute_d1_and_d2(struct cil_db *db, struct cil_tree_node *prev, struct cil_symtab_datum *d1, struct cil_symtab_datum *d2, struct cil_symtab_datum **d3)
> +{
> +	struct cil_list *str_expr;
> +	struct cil_list *datum_expr;
> +	ebitmap_t *types;
> +	int rc;
> +
> +	if (d1 == d2) {
> +		*d3 = d1;
> +		return SEPOL_OK;
> +	}
> +
> +	*d3 = NULL;
> +
> +	str_expr = cil_create_and_expr_list(CIL_STRING, d1->fqn, d2->fqn);
> +	datum_expr = cil_create_and_expr_list(CIL_DATUM, d1, d2);
> +
> +	types = cil_malloc(sizeof(*types));
> +	rc = cil_datums_and(types, d1, d2);
> +	if (rc != SEPOL_OK) {
> +		goto exit;
> +	}
> +	if (ebitmap_is_empty(types)) {
> +		rc = SEPOL_OK;
> +		goto exit;
> +	}
> +
> +	if (ebitmap_cardinality(types) == 1) {
> +		unsigned i = ebitmap_highest_set_bit(types);
> +		*d3 = DATUM(db->val_to_type[i]);
> +		ebitmap_destroy(types);
> +		rc = SEPOL_OK;
> +		goto exit;
> +	}
> +
> +	rc = cil_create_and_insert_attribute_and_set(db, prev, str_expr, datum_expr, types, d3);
> +	if (rc != SEPOL_OK) {
> +		goto exit;
> +	}

This and the and_not variant above differ in this error handling.  The 
and_not one trusts cil_create_and_insert_attribute_and_set() to do the 
cleanup, and this one does its own cleanup.

I think they're both potentially wrong, as 
cil_create_and_insert_attribute_and_set() calls 
cil_destroy_typeattributeset() which does the same cleanup only if it 
makes it halfway through the function.  So if 
cil_create_new_attribute_name() fails, then this case works correctly 
and the and_not case doesn't free str_expr and datum_expr.  On the other 
hand, if something later in cil_create_and_insert_attribute_and_set() 
fails, then the and_not case is correct, and this one will double free 
str_expr and datum_expr.

> +
> +	return SEPOL_OK;
> +
> +exit:
> +	cil_list_destroy(&str_expr, CIL_FALSE);
> +	cil_list_destroy(&datum_expr, CIL_FALSE);
> +	free(types);
> +	return rc;
> +}
> +
> +static struct cil_avrule *cil_create_avrule(struct cil_symtab_datum *src, struct cil_symtab_datum *tgt, struct cil_list *classperms)
> +{
> +	struct cil_avrule *new;
> +
> +	cil_avrule_init(&new);
> +	new->is_extended = CIL_FALSE;
> +	new->rule_kind = CIL_AVRULE_ALLOWED;
> +	new->src_str = src->name;
> +	new->src = src;
> +	new->tgt_str = tgt->name;
> +	new->tgt = tgt;
> +	new->perms.classperms = classperms;
> +
> +	return new;
> +}
> +
> +static struct cil_tree_node *cil_create_and_add_avrule(struct cil_tree_node *curr, struct cil_symtab_datum *src, struct cil_symtab_datum *tgt, struct cil_list *classperms)
> +{
> +	struct cil_avrule *new_avrule;
> +
> +	new_avrule = cil_create_avrule(src, tgt, classperms);
> +	return cil_create_and_insert_node(curr, CIL_AVRULE, new_avrule);
> +}
> +
> +static int cil_remove_permissions_from_rule(struct cil_db *db, struct cil_tree_node *allow_node, const struct cil_tree_node *deny_node)
> +{
> +	struct cil_avrule *allow_rule = allow_node->data;
> +	struct cil_deny_rule *deny_rule = deny_node->data;
> +	struct cil_symtab_datum *s1 = allow_rule->src;
> +	struct cil_symtab_datum *t1 = allow_rule->tgt;
> +	struct cil_list *p1 = allow_rule->perms.classperms;
> +	struct cil_symtab_datum *s2 = deny_rule->src;
> +	struct cil_symtab_datum *t2 = deny_rule->tgt;
> +	struct cil_list *p2 = deny_rule->classperms;
> +	struct cil_list *p3 = NULL;
> +	struct cil_tree_node *curr = allow_node;
> +	int rc;
> +
> +	cil_classperms_list_andnot(&p3, p1, p2);
> +
> +	if (!cil_list_is_empty(p3)) {;
> +		curr = cil_create_and_add_avrule(curr, s1, t1, p3);
> +	} else {
> +		cil_destroy_classperms_list(&p3);
> +		p3 = NULL;
> +	}
> +
> +	if (FLAVOR(s1) == CIL_TYPEATTRIBUTE) {
> +		struct cil_symtab_datum *s3 = NULL;
> +		struct cil_symtab_datum *d = NULL > +		struct cil_list *cp = NULL;
> +		if (t1->fqn == CIL_KEY_SELF && t2->fqn != CIL_KEY_SELF) {
> +			/* S3 = S1 and not (S2 and T2) */
> +			rc = cil_create_attribute_d1_and_d2(db, NODE(s2), s2, t2, &d);
> +			if (rc != SEPOL_OK) {
> +				goto exit;
> +			}
> +			if (d) {
> +				rc = cil_create_attribute_d1_and_not_d2(db, NODE(s1), s1, d, &s3);
> +				if (rc != SEPOL_OK) {
> +					goto exit;
> +				}
> +			}
> +		} else if (t1->fqn != CIL_KEY_SELF && t2->fqn == CIL_KEY_SELF) {
> +			/* S3 = S1 and not (T1 and S2) */
> +			rc = cil_create_attribute_d1_and_d2(db, NODE(t1), t1, s2, &d);
> +			if (rc != SEPOL_OK) {
> +				goto exit;
> +			}
> +			if (d) {
> +				rc = cil_create_attribute_d1_and_not_d2(db, NODE(s1), s1, d, &s3);
> +				if (rc != SEPOL_OK) {
> +					goto exit;
> +				}
> +			}
> +		} else {
> +			/* S3 = S1 and not S2 */
> +			rc = cil_create_attribute_d1_and_not_d2(db, NODE(s1), s1, s2, &s3);
> +			if (rc != SEPOL_OK) {
> +				goto exit;
> +			}
> +		}
> +		if (s3) {
> +			cil_classperms_list_copy(&cp, p1);
> +			curr = cil_create_and_add_avrule(curr, s3, t1, cp);
> +		}
> +	}
> +
> +	if (t1->fqn != CIL_KEY_SELF && FLAVOR(t1) == CIL_TYPEATTRIBUTE) {
> +		struct cil_symtab_datum *t3 = NULL;
> +		struct cil_symtab_datum *d = NULL;
> +		struct cil_list *cp = NULL;
> +		if (t2->fqn == CIL_KEY_SELF) {
> +			/* T3 = T1 and not (S1 AND S2) */
> +			rc = cil_create_attribute_d1_and_d2(db, NODE(s1), s1, s2, &d);
> +			if (rc != SEPOL_OK) {
> +				goto exit;
> +			}
> +			if (d) {
> +				rc = cil_create_attribute_d1_and_not_d2(db, NODE(t1), t1, d, &t3);
> +				if (rc != SEPOL_OK) {
> +					goto exit;
> +				}
> +			}
> +		} else {
> +			/* S3 = T1 and not T2 */
> +			rc = cil_create_attribute_d1_and_not_d2(db, NODE(t1), t1, t2, &t3);
> +			if (rc != SEPOL_OK) {
> +				goto exit;
> +			}
> +		}
> +		if (t3) {
> +			cil_classperms_list_copy(&cp, p1);
> +			curr = cil_create_and_add_avrule(curr, s1, t3, cp);
> +		}
> +
> +		if (FLAVOR(s1) == CIL_TYPEATTRIBUTE && FLAVOR(s2) == CIL_TYPEATTRIBUTE &&
> +			t2->fqn == CIL_KEY_SELF) {
> +			/* Really special case */
> +			/* FLAVOR(t1) == CIL_TYPEATTRIBUTE */
> +			/* SX = S1 and S2 and T1 */
> +			struct cil_symtab_datum *sx = NULL;
> +			struct cil_typeattribute *sx_attr = NULL;
> +			
> +			d = NULL;
> +			cp = NULL;
> +
> +			rc = cil_create_attribute_d1_and_d2(db, NODE(s2), s2, t1, &d);
> +			if (rc != SEPOL_OK) {
> +				goto exit;
> +			}
> +			if (d) {
> +				rc = cil_create_attribute_d1_and_d2(db, NODE(s1), s1, d, &sx);
> +				if (rc != SEPOL_OK) {
> +					goto exit;
> +				}
> +				sx_attr = (struct cil_typeattribute *)sx;
> +			}
> +			if (sx && ebitmap_cardinality(sx_attr->types) > 1) {
> +				struct cil_symtab_datum *s = NULL;
> +				struct cil_symtab_datum *t = NULL;
> +				ebitmap_node_t *n;
> +				unsigned i;
> +				ebitmap_for_each_positive_bit(sx_attr->types, n, i) {
> +					s = DATUM(db->val_to_type[i]);
> +					rc = cil_create_attribute_d1_and_not_d2(db, NODE(sx), sx, s, &t);
> +					if (rc != SEPOL_OK) {
> +						goto exit;
> +					}
> +					if (t) {
> +						cil_classperms_list_copy(&cp, p1);
> +						curr = cil_create_and_add_avrule(curr, s, t, cp);
> +					}
> +				}
> +			}
> +		}
> +	}
> +
> +exit:
> +	return rc;
> +}

As I mentioned briefly back in December, it might be in the attributes 
case to only grant p2 rather than p3.  I *think* that's safe, since the 
initial allow rule grants everything p3, so the only things needed to be 
added back in the attributes are the denied permissions (p2).

> +
> +static int cil_find_matching_allow_rules(struct cil_list *matching, struct cil_tree_node *start, struct cil_tree_node *deny_node)
> +{
> +	struct cil_deny_rule *deny_rule = deny_node->data;
> +	struct cil_avrule target;
> +
> +	target.rule_kind = CIL_AVRULE_ALLOWED;
> +	target.is_extended = CIL_FALSE;
> +	target.src = deny_rule->src;
> +	target.tgt = deny_rule->tgt;
> +	target.perms.classperms = deny_rule->classperms;
> +
> +	return cil_find_matching_avrule_in_ast(start, CIL_AVRULE, &target, matching, CIL_FALSE);
> +}
> +
> +static int cil_process_deny_rule(struct cil_db *db, struct cil_tree_node *start, struct cil_tree_node *deny_node)
> +{
> +	struct cil_list *matching;
> +	struct cil_list_item *item;
> +	int rc;
> +
> +	cil_list_init(&matching, CIL_NODE);
> +
> +	rc = cil_find_matching_allow_rules(matching, start, deny_node);
> +	if (rc != SEPOL_OK) {
> +		goto exit;
> +	}
> +
> +	cil_list_for_each(item, matching) {
> +		struct cil_tree_node *allow_node = item->data;
> +		rc = cil_remove_permissions_from_rule(db, allow_node, deny_node);
> +		cil_tree_remove_node(allow_node);
> +		cil_tree_node_destroy(&allow_node);
> +		if (rc != SEPOL_OK) {
> +			goto exit;
> +		}
> +
> +	}
> +
> +exit:
> +	cil_list_destroy(&matching, CIL_FALSE);
> +	return rc;
> +}
> +
> +static int cil_process_deny_rules(struct cil_db *db, struct cil_tree_node *start, struct cil_list *deny_rules)
> +{
> +	struct cil_list_item *item;
> +	int rc;
> +
> +	cil_list_for_each(item, deny_rules) {
> +		struct cil_tree_node *deny_node = item->data;
> +		rc = cil_process_deny_rule(db, start, deny_node);
> +		if (rc != SEPOL_OK) {
> +			goto exit;
> +		}
> +		cil_tree_remove_node(deny_node);
> +		cil_tree_node_destroy(&deny_node);
> +	}
> +
> +exit:
> +	return rc;
> +}
> +
> +static int __cil_find_deny_rules(struct cil_tree_node *node,  uint32_t *finished, void *extra_args)
> +{
> +	struct cil_list *deny_rules = extra_args;
> +
> +	if (node->flavor == CIL_BLOCK) {
> +		struct cil_block *block = node->data;
> +		if (block->is_abstract == CIL_TRUE) {
> +			*finished = CIL_TREE_SKIP_HEAD;
> +		}
> +	} else if (node->flavor == CIL_MACRO) {
> +		*finished = CIL_TREE_SKIP_HEAD;
> +	} else if (node->flavor == CIL_DENY_RULE) {
> +		cil_list_append(deny_rules, CIL_DENY_RULE, node);
> +	}
> +	return SEPOL_OK;
> +}
> +
> +int cil_process_deny_rules_in_ast(struct cil_db *db)
> +{
> +	struct cil_tree_node *start;
> +	struct cil_list *deny_rules;
> +	int rc = SEPOL_ERR;
> +
> +	cil_list_init(&deny_rules, CIL_DENY_RULE);
> +
> +	if (!db) {
> +		cil_log(CIL_ERR, "No CIL db provided to process deny rules\n");
> +		goto exit;
> +	}
> +
> +	start = db->ast->root;
> +	rc = cil_tree_walk(start, __cil_find_deny_rules, NULL, NULL, deny_rules);
> +	if (rc != SEPOL_OK) {
> +		cil_log(CIL_ERR, "An error occurred while getting deny rules\n");
> +		goto exit;
> +	}
> +
> +	rc = cil_process_deny_rules(db, start, deny_rules);
> +	if (rc != SEPOL_OK) {
> +		cil_log(CIL_ERR, "An error occurred while processing deny rules\n");
> +		goto exit;
> +	}
> +
> +exit:
> +	cil_list_destroy(&deny_rules, CIL_FALSE);
> +	return rc;
> +}
> diff --git a/libsepol/cil/src/cil_deny.h b/libsepol/cil/src/cil_deny.h
> new file mode 100644
> index 00000000..4a9e92d1
> --- /dev/null
> +++ b/libsepol/cil/src/cil_deny.h
> @@ -0,0 +1,34 @@
> +/*
> + * This file is public domain software, i.e. not copyrighted.
> + *
> + * Warranty Exclusion
> + * ------------------
> + * You agree that this software is a non-commercially developed program
> + * that may contain "bugs" (as that term is used in the industry) and
> + * that it may not function as intended. The software is licensed
> + * "as is". NSA makes no, and hereby expressly disclaims all, warranties,
> + * express, implied, statutory, or otherwise with respect to the software,
> + * including noninfringement and the implied warranties of merchantability
> + * and fitness for a particular purpose.
> + *
> + * Limitation of Liability
> + *-----------------------
> + * In no event will NSA be liable for any damages, including loss of data,
> + * lost profits, cost of cover, or other special, incidental, consequential,
> + * direct or indirect damages arising from the software or the use thereof,
> + * however caused and on any theory of liability. This limitation will apply
> + * even if NSA has been advised of the possibility of such damage. You
> + * acknowledge that this is a reasonable allocation of risk.
> + *
> + * Original author: James Carter
> + */
> +
> +#ifndef CIL_DENY_H_
> +#define CIL_DENY_H_
> +
> +int cil_classperms_list_match(const struct cil_list *cpl1, const struct cil_list *cpl2);
> +void cil_classperms_list_copy(struct cil_list **new, const struct cil_list *old);
> +void cil_classperms_list_andnot(struct cil_list **result, const struct cil_list *cpl1, const struct cil_list *cpl2);
> +int cil_process_deny_rules_in_ast(struct cil_db *db);
> +
> +#endif /* CIL_DENY_H_ */
> diff --git a/libsepol/cil/src/cil_post.c b/libsepol/cil/src/cil_post.c
> index 11e572e2..fb7eec2d 100644
> --- a/libsepol/cil/src/cil_post.c
> +++ b/libsepol/cil/src/cil_post.c
> @@ -47,6 +47,7 @@
>   #include "cil_policy.h"
>   #include "cil_verify.h"
>   #include "cil_symtab.h"
> +#include "cil_deny.h"
>   
>   #define GEN_REQUIRE_ATTR "cil_gen_require" /* Also in libsepol/src/module_to_cil.c */
>   #define TYPEATTR_INFIX "_typeattr_"        /* Also in libsepol/src/module_to_cil.c */
> @@ -2551,6 +2552,12 @@ int cil_post_process(struct cil_db *db)
>   		goto exit;
>   	}
>   
> +	rc = cil_process_deny_rules_in_ast(db);
> +	if (rc != SEPOL_OK) {
> +		cil_log(CIL_ERR, "Failed to process deny rules\n");
> +		goto exit;
> +	}
> +
>   	rc = cil_post_verify(db);
>   	if (rc != SEPOL_OK) {
>   		cil_log(CIL_ERR, "Failed to verify cil database\n");

