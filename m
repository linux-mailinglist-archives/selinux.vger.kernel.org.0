Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8DFBA27FB
	for <lists+selinux@lfdr.de>; Thu, 29 Aug 2019 22:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbfH2UaS (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 29 Aug 2019 16:30:18 -0400
Received: from USAT19PA22.eemsg.mail.mil ([214.24.22.196]:32007 "EHLO
        USAT19PA22.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfH2UaS (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 29 Aug 2019 16:30:18 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Thu, 29 Aug 2019 16:30:17 EDT
X-EEMSG-check-017: 22204308|USAT19PA22_ESA_OUT03.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.64,444,1559520000"; 
   d="scan'208";a="22204308"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
  by USAT19PA22.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 29 Aug 2019 19:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1567105965; x=1598641965;
  h=subject:to:references:cc:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=yywxzxp7HWFQxCr70FM8uUBaAAy0MhaBUeK9FsETXm0=;
  b=T7WOOK7xBMSpnSA1I/7r2pylOJKA2hz1oGNiHR7ZNR25B/tnF5zwaLD+
   nJfFmIegSrPJdIYh/X37/Xeg6iYBrUmfenMRtHQBMnvQva+W90gn7mbXX
   Birdb1Yiv0ET9E+ycNaVIZ62g6El8GhtzPC/1ElOMTZSvP94rZ5hOpp/C
   Nq1WIAeJkAtwq+sN/v87Ju4AYIepZxc5WSldCLokItOWnPk6wCXa0WNJ8
   AS0Xz9ENly7h4B5YbTyrfIPPCo0cFdJO4xuDAKLlvXsIjMCpo0CfpJHb0
   gK0l+Vanjw+KEbEnvsuaTyLkoLwfCinNTHBkioRuxxGqeX3zi9re727Uu
   Q==;
X-IronPort-AV: E=Sophos;i="5.64,444,1559520000"; 
   d="scan'208";a="27349574"
IronPort-PHdr: =?us-ascii?q?9a23=3Ad3s7xRHUQJo8Ls/JSd0bCp1GYnF86YWxBRYc79?=
 =?us-ascii?q?8ds5kLTJ7yos6wAkXT6L1XgUPTWs2DsrQY0rCQ6v66EjVasN6oizMrSNR0TR?=
 =?us-ascii?q?gLiMEbzUQLIfWuLgnFFsPsdDEwB89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ?=
 =?us-ascii?q?/iOgVrO+/7BpDdj9it1+C15pbffxhEiCCybL9vMhm6txjdu8gIjYdtN6o91B?=
 =?us-ascii?q?/EqWZUdupLwm9lOUidlAvm6Meq+55j/SVQu/Y/+MNFTK73Yac2Q6FGATo/K2?=
 =?us-ascii?q?w669HluhfFTQuU+3sTSX4WnQZSAwjE9x71QJH8uTbnu+Vn2SmaOcr2Ta0oWT?=
 =?us-ascii?q?mn8qxmRgPkhDsBOjUk62zclNB+g7xHrxKgvxx/wpDbYIeJNPplY6jRecoWSX?=
 =?us-ascii?q?ddUspNUiBMBI2zb5ELD+EcI+hWqYfzrEYKoRenCwShAObjxzlVjXH0wKI6yf?=
 =?us-ascii?q?wsHxzY0gwuH9wAs3rao9v6O6gQTe+7w7LFzSnBYv5MxTvx9IbFfxInrPqRXb?=
 =?us-ascii?q?xwa83RyUw3GgPHgFSftZbqPymJ1ugTrmOW6OhgVOyzhGE9sQFxviajy9wwio?=
 =?us-ascii?q?jJmo0VylfE+T9/wIYuP9K0UkF7Ydm6EJZJsSyRKoV4QsQnQ25yuSY6zKULuY?=
 =?us-ascii?q?WncycQzpQr3RrfZOeBfoOV4RzjTP6cLSp3iX9qYr6yhwu+/VK+xuDzSMW4yk?=
 =?us-ascii?q?tGoyxYmdfWrH8NzQbc6s2fR/t4+UeuxCiA2hjI6uFBPUA0ja3bK4M9wrIolp?=
 =?us-ascii?q?ocr0DDHijulUXqlqCWbEQk+vWz6+j9frXnpoOTN49zig3kNKQhhte/DvgiPg?=
 =?us-ascii?q?gLXmib/fyw1Lzl/ULnXLVHluA6n6bWvZzAJckXu7S1DxFa34o98RqzEi+q0N?=
 =?us-ascii?q?ECknkGKFJFdgiHj4/sO1zWIvD5A+uwjE62kDd32fzLJaHhA5XRIXjDl7ftZ7?=
 =?us-ascii?q?B961VGxwYpwtBf4IxUBqkbIP3vQk/xqMDYDhghPgy2xObnE9V91p4EVm6VGa?=
 =?us-ascii?q?CZKqLSsVmV6eIrPeaBf5MauCzgK/gj+/HujX84lkIHcqm1x5Qbcmy3HvNjI0?=
 =?us-ascii?q?+Be3rjns8BEXsWvgo5VOHqk0ONUTpSZ3a0QqI96So2CJypDYjdXIChmr+B0z?=
 =?us-ascii?q?mhHp1QeG9GDkqAEXDyd4WLCL8wb3ewJdRhjzVMf6KgTYMl2Fn6tgjhy6duaO?=
 =?us-ascii?q?DO+ysUsZ/L38Jo4ebThB076TUyBMOYhSXFVGxwn2UVVxco061l509w0FGO1e?=
 =?us-ascii?q?5/mfMLO8ZU4qZLTQwzL4KGh7h4FNv7QB6bVsuYQ1ahBNO9CHc+ScxnkIxGWF?=
 =?us-ascii?q?p0B9j31kOL5CGtGbJA0uXQVZE=3D?=
X-IPAS-Result: =?us-ascii?q?A2APAgC/Imhd/wHyM5BmHAEBAQQBAQcEAQGBVgQBAQsBA?=
 =?us-ascii?q?YFsKoE/ATIqhCGRF36aFQkBAQEBAQEBAQE0AQIBAYISgi0CglkjNwYOAgsBA?=
 =?us-ascii?q?QEEAQEBAQEGAwEBbIU6QgEBBAsBgWYpAYJmAQEBAQIBIwQRQQULCwkPAgImA?=
 =?us-ascii?q?gJXBgEMBgIBAYJfP4F8D6w2fzOFSoM1gUmBDCgBi3aBV0CBESeCNjU+h0+CW?=
 =?us-ascii?q?ASBLgGLFIh7lV1tBgOCIJRNBhuCMpYrLY1CgTaZDyKBWCsKQYFogU6CTheOI?=
 =?us-ascii?q?R0jAzCBBgEBhShIiRYBAQ?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
  by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 29 Aug 2019 19:12:44 +0000
Received: from moss-lions.infosec.tycho.ncsc.mil (moss-lions [192.168.25.4])
        by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id x7TJCiJR015221;
        Thu, 29 Aug 2019 15:12:44 -0400
Subject: Re: [Non-DoD Source] [PATCH] Add default_range glblub support
To:     Joshua Brindle <joshua.brindle@crunchydata.com>,
        selinux@vger.kernel.org
References: <20190826142009.2241-1-joshua.brindle@crunchydata.com>
Cc:     Steve Smalley <sds@tycho.nsa.gov>
From:   jwcart2 <jwcart2@tycho.nsa.gov>
Message-ID: <d6b2555e-fbda-b3e2-d451-a6e9500e3646@tycho.nsa.gov>
Date:   Thu, 29 Aug 2019 15:14:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826142009.2241-1-joshua.brindle@crunchydata.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 8/26/19 10:20 AM, Joshua Brindle wrote:
> Policy developers can set a default_range default to glblub and
> computed contexts will be the intersection of the ranges of the
> source and target contexts. For example, one can add a default with
> this cil:
> 
> (defaultrange db_table glblub);
> 
> and then test using the compute_create utility:
> 
> $ ./compute_create system_u:system_r:kernel_t:s0:c1,c2,c5-s0:c1.c20 system_u:system_r:kernel_t:s0:c0.c20-s0:c0.c36 db_table
> system_u:object_r:kernel_t:s0:c1,c2,c5-s0:c1.c20
> 

It would be nice to say what glblub means and to have an example for checkpolicy 
as well.

> Signed-off-by: Joshua Brindle <joshua.brindle@crunchydata.com>
> ---
>   checkpolicy/policy_parse.y                  |  4 +++-
>   checkpolicy/policy_scan.l                   |  2 ++
>   libsemanage/src/direct_api.c                |  1 +
>   libsepol/cil/src/cil.c                      |  1 +
>   libsepol/cil/src/cil_build_ast.c            | 11 +++++----
>   libsepol/cil/src/cil_internal.h             |  2 ++
>   libsepol/cil/src/cil_policy.c               |  3 +++
>   libsepol/include/sepol/policydb/context.h   |  5 +++++
>   libsepol/include/sepol/policydb/mls_types.h | 25 +++++++++++++++++++++
>   libsepol/include/sepol/policydb/policydb.h  |  7 ++++--
>   libsepol/src/kernel_to_conf.c               |  3 +++
>   libsepol/src/mls.c                          |  2 ++
>   libsepol/src/module_to_cil.c                |  1 +
>   libsepol/src/policydb.c                     | 22 ++++++++++++++++++
>   libsepol/src/write.c                        | 12 ++++++++++
>   15 files changed, 94 insertions(+), 7 deletions(-)
> 
> diff --git a/checkpolicy/policy_parse.y b/checkpolicy/policy_parse.y
> index 247bd4ee..abb7d885 100644
> --- a/checkpolicy/policy_parse.y
> +++ b/checkpolicy/policy_parse.y
> @@ -155,7 +155,7 @@ typedef int (* require_func_t)(int pass);
>   %token PERMISSIVE
>   %token FILESYSTEM
>   %token DEFAULT_USER DEFAULT_ROLE DEFAULT_TYPE DEFAULT_RANGE
> -%token LOW_HIGH LOW HIGH
> +%token LOW_HIGH LOW HIGH GLBLUB
>   
>   %left OR
>   %left XOR
> @@ -247,6 +247,8 @@ default_range_def	: DEFAULT_RANGE names SOURCE LOW ';'
>   			{if (define_default_range(DEFAULT_TARGET_HIGH)) return -1; }
>   			| DEFAULT_RANGE names TARGET LOW_HIGH ';'
>   			{if (define_default_range(DEFAULT_TARGET_LOW_HIGH)) return -1; }
> +			| DEFAULT_RANGE names GLBLUB';'
> +			{if (define_default_range(DEFAULT_GLBLUB)) return -1; }
>   			;
>   opt_mls			: mls
>                           |
> diff --git a/checkpolicy/policy_scan.l b/checkpolicy/policy_scan.l
> index e93ccb64..e2f676e4 100644
> --- a/checkpolicy/policy_scan.l
> +++ b/checkpolicy/policy_scan.l
> @@ -256,6 +256,8 @@ high |
>   HIGH				{ return(HIGH); }
>   low |
>   LOW				{ return(LOW); }
> +glblub |
> +GLBLUB				{ return(GLBLUB); }
>   "/"[^ \n\r\t\f]*	        { return(PATH); }
>   \""/"[^\"\n]*\" 		{ return(QPATH); }
>   \"[^"/"\"\n]+\"	{ return(FILENAME); }
> diff --git a/libsemanage/src/direct_api.c b/libsemanage/src/direct_api.c
> index 1088a0ac..c9d7fa1c 100644
> --- a/libsemanage/src/direct_api.c
> +++ b/libsemanage/src/direct_api.c
> @@ -22,6 +22,7 @@
>   #include <sepol/module.h>
>   #include <sepol/handle.h>
>   #include <sepol/cil/cil.h>
> +#include <sepol/policydb.h>

What's this for?

>   #include <selinux/selinux.h>
>   
>   #include <assert.h>
> diff --git a/libsepol/cil/src/cil.c b/libsepol/cil/src/cil.c
> index 2a7ec063..de729cf8 100644
> --- a/libsepol/cil/src/cil.c
> +++ b/libsepol/cil/src/cil.c
> @@ -227,6 +227,7 @@ static void cil_init_keys(void)
>   	CIL_KEY_LOW = cil_strpool_add("low");
>   	CIL_KEY_HIGH = cil_strpool_add("high");
>   	CIL_KEY_LOW_HIGH = cil_strpool_add("low-high");
> +	CIL_KEY_GLBLUB = cil_strpool_add("glblub");
>   	CIL_KEY_ROOT = cil_strpool_add("<root>");
>   	CIL_KEY_NODE = cil_strpool_add("<node>");
>   	CIL_KEY_PERM = cil_strpool_add("perm");
> diff --git a/libsepol/cil/src/cil_build_ast.c b/libsepol/cil/src/cil_build_ast.c
> index b90b0f60..ee1c51ce 100644
> --- a/libsepol/cil/src/cil_build_ast.c
> +++ b/libsepol/cil/src/cil_build_ast.c
> @@ -5894,7 +5894,7 @@ int cil_gen_defaultrange(struct cil_tree_node *parse_current, struct cil_tree_no
>   		CIL_SYN_STRING,
>   		CIL_SYN_STRING | CIL_SYN_LIST,
>   		CIL_SYN_STRING,
> -		CIL_SYN_STRING,
> +		CIL_SYN_STRING | CIL_SYN_END,
>   		CIL_SYN_END
>   	};
>   	int syntax_len = sizeof(syntax)/sizeof(*syntax);
> @@ -5917,8 +5917,8 @@ int cil_gen_defaultrange(struct cil_tree_node *parse_current, struct cil_tree_no
>   	}
>   
>   	object = parse_current->next->next->data;
> -	range = parse_current->next->next->next->data;
>   	if (object == CIL_KEY_SOURCE) {
> +		range = parse_current->next->next->next->data;
>   		if (range == CIL_KEY_LOW) {
>   			def->object_range = CIL_DEFAULT_SOURCE_LOW;
>   		} else if (range == CIL_KEY_HIGH) {
> @@ -5930,7 +5930,8 @@ int cil_gen_defaultrange(struct cil_tree_node *parse_current, struct cil_tree_no
>   			rc = SEPOL_ERR;
>   			goto exit;
>   		}
> -	} else if (parse_current->next->next->data == CIL_KEY_TARGET) {
> +	} else if (object == CIL_KEY_TARGET) {
> +		range = parse_current->next->next->next->data;
>   		if (range == CIL_KEY_LOW) {
>   			def->object_range = CIL_DEFAULT_TARGET_LOW;
>   		} else if (range == CIL_KEY_HIGH) {
> @@ -5942,8 +5943,10 @@ int cil_gen_defaultrange(struct cil_tree_node *parse_current, struct cil_tree_no
>   			rc = SEPOL_ERR;
>   			goto exit;
>   		}
> +	} else if (object == CIL_KEY_GLBLUB) {
> +		def->object_range = CIL_DEFAULT_GLBLUB;
>   	} else {
> -		cil_log(CIL_ERR,"Expected either \'source\' or \'target\'\n");
> +		cil_log(CIL_ERR,"Expected \'source\', \'target\', or \'glblub\'\n");
>   		rc = SEPOL_ERR;
>   		goto exit;
>   	}
> diff --git a/libsepol/cil/src/cil_internal.h b/libsepol/cil/src/cil_internal.h
> index 6ff32285..30fab649 100644
> --- a/libsepol/cil/src/cil_internal.h
> +++ b/libsepol/cil/src/cil_internal.h
> @@ -149,6 +149,7 @@ char *CIL_KEY_TARGET;
>   char *CIL_KEY_LOW;
>   char *CIL_KEY_HIGH;
>   char *CIL_KEY_LOW_HIGH;
> +char *CIL_KEY_GLBLUB;
>   char *CIL_KEY_HANDLEUNKNOWN;
>   char *CIL_KEY_HANDLEUNKNOWN_ALLOW;
>   char *CIL_KEY_HANDLEUNKNOWN_DENY;
> @@ -941,6 +942,7 @@ enum cil_default_object_range {
>   	CIL_DEFAULT_TARGET_LOW      = DEFAULT_TARGET_LOW,
>   	CIL_DEFAULT_TARGET_HIGH     = DEFAULT_TARGET_HIGH,
>   	CIL_DEFAULT_TARGET_LOW_HIGH = DEFAULT_TARGET_LOW_HIGH,
> +	CIL_DEFAULT_GLBLUB          = DEFAULT_GLBLUB,
>   };
>   
>   /* Default labeling behavior for range */
> diff --git a/libsepol/cil/src/cil_policy.c b/libsepol/cil/src/cil_policy.c
> index 1adf22a3..b031bb00 100644
> --- a/libsepol/cil/src/cil_policy.c
> +++ b/libsepol/cil/src/cil_policy.c
> @@ -834,6 +834,9 @@ static void cil_default_ranges_to_policy(FILE *out, struct cil_list *defaults)
>   		case CIL_DEFAULT_TARGET_LOW_HIGH:
>   			fprintf(out," %s %s", CIL_KEY_TARGET, CIL_KEY_LOW_HIGH);
>   			break;
> +		case CIL_DEFAULT_GLBLUB:
> +			fprintf(out," %s %s", CIL_KEY_TARGET, CIL_KEY_GLBLUB);

I think you just want fprintf(out," %s", CIL_KEY_GLBLUB);

> +			break;
>   		default:
>   			break;
>   		}
> diff --git a/libsepol/include/sepol/policydb/context.h b/libsepol/include/sepol/policydb/context.h
> index c27c3341..37cdc591 100644
> --- a/libsepol/include/sepol/policydb/context.h
> +++ b/libsepol/include/sepol/policydb/context.h
> @@ -92,6 +92,11 @@ out:
>   	return rc;
>   }
>   
> +static inline int mls_context_glblub(context_struct_t *dst, context_struct_t *c1, context_struct_t *c2)
> +{
> +	return mls_range_glblub(&dst->range, &c1->range, &c2->range);
> +}
> +
>   static inline int mls_context_cmp(context_struct_t * c1, context_struct_t * c2)
>   {
>   	return (mls_level_eq(&c1->range.level[0], &c2->range.level[0]) &&
> diff --git a/libsepol/include/sepol/policydb/mls_types.h b/libsepol/include/sepol/policydb/mls_types.h
> index a06723be..450c9564 100644
> --- a/libsepol/include/sepol/policydb/mls_types.h
> +++ b/libsepol/include/sepol/policydb/mls_types.h
> @@ -32,6 +32,7 @@
>   
>   #include <stdint.h>
>   #include <stdlib.h>
> +#include <sys/param.h>
>   #include <sepol/policydb/ebitmap.h>
>   #include <sepol/policydb/flask_types.h>
>   
> @@ -48,6 +49,30 @@ typedef struct mls_range {
>   	mls_level_t level[2];	/* low == level[0], high == level[1] */
>   } mls_range_t;
>   
> +static inline int mls_range_glblub(struct mls_range *dst, struct mls_range *r1, struct mls_range *r2)
> +{
> +	if (r1->level[1].sens < r2->level[0].sens || r2->level[1].sens < r1->level[0].sens) {
> +		// These ranges have no common sensitivities
> +		return -1;
> +	}
> +
> +	// Take the greatest of the low
> +	dst->level[0].sens = MAX(r1->level[0].sens, r2->level[0].sens);
> +	// Take the least of the high
> +	dst->level[1].sens = MIN(r1->level[1].sens, r2->level[1].sens);
> +
> +	if (ebitmap_and(&dst->level[0].cat, &r1->level[0].cat, &r2->level[0].cat) < 0) {
> +		return -1;
> +	}
> +
> +	if (ebitmap_and(&dst->level[1].cat, &r1->level[1].cat, &r2->level[1].cat) < 0) {
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +
>   static inline int mls_level_cpy(struct mls_level *dst, struct mls_level *src)
>   {
>   
> diff --git a/libsepol/include/sepol/policydb/policydb.h b/libsepol/include/sepol/policydb/policydb.h
> index a279382e..b0d2fdfc 100644
> --- a/libsepol/include/sepol/policydb/policydb.h
> +++ b/libsepol/include/sepol/policydb/policydb.h
> @@ -130,6 +130,7 @@ typedef struct class_datum {
>   #define DEFAULT_TARGET_LOW	4
>   #define DEFAULT_TARGET_HIGH	5
>   #define DEFAULT_TARGET_LOW_HIGH	6
> +#define DEFAULT_GLBLUB 		7
>   	char default_range;
>   } class_datum_t;
>   
> @@ -741,10 +742,11 @@ extern int policydb_set_target_platform(policydb_t *p, int platform);
>   #define POLICYDB_VERSION_XEN_DEVICETREE		30 /* Xen-specific */
>   #define POLICYDB_VERSION_XPERMS_IOCTL	30 /* Linux-specific */
>   #define POLICYDB_VERSION_INFINIBAND		31 /* Linux-specific */
> +#define POLICYDB_VERSION_GLBLUB		32
>   
>   /* Range of policy versions we understand*/
>   #define POLICYDB_VERSION_MIN	POLICYDB_VERSION_BASE
> -#define POLICYDB_VERSION_MAX	POLICYDB_VERSION_INFINIBAND
> +#define POLICYDB_VERSION_MAX	POLICYDB_VERSION_GLBLUB
>   
>   /* Module versions and specific changes*/
>   #define MOD_POLICYDB_VERSION_BASE		4
> @@ -765,9 +767,10 @@ extern int policydb_set_target_platform(policydb_t *p, int platform);
>   #define MOD_POLICYDB_VERSION_CONSTRAINT_NAMES  17
>   #define MOD_POLICYDB_VERSION_XPERMS_IOCTL  18
>   #define MOD_POLICYDB_VERSION_INFINIBAND		19
> +#define MOD_POLICYDB_VERSION_GLBLUB		20
>   
>   #define MOD_POLICYDB_VERSION_MIN MOD_POLICYDB_VERSION_BASE
> -#define MOD_POLICYDB_VERSION_MAX MOD_POLICYDB_VERSION_INFINIBAND
> +#define MOD_POLICYDB_VERSION_MAX MOD_POLICYDB_VERSION_GLBLUB
>   
>   #define POLICYDB_CONFIG_MLS    1
>   
> diff --git a/libsepol/src/kernel_to_conf.c b/libsepol/src/kernel_to_conf.c
> index 930bafab..a44ba30a 100644
> --- a/libsepol/src/kernel_to_conf.c
> +++ b/libsepol/src/kernel_to_conf.c
> @@ -673,6 +673,9 @@ static int write_default_range_to_conf(FILE *out, char *class_name, class_datum_
>   	case DEFAULT_TARGET_LOW_HIGH:
>   		dft = "target low-high";
>   		break;
> +	case DEFAULT_GLBLUB:
> +		dft = "glblub";
> +		break;
>   	default:
>   		sepol_log_err("Unknown default type value: %i", class->default_range);
>   		return -1;

You need to update kernel_to_cil.c as well.

> diff --git a/libsepol/src/mls.c b/libsepol/src/mls.c
> index 63ad1bcb..6ff9a846 100644
> --- a/libsepol/src/mls.c
> +++ b/libsepol/src/mls.c
> @@ -643,6 +643,8 @@ int mls_compute_sid(policydb_t * policydb,
>   			return mls_context_cpy_high(newcontext, tcontext);
>   		case DEFAULT_TARGET_LOW_HIGH:
>   			return mls_context_cpy(newcontext, tcontext);
> +		case DEFAULT_GLBLUB:
> +			return mls_context_glblub(newcontext, scontext, tcontext);
>   		}
>   
>   		/* Fallthrough */
> diff --git a/libsepol/src/module_to_cil.c b/libsepol/src/module_to_cil.c
> index 1af166c9..c48a897d 100644
> --- a/libsepol/src/module_to_cil.c
> +++ b/libsepol/src/module_to_cil.c
> @@ -2033,6 +2033,7 @@ static int class_to_cil(int indent, struct policydb *pdb, struct avrule_block *U
>   		case DEFAULT_TARGET_LOW:		dflt = "target low";	break;
>   		case DEFAULT_TARGET_HIGH:		dflt = "target high";	break;
>   		case DEFAULT_TARGET_LOW_HIGH:	dflt = "target low-high";	break;
> +		case DEFAULT_GLBLUB:		dflt = "glblub";		break;
>   		default:
>   			log_err("Unknown default range value: %i", class->default_range);
>   			rc = -1;
> diff --git a/libsepol/src/policydb.c b/libsepol/src/policydb.c
> index 69bcb4d5..67037b6d 100644
> --- a/libsepol/src/policydb.c
> +++ b/libsepol/src/policydb.c
> @@ -194,6 +194,13 @@ static struct policydb_compat_info policydb_compat[] = {
>   	 .ocon_num = OCON_IBENDPORT + 1,
>   	 .target_platform = SEPOL_TARGET_SELINUX,
>   	},
> +	{
> +	 .type = POLICY_KERN,
> +	 .version = POLICYDB_VERSION_GLBLUB,
> +	 .sym_num = SYM_NUM,
> +	 .ocon_num = OCON_IBENDPORT + 1,
> +	 .target_platform = SEPOL_TARGET_SELINUX,
> +	},
>   	{
>   	 .type = POLICY_BASE,
>   	 .version = MOD_POLICYDB_VERSION_BASE,
> @@ -306,6 +313,13 @@ static struct policydb_compat_info policydb_compat[] = {
>   	 .ocon_num = OCON_IBENDPORT + 1,
>   	 .target_platform = SEPOL_TARGET_SELINUX,
>   	},
> +	{
> +	 .type = POLICY_BASE,
> +	 .version = MOD_POLICYDB_VERSION_GLBLUB,
> +	 .sym_num = SYM_NUM,
> +	 .ocon_num = OCON_IBENDPORT + 1,
> +	 .target_platform = SEPOL_TARGET_SELINUX,
> +	},
>   	{
>   	 .type = POLICY_MOD,
>   	 .version = MOD_POLICYDB_VERSION_BASE,
> @@ -418,6 +432,14 @@ static struct policydb_compat_info policydb_compat[] = {
>   	 .ocon_num = 0,
>   	 .target_platform = SEPOL_TARGET_SELINUX,
>   	},
> +	{
> +	 .type = POLICY_MOD,
> +	 .version = MOD_POLICYDB_VERSION_GLBLUB,
> +	 .sym_num = SYM_NUM,
> +	 .ocon_num = 0,
> +	 .target_platform = SEPOL_TARGET_SELINUX,
> +	},
> +
>   };
>   
>   #if 0
> diff --git a/libsepol/src/write.c b/libsepol/src/write.c
> index dee7b4a3..c6be2be2 100644
> --- a/libsepol/src/write.c
> +++ b/libsepol/src/write.c
> @@ -46,6 +46,11 @@
>   #include "private.h"
>   #include "mls.h"
>   
> +#define glblub_version ((p->policy_type == POLICY_KERN && \
> +		     p->policyvers >= POLICYDB_VERSION_GLBLUB) || \
> +		    (p->policy_type == POLICY_BASE && \
> +		     p->policyvers >= MOD_POLICYDB_VERSION_GLBLUB))
> +
>   struct policy_data {
>   	struct policy_file *fp;
>   	struct policydb *p;
> @@ -1034,6 +1039,13 @@ static int class_write(hashtab_key_t key, hashtab_datum_t datum, void *ptr)
>   	     p->policyvers >= MOD_POLICYDB_VERSION_NEW_OBJECT_DEFAULTS)) {
>   		buf[0] = cpu_to_le32(cladatum->default_user);
>   		buf[1] = cpu_to_le32(cladatum->default_role);
> +		if (!glblub_version && cladatum->default_range == DEFAULT_GLBLUB) {
> +			WARN(fp->handle,
> +                             "class %s default_range set to GLBLUB but policy version is %d (%d required), discarding",
> +                             p->p_class_val_to_name[cladatum->s.value - 1], p->policyvers,
> +                             p->policy_type == POLICY_KERN? POLICYDB_VERSION_GLBLUB:MOD_POLICYDB_VERSION_GLBLUB);
> +                        cladatum->default_range = 0;
> +                }
>   		buf[2] = cpu_to_le32(cladatum->default_range);
>   		items = put_entry(buf, sizeof(uint32_t), 3, fp);
>   		if (items != 3)
> 

Everything else looks ok, but I haven't tested it yet.

-- 
James Carter <jwcart2@tycho.nsa.gov>
National Security Agency
