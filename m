Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEDC313B3C
	for <lists+selinux@lfdr.de>; Mon,  8 Feb 2021 18:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234889AbhBHRnV (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 8 Feb 2021 12:43:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234952AbhBHRms (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 8 Feb 2021 12:42:48 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E96AC061794
        for <selinux@vger.kernel.org>; Mon,  8 Feb 2021 09:41:01 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id i20so14948972otl.7
        for <selinux@vger.kernel.org>; Mon, 08 Feb 2021 09:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=N+UKvvvGD6j1E6KgtQjhUYF2AhUwccTb7O9RH+gxLlI=;
        b=CmxUkUhgKU/eMinB0f9BrEmLtTFOxW55Tadk4PpvVIf/1E6Iy/qL52X2ImByL8VXPz
         tLzdFzVI13ZGcw8YYrfxUTi2h+eGwjdzWRsfJPo3oWCVqzlft4vpRjmR8QP8JgSWyGLT
         ABKZriN0Qn6d1tdcCouB8/FcaXWftDYtrvv9ELEl3qiSs/uXcuEvkQb25tKZXHrCbO7R
         jCDTFElnxrrjG71WPufyBHMFAcIBR5ggExiFIcyok4i+1k1/Ek0XVvzI7sav1suB8CUj
         MXdyv/vX2RLO00GjWPv+ZUuw2ggoCqO+I+v+GxgWFUps82CUba3H9pKmgs7d83Tg/Tfu
         4b8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=N+UKvvvGD6j1E6KgtQjhUYF2AhUwccTb7O9RH+gxLlI=;
        b=qMbAyh1uc8iZz846ngVA1k6OzH3XILMCsNV20XgOGPCP4EUxR+5Dz0/lHnHUshONUg
         qAMVcfmYtqSMY6T9EveZJwl/ZjCJY8E8fxTF4jAfop8d9agpNbLqbJgPbcwS4SzFXn08
         SG0svfpjjSyg6wU1rrmMsFmOHCWxF/RLz9L66VuJ++xvhhNu/rY/xZxlwpLMvUBxEOY3
         0H57mC4D2PJ9OKk2lQyUlnzNKxWl3ULLri6IBKpJlRaFJHvIm6IUAKaRFzeqDYZYa4FK
         zifSsrxvOv4dtgOLBDQqsgJAz4u0DLvf5SlpxVebEU6+yvJ7SLgwXGIieSNHxpUFbJu9
         PA5w==
X-Gm-Message-State: AOAM533qJrcMHS8OzYpHC1b2kEfHA35rKYsskK704z+k3ZzAgt9wJ+2I
        Hq3LZbjaTjiUy9zoPYZEhnSER18F1RKhm1fFak8=
X-Google-Smtp-Source: ABdhPJyGz9oiSMcqqT8vvRdK6pcnPMCnL8tRYeAZbRxbyb7+NdhXHcdT4ij7mQTCFWMC/fS4mtJYg+errc/RqpIbdhw=
X-Received: by 2002:a9d:32e2:: with SMTP id u89mr13081592otb.196.1612806059054;
 Mon, 08 Feb 2021 09:40:59 -0800 (PST)
MIME-Version: 1.0
References: <a8abefda-5c2b-918d-65d9-e21b89e9a2bf@gmail.com> <55f751a5-2f6b-2f78-932a-9fcb4d363ba7@gmail.com>
In-Reply-To: <55f751a5-2f6b-2f78-932a-9fcb4d363ba7@gmail.com>
From:   James Carter <jwcart2@gmail.com>
Date:   Mon, 8 Feb 2021 12:40:47 -0500
Message-ID: <CAP+JOzRkUOkcgFm-nPiC9Z4Sb+42+vk8p85qHxp0-gwkRh7eWg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] secilc/docs: use fenced code blocks for cil examples
To:     bauen1 <j2468h@googlemail.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Sat, Feb 6, 2021 at 4:05 PM bauen1 <j2468h@googlemail.com> wrote:
>
> Also fixes the occasional missing brackets as highlited by my editor,
> however the individual examples where not reviewed much closer.
>
> secilc was chosen as language name because the compiler is named secilc
> and outside of SELinux the name cil is less searchable and could lead to
> confusion.
>
> Signed-off-by: Jonathan Hettwer <j2468h@gmail.com>
> ---
>  secilc/docs/Makefile                          |  2 +-
>  secilc/docs/cil_access_vector_rules.md        | 33 ++++++++++--
>  secilc/docs/cil_call_macro_statements.md      | 10 ++++
>  .../cil_class_and_permission_statements.md    | 42 ++++++++++++++++
>  secilc/docs/cil_conditional_statements.md     | 16 +++++-
>  secilc/docs/cil_constraint_statements.md      | 16 ++++++
>  secilc/docs/cil_container_statements.md       | 16 ++++++
>  secilc/docs/cil_context_statement.md          | 10 ++++
>  secilc/docs/cil_file_labeling_statements.md   | 14 ++++++
>  secilc/docs/cil_infiniband_statements.md      |  9 +++-
>  secilc/docs/cil_mls_labeling_statements.md    | 50 ++++++++++++++++++-
>  .../docs/cil_network_labeling_statements.md   | 16 ++++++
>  secilc/docs/cil_policy_config_statements.md   | 12 +++++
>  secilc/docs/cil_reference_guide.md            | 27 ++++++++++
>  secilc/docs/cil_role_statements.md            | 26 ++++++++++
>  secilc/docs/cil_sid_statements.md             | 12 +++++
>  secilc/docs/cil_type_statements.md            | 50 +++++++++++++++++++
>  secilc/docs/cil_user_statements.md            | 42 +++++++++++++++-
>  secilc/docs/cil_xen_statements.md             | 20 ++++++++
>  19 files changed, 414 insertions(+), 9 deletions(-)
>

You missed updating secilc/docs/cil_default_object_statements.md

Thanks,
Jim


> diff --git a/secilc/docs/Makefile b/secilc/docs/Makefile
> index 197ccef2..79a165ba 100644
> --- a/secilc/docs/Makefile
> +++ b/secilc/docs/Makefile
> @@ -51,7 +51,7 @@ $(TMPDIR)/%.md: %.md | $(TMPDIR)
>  $(TMPDIR)/policy.cil: $(TESTDIR)/policy.cil
>         cp -f $< $@
>         @# add a title for the TOC to policy.cil. This is needed to play =
nicely with the PDF conversion.
> -       $(SED) -i '1i Example Policy\n=3D=3D=3D=3D=3D=3D=3D=3D=3D\n```' $=
@
> +       $(SED) -i '1i Example Policy\n=3D=3D=3D=3D=3D=3D=3D=3D=3D\n```sec=
il' $@
>         echo '```' >> $@
>
>  html: $(PANDOC_FILE_LIST) $(TMPDIR)/policy.cil
> diff --git a/secilc/docs/cil_access_vector_rules.md b/secilc/docs/cil_acc=
ess_vector_rules.md
> index 683cc28c..e8fc740f 100644
> --- a/secilc/docs/cil_access_vector_rules.md
> +++ b/secilc/docs/cil_access_vector_rules.md
> @@ -42,6 +42,7 @@ Specifies the access allowed between a source and targe=
t type. Note that access
>
>  These examples show a selection of possible permutations of [`allow`](ci=
l_access_vector_rules.md#allow) rules:
>
> +```secil
>      (class binder (impersonate call set_context_mgr transfer receive))
>      (class property_service (set))
>      (class zygote (specifyids specifyrlimits specifycapabilities specify=
invokewith specifyseinfo))
> @@ -84,6 +85,7 @@ These examples show a selection of possible permutation=
s of [`allow`](cil_access
>          (allow type_5 type_5 (property_service (set)))
>          (allow type_1 all_types (property_service (set)))
>      )
> +```
>
>  auditallow
>  ----------
> @@ -92,7 +94,9 @@ Audit the access rights defined if there is a valid all=
ow rule. Note: It does NO
>
>  **Rule definition:**
>
> +```secil
>      (auditallow source_id target_id|self classpermissionset_id ...)
> +```
>
>  **Where:**
>
> @@ -126,10 +130,11 @@ Audit the access rights defined if there is a valid=
 allow rule. Note: It does NO
>
>  This example will log an audit event whenever the corresponding [`allow`=
](cil_access_vector_rules.md#allow) rule grants access to the specified per=
missions:
>
> +```secil
>      (allow release_app.process secmark_demo.browser_packet (packet (send=
 recv append bind)))
>
>      (auditallow release_app.process secmark_demo.browser_packet (packet =
(send recv)))
> -
> +```
>
>  dontaudit
>  ---------
> @@ -140,7 +145,9 @@ Note that these rules can be omitted by the CIL compi=
ler command line parameter
>
>  **Rule definition:**
>
> +```secil
>      (dontaudit source_id target_id|self classpermissionset_id ...)
> +```
>
>  **Where:**
>
> @@ -174,7 +181,9 @@ Note that these rules can be omitted by the CIL compi=
ler command line parameter
>
>  This example will not audit the denied access:
>
> +```secil
>      (dontaudit zygote.process self (capability (fsetid)))
> +```
>
>  neverallow
>  ----------
> @@ -185,7 +194,9 @@ Note that these rules can be over-ridden by the CIL c=
ompiler command line parame
>
>  **Rule definition:**
>
> +```secil
>      (neverallow source_id target_id|self classpermissionset_id ...)
> +```
>
>  **Where:**
>
> @@ -219,6 +230,7 @@ Note that these rules can be over-ridden by the CIL c=
ompiler command line parame
>
>  This example will not compile as `type_3` is not allowed to be a source =
type for the [`allow`](cil_access_vector_rules.md#allow) rule:
>
> +```secil
>      (class property_service (set))
>
>      (block av_rules
> @@ -232,6 +244,7 @@ This example will not compile as `type_3` is not allo=
wed to be a source type for
>          ; This rule will fail compilation:
>          (allow type_3 self (property_service (set)))
>      )
> +```
>
>  allowx
>  ------
> @@ -242,7 +255,9 @@ Note that for this to work there must *also* be valid=
 equivalent [`allow`](cil_a
>
>  **Rule definition:**
>
> +```secil
>      (allowx source_id target_id|self permissionx_id)
> +```
>
>  **Where:**
>
> @@ -276,12 +291,14 @@ Note that for this to work there must *also* be val=
id equivalent [`allow`](cil_a
>
>  These examples show a selection of possible permutations of [`allowx`](c=
il_access_vector_rules.md#allowx) rules:
>
> +```secil
>      (allow type_1 type_2 (tcp_socket (ioctl))) ;; pre-requisite
>      (allowx type_1 type_2 (ioctl tcp_socket (range 0x2000 0x20FF)))
>
>      (permissionx ioctl_nodebug (ioctl udp_socket (not (range 0x4000 0x40=
10))))
>      (allow type_3 type_4 (udp_socket (ioctl))) ;; pre-requisite
>      (allowx type_3 type_4 ioctl_nodebug)
> +```
>
>
>  auditallowx
> @@ -293,7 +310,9 @@ Note that for this to work there must *also* be valid=
 equivalent [`auditallow`](
>
>  **Rule definition:**
>
> +```secil
>      (auditallowx source_id target_id|self permissionx_id)
> +```
>
>  **Where:**
>
> @@ -327,11 +346,12 @@ Note that for this to work there must *also* be val=
id equivalent [`auditallow`](
>
>  This example will log an audit event whenever the corresponding [`allowx=
`](cil_access_vector_rules.md#allowx) rule grants access to the specified e=
xtended permissions:
>
> +```secil
>      (allowx type_1 type_2 (ioctl tcp_socket (range 0x2000 0x20FF)))
>
>      (auditallow type_1 type_2 (tcp_socket (ioctl))) ;; pre-requisite
>      (auditallowx type_1 type_2 (ioctl tcp_socket (range 0x2005 0x2010)))
> -
> +```
>
>  dontauditx
>  ----------
> @@ -344,7 +364,9 @@ Note that these rules can be omitted by the CIL compi=
ler command line parameter
>
>  **Rule definition:**
>
> +```secil
>      (dontauditx source_id target_id|self permissionx_id)
> +```
>
>  **Where:**
>
> @@ -378,9 +400,10 @@ Note that these rules can be omitted by the CIL comp=
iler command line parameter
>
>  This example will not audit the denied access:
>
> +```secil
>      (allowx type_1 type_2 (ioctl tcp_socket (0x1))) ;; pre-requisite, ju=
st some irrelevant random ioctl
>      (dontauditx type_1 type_2 (ioctl tcp_socket (range 0x3000 0x30FF)))
> -
> +```
>
>  neverallowx
>  ----------
> @@ -390,7 +413,9 @@ Note that these rules can be over-ridden by the CIL c=
ompiler command line parame
>
>  **Rule definition:**
>
> +```secil
>      (neverallowx source_id target_id|self permissionx_id)
> +```
>
>  **Where:**
>
> @@ -424,6 +449,7 @@ Note that these rules can be over-ridden by the CIL c=
ompiler command line parame
>
>  This example will not compile as `type_3` is not allowed to be a source =
type and ioctl range for the [`allowx`](cil_access_vector_rules.md#allowx) =
rule:
>
> +```secil
>         (class property_service (ioctl))
>         (block av_rules
>                 (type type_1)
> @@ -435,3 +461,4 @@ This example will not compile as `type_3` is not allo=
wed to be a source type and
>                 ; This rule will fail compilation:
>                 (allowx type_3 self (ioctl property_service (0x20A0)))
>         )
> +```
> diff --git a/secilc/docs/cil_call_macro_statements.md b/secilc/docs/cil_c=
all_macro_statements.md
> index 98b70368..33ef9462 100644
> --- a/secilc/docs/cil_call_macro_statements.md
> +++ b/secilc/docs/cil_call_macro_statements.md
> @@ -10,7 +10,9 @@ Each parameter passed contains an argument to be resolv=
ed by the [macro](#macro)
>
>  **Statement definition:**
>
> +```secil
>      (call macro_id [(param ...)])
> +```
>
>  **Where:**
>
> @@ -58,10 +60,12 @@ When resolving macros the following places are checke=
d in this order:
>
>  **Statement definition:**
>
> +```secil
>      (macro macro_id ([(param_type param_id) ...])
>          cil_statements
>          ...
>      )
> +```
>
>  **Where:**
>
> @@ -99,6 +103,7 @@ When resolving macros the following places are checked=
 in this order:
>
>  This example will instantiate the `binder_call` macro in the calling nam=
espace (`my_domain`) and replace `ARG1` with `appdomain` and `ARG2` with `b=
inderservicedomain`:
>
> +```secil
>      (block my_domain
>          (call binder_call (appdomain binderservicedomain))
>      )
> @@ -108,9 +113,11 @@ This example will instantiate the `binder_call` macr=
o in the calling namespace (
>          (allow ARG2 ARG1 (binder (transfer)))
>          (allow ARG1 ARG2 (fd (use)))
>      )
> +```
>
>  This example does not pass any parameters to the macro but adds a [`type=
`](cil_type_statements.md#type) identifier to the current namespace:
>
> +```secil
>      (block unconfined
>          (call add_type)
>          ....
> @@ -119,9 +126,11 @@ This example does not pass any parameters to the mac=
ro but adds a [`type`](cil_t
>              (type exec)
>          )
>      )
> +```
>
>  This example passes an anonymous and named IP address to the macro:
>
> +```secil
>      (ipaddr netmask_1 255.255.255.0)
>      (context netlabel_1 (system.user object_r unconfined.object low_low)
>
> @@ -130,3 +139,4 @@ This example passes an anonymous and named IP address=
 to the macro:
>      (macro build_nodecon ((ipaddr ARG1) (ipaddr ARG2))
>          (nodecon ARG1 ARG2  netlabel_1)
>      )
> +```
> diff --git a/secilc/docs/cil_class_and_permission_statements.md b/secilc/=
docs/cil_class_and_permission_statements.md
> index 308c86d6..368e3a4d 100644
> --- a/secilc/docs/cil_class_and_permission_statements.md
> +++ b/secilc/docs/cil_class_and_permission_statements.md
> @@ -8,7 +8,9 @@ Declares a common identifier in the current namespace wit=
h a set of common permi
>
>  **Statement definition:**
>
> +```secil
>      (common common_id (permission_id ...))
> +```
>
>  **Where:**
>
> @@ -37,7 +39,9 @@ Declares a common identifier in the current namespace w=
ith a set of common permi
>
>  This common statement will associate the [`common`](cil_class_and_permis=
sion_statements.md#common) identifier '`file`' with the list of permissions=
:
>
> +```secil
>      (common file (ioctl read write create getattr setattr lock relabelfr=
om relabelto append unlink link rename execute swapon quotaon mounton))
> +```
>
>  classcommon
>  -----------
> @@ -46,7 +50,9 @@ Associate a [`class`](cil_class_and_permission_statemen=
ts.md#class) identifier t
>
>  **Statement definition:**
>
> +```secil
>      (classcommon class_id common_id)
> +```
>
>  **Where:**
>
> @@ -75,9 +81,11 @@ Associate a [`class`](cil_class_and_permission_stateme=
nts.md#class) identifier t
>
>  This associates the `dir` class with the list of permissions declared by=
 the `file common` identifier:
>
> +```secil
>      (common file (ioctl read write create getattr setattr lock relabelfr=
om relabelto append unlink link rename execute swapon quotaon mounton))
>
>      (classcommon dir file)
> +```
>
>  class
>  -----
> @@ -86,7 +94,9 @@ Declares a class and zero or more permissions in the cu=
rrent namespace.
>
>  **Statement definition:**
>
> +```secil
>      (class class_id (permission_id ...))
> +```
>
>  **Where:**
>
> @@ -115,29 +125,39 @@ Declares a class and zero or more permissions in th=
e current namespace.
>
>  This example defines a set of permissions for the `binder` class identif=
ier:
>
> +```secil
>      (class binder (impersonate call set_context_mgr transfer receive))
> +```
>
>  This example defines a common set of permissions to be used by the `sem`=
 class, the `(class sem ())` does not define any other permissions (i.e. an=
 empty list):
>
> +```secil
>      (common ipc (create destroy getattr setattr read write associate uni=
x_read unix_write))
>
>      (classcommon sem ipc)
>      (class sem ())
> +```
>
>  and will produce the following set of permissions for the `sem` class id=
entifier of:
>
> +```secil
>      (class sem (create destroy getattr setattr read write associate unix=
_read unix_write))
> +```
>
>  This example, with the following combination of the [`common`](cil_class=
_and_permission_statements.md#common), [`classcommon`](cil_class_and_permis=
sion_statements.md#classcommon) and [`class`](cil_class_and_permission_stat=
ements.md#class) statements:
>
> +```secil
>      (common file (ioctl read write create getattr setattr lock relabelfr=
om relabelto append unlink link rename execute swapon quotaon mounton))
>
>      (classcommon dir file)
>      (class dir (add_name remove_name reparent search rmdir open audit_ac=
cess execmod))
> +```
>
>  will produce a set of permissions for the `dir` class identifier of:
>
> +```secil
>      (class dir (add_name remove_name reparent search rmdir open audit_ac=
cess execmod ioctl read write create getattr setattr lock relabelfrom relab=
elto append unlink link rename execute swapon quotaon mounton))
> +```
>
>  classorder
>  ----------
> @@ -146,7 +166,9 @@ Defines the order of [class](#class)'s. This is a man=
datory statement. Multiple
>
>  **Statement definition:**
>
> +```secil
>      (classorder (class_id ...))
> +```
>
>  **Where:**
>
> @@ -171,11 +193,13 @@ Defines the order of [class](#class)'s. This is a m=
andatory statement. Multiple
>
>  This will produce an ordered list of "`file dir process`"
>
> +```secil
>      (class process)
>      (class file)
>      (class dir)
>      (classorder (file dir))
>      (classorder (dir process))
> +```
>
>  **Unordered Classorder Statement:**
>
> @@ -185,6 +209,7 @@ If users do not have knowledge of the existing [`clas=
sorder`](#classorder), the
>
>  This will produce an unordered list of "`file dir foo a bar baz`"
>
> +```secil
>         (class file)
>         (class dir)
>         (class foo)
> @@ -195,6 +220,7 @@ This will produce an unordered list of "`file dir foo=
 a bar baz`"
>         (classorder (dir foo))
>         (classorder (unordered a))
>         (classorder (unordered bar foo baz))
> +```
>
>  classpermission
>  ---------------
> @@ -203,7 +229,9 @@ Declares a class permission set identifier in the cur=
rent namespace that can be
>
>  **Statement definition:**
>
> +```secil
>      (classpermission classpermissionset_id)
> +```
>
>  **Where:**
>
> @@ -235,7 +263,9 @@ Defines a class permission set identifier in the curr=
ent namespace that associat
>
>  **Statement definition:**
>
> +```secil
>      (classpermissionset classpermissionset_id (class_id (permission_id |=
 expr ...)))
> +```
>
>  **Where:**
>
> @@ -278,6 +308,7 @@ Defines a class permission set identifier in the curr=
ent namespace that associat
>
>  These class permission set statements will resolve to the permission set=
s shown in the kernel policy language [`allow`](cil_access_vector_rules.md#=
allow) rules:
>
> +```secil
>      (class zygote (specifyids specifyrlimits specifycapabilities specify=
invokewith specifyseinfo))
>
>      (type test_1)
> @@ -322,6 +353,7 @@ These class permission set statements will resolve to=
 the permission sets shown
>      (classpermissionset zygote_all_perms (zygote (all)))
>      (allow unconfined.process test_5 zygote_all_perms)
>      ;; allow unconfined.process test_5 : zygote { specifyids specifyrlim=
its specifycapabilities specifyinvokewith specifyseinfo } ;
> +```
>
>  classmap
>  --------
> @@ -346,7 +378,9 @@ Declares a class map identifier in the current namesp=
ace and one or more class m
>
>  **Statement definition:**
>
> +```secil
>      (classmap classmap_id (classmapping_id ...))
> +```
>
>  **Where:**
>
> @@ -382,7 +416,9 @@ Define sets of [`classpermissionset`](cil_class_and_p=
ermission_statements.md#cla
>
>  **Statement definition:**
>
> +```secil
>      (classmapping classmap_id classmapping_id classpermissionset_id)
> +```
>
>  **Where:**
>
> @@ -415,6 +451,7 @@ Define sets of [`classpermissionset`](cil_class_and_p=
ermission_statements.md#cla
>
>  These class mapping statements will resolve to the permission sets shown=
 in the kernel policy language [`allow`](cil_access_vector_rules.md#allow) =
rules:
>
> +```secil
>      (class binder (impersonate call set_context_mgr transfer receive))
>      (class property_service (set))
>      (class zygote (specifyids specifyrlimits specifycapabilities specify=
invokewith specifyseinfo))
> @@ -454,6 +491,7 @@ These class mapping statements will resolve to the pe=
rmission sets shown in the
>
>      ;; allow map_example.type_3 map_example.type_3 : binder { impersonat=
e call set_context_mgr } ;
>      ;; allow map_example.type_3 map_example.type_3 : zygote { specifyrli=
mits specifycapabilities specifyinvokewith specifyseinfo } ;
> +```
>
>  permissionx
>  -----------
> @@ -462,7 +500,9 @@ Defines a named extended permission, which can be use=
d in the [`allowx`](cil_acc
>
>  **Statement definition:**
>
> +```secil
>      (permissionx permissionx_id (kind class_id (permission ... | expr ..=
.)))
> +```
>
>  **Where:**
>
> @@ -517,6 +557,8 @@ Defines a named extended permission, which can be use=
d in the [`allowx`](cil_acc
>
>  **Examples:**
>
> +```secil
>      (permissionx ioctl_1 (ioctl tcp_socket (0x2000 0x3000 0x4000)))
>      (permissionx ioctl_2 (ioctl tcp_socket (range 0x6000 0x60FF)))
>      (permissionx ioctl_3 (ioctl tcp_socket (and (range 0x8000 0x90FF) (n=
ot (range 0x8100 0x82FF)))))
> +```
> diff --git a/secilc/docs/cil_conditional_statements.md b/secilc/docs/cil_=
conditional_statements.md
> index f30d2cce..a55a9b6c 100644
> --- a/secilc/docs/cil_conditional_statements.md
> +++ b/secilc/docs/cil_conditional_statements.md
> @@ -8,7 +8,9 @@ Declares a run time boolean as true or false in the curre=
nt namespace. The [`boo
>
>  **Statement definition:**
>
> +```secil
>      (boolean boolean_id true|false)
> +```
>
>  **Where:**
>
> @@ -46,7 +48,8 @@ Contains the run time conditional statements that are i=
nstantiated in the binary
>
>  **Statement definition:**
>
> -    (booleanif boolean_id | expr ...)
> +```secil
> +    (booleanif boolean_id | expr ...
>          (true
>              cil_statements
>              ...)
> @@ -54,6 +57,7 @@ Contains the run time conditional statements that are i=
nstantiated in the binary
>              cil_statements
>              ...)
>      )
> +```
>
>  **Where:**
>
> @@ -96,6 +100,7 @@ Contains the run time conditional statements that are =
instantiated in the binary
>
>  The second example also shows the kernel policy language equivalent:
>
> +```secil
>      (boolean disableAudio false)
>
>      (booleanif disableAudio
> @@ -112,6 +117,7 @@ The second example also shows the kernel policy langu=
age equivalent:
>              (allow process mediaserver.audio_capture_device (chr_file_se=
t (rw_file_perms)))
>          )
>      )
> +```
>
>  tunable
>  -------
> @@ -122,7 +128,9 @@ Note that tunables can be treated as booleans by the =
CIL compiler command line p
>
>  **Statement definition:**
>
> +```secil
>      (tunable tunable_id true|false)
> +```
>
>  **Where:**
>
> @@ -158,7 +166,8 @@ Compile time conditional statement that may or may no=
t add CIL statements to be
>
>  **Statement definition:**
>
> -    (tunableif tunable_id | expr ...)
> +```secil
> +    (tunableif tunable_id | expr ...
>          (true
>              cil_statements
>              ...)
> @@ -166,6 +175,7 @@ Compile time conditional statement that may or may no=
t add CIL statements to be
>              cil_statements
>              ...)
>      )
> +```
>
>  **Where:**
>
> @@ -208,6 +218,7 @@ Compile time conditional statement that may or may no=
t add CIL statements to be
>
>  This example will not add the range transition rule to the binary policy=
:
>
> +```secil
>      (tunable range_trans_rule false)
>
>      (block init
> @@ -220,3 +231,4 @@ This example will not add the range transition rule t=
o the binary policy:
>              )
>          ) ; End tunableif
>      ) ; End block
> +```
> diff --git a/secilc/docs/cil_constraint_statements.md b/secilc/docs/cil_c=
onstraint_statements.md
> index df03ae6b..2dd6e6f0 100644
> --- a/secilc/docs/cil_constraint_statements.md
> +++ b/secilc/docs/cil_constraint_statements.md
> @@ -8,7 +8,9 @@ Enable constraints to be placed on the specified permissi=
ons of the object class
>
>  **Statement definition:**
>
> +```secil
>      (constrain classpermissionset_id ... expression | expr ...)
> +```
>
>  **Where:**
>
> @@ -62,6 +64,7 @@ Enable constraints to be placed on the specified permis=
sions of the object class
>
>  Two constrain statements are shown with their equivalent kernel policy l=
anguage statements:
>
> +```secil
>      ;; constrain { file } { write }
>      ;;    (( t1 =3D=3D unconfined.process  ) and ( t2 =3D=3D unconfined.=
object  ) or ( r1 eq r2 ));
>      (constrain (file (write))
> @@ -87,6 +90,7 @@ Two constrain statements are shown with their equivalen=
t kernel policy language
>              )
>          )
>      )
> +```
>
>  validatetrans
>  -------------
> @@ -95,7 +99,9 @@ The [`validatetrans`](cil_constraint_statements.md#vali=
datetrans) statement is o
>
>  **Statement definition:**
>
> +```secil
>      (validatetrans class_id expression | expr ...)
> +```
>
>  **Where:**
>
> @@ -153,9 +159,11 @@ The [`validatetrans`](cil_constraint_statements.md#v=
alidatetrans) statement is o
>
>  A validate transition statement with the equivalent kernel policy langua=
ge statement:
>
> +```secil
>      ; validatetrans { file } ( t1 =3D=3D unconfined.process  );
>
>      (validatetrans file (eq t1 unconfined.process))
> +```
>
>  mlsconstrain
>  ------------
> @@ -164,7 +172,9 @@ Enable MLS constraints to be placed on the specified =
permissions of the object c
>
>  **Statement definition:**
>
> +```secil
>      (mlsconstrain classpermissionset_id ... expression | expr ...)
> +```
>
>  **Where:**
>
> @@ -224,6 +234,7 @@ Enable MLS constraints to be placed on the specified =
permissions of the object c
>
>  An MLS constrain statement with the equivalent kernel policy language st=
atement:
>
> +```secil
>      ;; mlsconstrain { file } { open }
>      ;;     (( l1 eq l2 ) and ( u1 =3D=3D u2 ) or ( r1 !=3D r2 ));
>
> @@ -236,6 +247,7 @@ An MLS constrain statement with the equivalent kernel=
 policy language statement:
>              (neq r1 r2)
>          )
>      )
> +```
>
>  mlsvalidatetrans
>  ----------------
> @@ -244,7 +256,9 @@ The [`mlsvalidatetrans`](cil_constraint_statements.md=
#mlsvalidatetrans) statemen
>
>  **Statement definition:**
>
> +```secil
>      (mlsvalidatetrans class_id expression | expr ...)
> +```
>
>  **Where:**
>
> @@ -308,6 +322,8 @@ The [`mlsvalidatetrans`](cil_constraint_statements.md=
#mlsvalidatetrans) statemen
>
>  An MLS validate transition statement with the equivalent kernel policy l=
anguage statement:
>
> +```secil
>      ;; mlsvalidatetrans { file } ( l1 domby h2 );
>
>      (mlsvalidatetrans file (domby l1 h2))
> +```
> diff --git a/secilc/docs/cil_container_statements.md b/secilc/docs/cil_co=
ntainer_statements.md
> index 58b3224d..76e9da51 100644
> --- a/secilc/docs/cil_container_statements.md
> +++ b/secilc/docs/cil_container_statements.md
> @@ -8,10 +8,12 @@ Start a new namespace where any CIL statement is valid.
>
>  **Statement definition:**
>
> +```secil
>      (block block_id
>          cil_statement
>          ...
>      )
> +```
>
>  **Where:**
>
> @@ -47,11 +49,13 @@ Declares the namespace as a 'template' and does not g=
enerate code until instanti
>
>  **Statement definition:**
>
> +```secil
>      (block block_id
>          (blockabstract template_id)
>          cil_statement
>          ...
>      )
> +```
>
>  **Where:**
>
> @@ -95,11 +99,13 @@ Used to add common policy rules to the current namesp=
ace via a template that has
>
>  **Statement definition:**
>
> +```secil
>      (block block_id
>          (blockinherit template_id)
>          cil_statement
>          ...
>      )
> +```
>
>  **Where:**
>
> @@ -136,6 +142,7 @@ Used to add common policy rules to the current namesp=
ace via a template that has
>
>  This example contains a template `client_server` that is instantiated in=
 two blocks (`netserver_app` and `netclient_app`):
>
> +```secil
>      ; This is the template block:
>      (block client_server
>          (blockabstract client_server)
> @@ -187,6 +194,7 @@ This example contains a template `client_server` that=
 is instantiated in two blo
>      (block ab
>          (blockinherit b)
>          (blockinherit a))
> +```
>
>  optional
>  --------
> @@ -203,10 +211,12 @@ Declare an [`optional`](cil_container_statements.md=
#optional) namespace. All CIL
>
>  **Statement definition:**
>
> +```secil
>      (optional optional_id
>          cil_statement
>          ...
>      )
> +```
>
>  **Where:**
>
> @@ -235,6 +245,7 @@ Declare an [`optional`](cil_container_statements.md#o=
ptional) namespace. All CIL
>
>  This example will instantiate the optional block `ext_gateway.move_file`=
 into policy providing all optional CIL statements can be resolved:
>
> +```secil
>      (block ext_gateway
>          ......
>          (optional move_file
> @@ -250,6 +261,7 @@ This example will instantiate the optional block `ext=
_gateway.move_file` into po
>
>          .....
>      ) ; End block
> +```
>
>  in
>  --
> @@ -258,10 +270,12 @@ Allows the insertion of CIL statements into a named=
 container ([`block`](cil_con
>
>  **Statement definition:**
>
> +```secil
>      (in container_id
>          cil_statement
>          ...
>      )
> +```
>
>  **Where:**
>
> @@ -290,7 +304,9 @@ Allows the insertion of CIL statements into a named c=
ontainer ([`block`](cil_con
>
>  This will add rules to the container named `system_server`:
>
> +```secil
>      (in system_server
>          (dontaudit process secmark_demo.dns_packet (packet (send recv)))
>          (allow process secmark_demo.dns_packet (packet (send recv)))
>      )
> +```
> diff --git a/secilc/docs/cil_context_statement.md b/secilc/docs/cil_conte=
xt_statement.md
> index 60812751..caa7ff6b 100644
> --- a/secilc/docs/cil_context_statement.md
> +++ b/secilc/docs/cil_context_statement.md
> @@ -16,7 +16,9 @@ Declare an SELinux security context identifier for labe=
ling. The range (or curre
>
>  **Statement definition:**
>
> +```secil
>      (context context_id (user_id role_id type_id levelrange_id)))
> +```
>
>  **Where:**
>
> @@ -57,21 +59,29 @@ Declare an SELinux security context identifier for la=
beling. The range (or curre
>
>  This example uses a named context definition:
>
> +```secil
>      (context runas_exec_context (u object_r exec low_low))
>
>      (filecon "/system/bin/run-as" file runas_exec_context)
> +```
>
>  to resolve/build a `file_contexts` entry of (assuming MLS enabled policy=
):
>
> +```
>      /system/bin/run-as  -- u:object_r:runas.exec:s0-s0
> +```
>
>  This example uses an anonymous context where the previously declared `us=
er role type levelrange` identifiers are used to specify two [`portcon`](ci=
l_network_labeling_statements.md#portcon) statements:
>
> +```secil
>      (portcon udp 1024 (test.user object_r test.process ((s0) (s1))))
>      (portcon tcp 1024 (test.user object_r test.process (system_low syste=
m_high)))
> +```
>
>  This example uses an anonymous context for the first and named context f=
or the second in a [`netifcon`](cil_network_labeling_statements.md#netifcon=
) statement:
>
> +```secil
>      (context netif_context (test.user object_r test.process ((s0 (c0)) (=
s1 (c0)))))
>
>      (netifcon eth04 (test.user object_r test.process ((s0 (c0)) (s1 (c0)=
))) netif_context)
> +```
> diff --git a/secilc/docs/cil_file_labeling_statements.md b/secilc/docs/ci=
l_file_labeling_statements.md
> index 3175ebca..ed7b7bf9 100644
> --- a/secilc/docs/cil_file_labeling_statements.md
> +++ b/secilc/docs/cil_file_labeling_statements.md
> @@ -8,7 +8,9 @@ Define entries for labeling files. The compiler will prod=
uce these entries in a
>
>  **Statement definition:**
>
> +```secil
>      (filecon "path" file_type context_id)
> +```
>
>  **Where:**
>
> @@ -89,17 +91,21 @@ Define entries for labeling files. The compiler will =
produce these entries in a
>
>  These examples use one named, one anonymous and one empty context defini=
tion:
>
> +```secil
>      (context runas_exec_context (u object_r exec low_low))
>
>      (filecon "/system/bin/run-as" file runas_exec_context)
>      (filecon "/dev/socket/wpa_wlan[0-9]" any u:object_r:wpa.socket:s0-s0=
)
>      (filecon "/data/local/mine" dir ())
> +```
>
>  to resolve/build `file_contexts` entries of (assuming MLS enabled policy=
):
>
> +```
>      /system/bin/run-as  -- u:object_r:runas.exec:s0
>      /dev/socket/wpa_wlan[0-9]   u:object_r:wpa.socket:s0
>      /data/local/mine -d <<none>>
> +```
>
>  fsuse
>  -----
> @@ -108,7 +114,9 @@ Label filesystems that support SELinux security conte=
xts.
>
>  **Statement definition:**
>
> +```secil
>      (fsuse fstype fsname context_id)
> +```
>
>  **Where:**
>
> @@ -147,6 +155,7 @@ Label filesystems that support SELinux security conte=
xts.
>
>  The [context](#context) identifiers are declared in the `file` namespace=
 and the [`fsuse`](cil_file_labeling_statements.md#fsuse) statements in the=
 global namespace:
>
> +```secil
>      (block file
>          (type labeledfs)
>          (roletype object_r labeledfs)
> @@ -166,6 +175,7 @@ The [context](#context) identifiers are declared in t=
he `file` namespace and the
>
>      (fsuse trans devpts file.devpts_context)
>      (fsuse trans tmpfs file.tmpfs_context)
> +```
>
>  genfscon
>  --------
> @@ -174,7 +184,9 @@ Used to allocate a security context to filesystems th=
at cannot support any of th
>
>  **Statement definition:**
>
> +```secil
>      (genfscon fsname path context_id)
> +```
>
>  **Where:**
>
> @@ -207,6 +219,7 @@ Used to allocate a security context to filesystems th=
at cannot support any of th
>
>  The [context](#context) identifiers are declared in the `file` namespace=
 and the [`genfscon`](cil_file_labeling_statements.md#genfscon) statements =
are then inserted using the [`in`](cil_container_statements.md#in) containe=
r statement:
>
> +```secil
>      (file
>          (type rootfs)
>          (roletype object_r rootfs)
> @@ -226,3 +239,4 @@ The [context](#context) identifiers are declared in t=
he `file` namespace and the
>          (genfscon proc /sysrq-trigger sysrq_proc_context)
>          (genfscon selinuxfs / selinuxfs_context)
>      )
> +```
> diff --git a/secilc/docs/cil_infiniband_statements.md b/secilc/docs/cil_i=
nfiniband_statements.md
> index ba1d7101..0ba167cf 100644
> --- a/secilc/docs/cil_infiniband_statements.md
> +++ b/secilc/docs/cil_infiniband_statements.md
> @@ -10,7 +10,9 @@ Label IB partition keys. This may be a single key or a =
range.
>
>  **Statement definition:**
>
> +```secil
>      (ibpkeycon subnet pkey|(pkey_low pkey_high)  context_id)
> +```
>
>  **Where:**
>
> @@ -43,8 +45,9 @@ Label IB partition keys. This may be a single key or a =
range.
>
>  An anonymous context for a partition key range of `0x0-0x10` assigned to=
 an IPv6 subnet:
>
> +```secil
>      (ibpkeycon fe80:: (0 0x10) (system_u system_r kernel_t (low (s3 (cat=
s01 cats02)))))
> -
> +```
>
>  ibendportcon
>  ------------
> @@ -53,7 +56,9 @@ Label IB end ports.
>
>  **Statement definition:**
>
> +```secil
>      (ibendportcon device_id port context_id)
> +```
>
>  **Where:**
>
> @@ -86,4 +91,6 @@ Label IB end ports.
>
>  A named context for device `mlx5_0` on port `1`:
>
> +```secil
>      (ibendportcon mlx5_0 1 system_u_bin_t_l2h)
> +```
> diff --git a/secilc/docs/cil_mls_labeling_statements.md b/secilc/docs/cil=
_mls_labeling_statements.md
> index 9b3a36a5..1b9c53c5 100644
> --- a/secilc/docs/cil_mls_labeling_statements.md
> +++ b/secilc/docs/cil_mls_labeling_statements.md
> @@ -10,7 +10,9 @@ Declare a sensitivity identifier in the current namespa=
ce. Multiple [`sensitivit
>
>  **Statement definition:**
>
> +```secil
>      (sensitivity sensitivity_id)
> +```
>
>  **Where:**
>
> @@ -35,9 +37,11 @@ Declare a sensitivity identifier in the current namesp=
ace. Multiple [`sensitivit
>
>  This example declares three [`sensitivity`](cil_mls_labeling_statements.=
md#sensitivity) identifiers:
>
> +```secil
>      (sensitivity s0)
>      (sensitivity s1)
>      (sensitivity s2)
> +```
>
>  sensitivityalias
>  ----------------
> @@ -46,7 +50,9 @@ Declares a sensitivity alias identifier in the current =
namespace. See the [`sens
>
>  **Statement definition:**
>
> +```secil
>      (sensitivityalias sensitivityalias_id)
> +```
>
>  **Where:**
>
> @@ -78,7 +84,9 @@ Associates a previously declared [`sensitivityalias`](c=
il_mls_labeling_statement
>
>  **Statement definition:**
>
> +```secil
>      (sensitivityaliasactual sensitivityalias_id sensitivity_id)
> +```
>
>  **Where:**
>
> @@ -107,11 +115,13 @@ Associates a previously declared [`sensitivityalias=
`](cil_mls_labeling_statement
>
>  This example will associate sensitivity `s0` with two sensitivity alias'=
s:
>
> +```secil
>      (sensitivity s0)
>      (sensitivityalias unclassified)
>      (sensitivityalias SystemLow)
>      (sensitivityaliasactual unclassified s0)
>      (sensitivityaliasactual SystemLow s0)
> +```
>
>  sensitivityorder
>  ----------------
> @@ -120,7 +130,9 @@ Define the sensitivity order - lowest to highest. Mul=
tiple [`sensitivityorder`](
>
>  **Statement definition:**
>
> +```secil
>      (sensitivityorder (sensitivity_id ...))
> +```
>
>  **Where:**
>
> @@ -145,6 +157,7 @@ Define the sensitivity order - lowest to highest. Mul=
tiple [`sensitivityorder`](
>
>  This example shows two [`sensitivityorder`](cil_mls_labeling_statements.=
md#sensitivityorder) statements that when compiled will form an ordered lis=
t. Note however that the second [`sensitivityorder`](cil_mls_labeling_state=
ments.md#sensitivityorder) statement starts with `s2` so that the ordered l=
ist can be built.
>
> +```secil
>      (sensitivity s0)
>      (sensitivityalias s0 SystemLow)
>      (sensitivity s1)
> @@ -155,6 +168,7 @@ This example shows two [`sensitivityorder`](cil_mls_l=
abeling_statements.md#sensi
>      (sensitivity s4)
>      (sensitivityalias s4 SystemHigh)
>      (sensitivityorder (s2 s3 SystemHigh))
> +```
>
>  category
>  --------
> @@ -163,7 +177,9 @@ Declare a category identifier in the current namespac=
e. Multiple category statem
>
>  **Statement definition:**
>
> +```secil
>      (category category_id)
> +```
>
>  **Where:**
>
> @@ -188,9 +204,11 @@ Declare a category identifier in the current namespa=
ce. Multiple category statem
>
>  This example declares a three [`category`](cil_mls_labeling_statements.m=
d#category) identifiers:
>
> +```secil
>      (category c0)
>      (category c1)
>      (category c2)
> +```
>
>  categoryalias
>  -------------
> @@ -199,7 +217,9 @@ Declares a category alias identifier in the current n=
amespace. See the [`categor
>
>  **Statement definition:**
>
> +```secil
>      (categoryalias categoryalias_id)
> +```
>
>  **Where:**
>
> @@ -227,7 +247,9 @@ Associates a previously declared [`categoryalias`](ci=
l_mls_labeling_statements.m
>
>  **Statement definition:**
>
> +```secil
>      (categoryaliasactual categoryalias_id category_id)
> +```
>
>  **Where:**
>
> @@ -256,9 +278,11 @@ Associates a previously declared [`categoryalias`](c=
il_mls_labeling_statements.m
>
>  Declares a category `c0`, a category alias of `documents`, and then asso=
ciates them:
>
> +```secil
>      (category c0)
>      (categoryalias documents)
>      (categoryaliasactual documents c0)
> +```
>
>  categoryorder
>  -------------
> @@ -267,7 +291,9 @@ Define the category order. Multiple [`categoryorder`]=
(cil_mls_labeling_statement
>
>  **Statement definition:**
>
> +```secil
>      (categoryorder (category_id ...))
> +```
>
>  **Where:**
>
> @@ -292,7 +318,9 @@ Define the category order. Multiple [`categoryorder`]=
(cil_mls_labeling_statement
>
>  This example orders one category alias and nine categories:
>
> +```secil
>      (categoryorder (documents c1 c2 c3 c4 c5 c6 c7 c8 c9)
> +```
>
>  categoryset
>  -----------
> @@ -307,7 +335,9 @@ Notes:
>
>  **Statement definition:**
>
> +```secil
>      (categoryset categoryset_id (category_id ... | expr ...))
> +```
>
>  **Where:**
>
> @@ -347,6 +377,7 @@ Notes:
>
>  These examples show a selection of [`categoryset`](cil_mls_labeling_stat=
ements.md#categoryset) statements:
>
> +```secil
>      ; Declare categories with two alias's:
>      (category c0)
>      (categoryalias documents)
> @@ -372,6 +403,7 @@ These examples show a selection of [`categoryset`](ci=
l_mls_labeling_statements.m
>      (categoryset catset_3 (c4))
>
>      (categoryset just_c0 (xor (c1 c2) (documents c1 c2)))
> +```
>
>  sensitivitycategory
>  -------------------
> @@ -380,7 +412,9 @@ Associate a [`sensitivity`](cil_mls_labeling_statemen=
ts.md#sensitivity) identifi
>
>  **Statement definition:**
>
> +```secil
>      (sensitivitycategory sensitivity_id categoryset_id)
> +```
>
>  **Where:**
>
> @@ -409,11 +443,13 @@ Associate a [`sensitivity`](cil_mls_labeling_statem=
ents.md#sensitivity) identifi
>
>  These [`sensitivitycategory`](cil_mls_labeling_statements.md#sensitivity=
category) examples use a selection of [`category`](cil_mls_labeling_stateme=
nts.md#category), [`categoryalias`](cil_mls_labeling_statements.md#category=
alias) and [`categoryset`](cil_mls_labeling_statements.md#categoryset)'s:
>
> +```secil
>      (sensitivitycategory s0 catrange_1)
>      (sensitivitycategory s0 catset_1)
>      (sensitivitycategory s0 catset_3)
>      (sensitivitycategory s0 (all))
>      (sensitivitycategory unclassified (range documents c2))
> +```
>
>  level
>  -----
> @@ -422,7 +458,9 @@ Declare a [`level`](cil_mls_labeling_statements.md#le=
vel) identifier in the curr
>
>  **Statement definition:**
>
> -    level level_id (sensitivity_id [categoryset_id])
> +```secil
> +    (level level_id (sensitivity_id [categoryset_id]))
> +```
>
>  **Where:**
>
> @@ -455,11 +493,13 @@ Declare a [`level`](cil_mls_labeling_statements.md#=
level) identifier in the curr
>
>  These [`level`](cil_mls_labeling_statements.md#level) examples use a sel=
ection of [`category`](cil_mls_labeling_statements.md#category), [`category=
alias`](cil_mls_labeling_statements.md#categoryalias) and [`categoryset`](c=
il_mls_labeling_statements.md#categoryset)'s:
>
> +```secil
>      (level systemLow (s0))
>      (level level_1 (s0))
>      (level level_2 (s0 (catrange_1)))
>      (level level_3 (s0 (all_cats)))
>      (level level_4 (unclassified (c2 c3 c4)))
> +```
>
>  levelrange
>  ----------
> @@ -468,7 +508,9 @@ Declare a level range identifier in the current names=
pace and associate a curren
>
>  **Statement definition:**
>
> +```secil
>      (levelrange levelrange_id (low_level_id high_level_id))
> +```
>
>  **Where:**
>
> @@ -501,6 +543,7 @@ Declare a level range identifier in the current names=
pace and associate a curren
>
>  This example policy shows [`levelrange`](cil_mls_labeling_statements.md#=
levelrange) statement and all the other MLS labeling statements discussed i=
n this section and will compile as a standalone policy:
>
> +```secil
>      (handleunknown allow)
>      (mls true)
>
> @@ -581,6 +624,7 @@ This example policy shows [`levelrange`](cil_mls_labe=
ling_statements.md#levelran
>
>          (context context_1 (user object_r object low_low))
>      ) ; End unconfined namespace
> +```
>
>  rangetransition
>  ---------------
> @@ -589,7 +633,9 @@ Allows an objects level to transition to a different =
level. Generally used to en
>
>  **Statement definition:**
>
> +```secil
>      (rangetransition source_id target_id class_id new_range_id)
> +```
>
>  **Where:**
>
> @@ -626,6 +672,7 @@ Allows an objects level to transition to a different =
level. Generally used to en
>
>  This rule will transition the range of `sshd.exec` to `s0 - s1:c0.c3` on=
 execution from the `init.process`:
>
> +```secil
>      (sensitivity s0)
>      (sensitivity s1)
>      (sensitivityorder s0 s1)
> @@ -636,3 +683,4 @@ This rule will transition the range of `sshd.exec` to=
 `s0 - s1:c0.c3` on executi
>      (levelrange low_high (systemlow systemhigh))
>
>      (rangetransition init.process sshd.exec process low_high)
> +```
> diff --git a/secilc/docs/cil_network_labeling_statements.md b/secilc/docs=
/cil_network_labeling_statements.md
> index 60aec80d..395069cc 100644
> --- a/secilc/docs/cil_network_labeling_statements.md
> +++ b/secilc/docs/cil_network_labeling_statements.md
> @@ -14,7 +14,9 @@ Notes:
>
>  **Statement definition:**
>
> +```secil
>      (ipaddr ipaddr_id ip_address)
> +```
>
>  **Where:**
>
> @@ -43,6 +45,7 @@ Notes:
>
>  This example declares a named IP address and also passes an 'explicit an=
onymously declared' IP address to a macro:
>
> +```secil
>      (ipaddr netmask_1 255.255.255.0)
>      (context netlabel_1 (system.user object_r unconfined.object low_low)
>
> @@ -50,6 +53,7 @@ This example declares a named IP address and also passe=
s an 'explicit anonymousl
>
>      (macro build_nodecon ((ipaddr ARG1) (ipaddr ARG2))
>          (nodecon ARG1 ARG2  netlabel_1))
> +```
>
>  netifcon
>  --------
> @@ -58,7 +62,9 @@ Label network interface objects (e.g. `eth0`).
>
>  **Statement definition:**
>
> +```secil
>      (netifcon netif_name netif_context_id packet_context_id)
> +```
>
>  **Where:**
>
> @@ -93,12 +99,14 @@ Label network interface objects (e.g. `eth0`).
>
>  These examples show named and anonymous [`netifcon`](cil_network_labelin=
g_statements.md#netifcon) statements:
>
> +```secil
>      (context context_1 (unconfined.user object_r unconfined.object low_l=
ow))
>      (context context_2 (unconfined.user object_r unconfined.object (syst=
emlow level_2)))
>
>      (netifcon eth0 context_1 (unconfined.user object_r unconfined.object=
 levelrange_1))
>      (netifcon eth1 context_1 (unconfined.user object_r unconfined.object=
 ((s0) level_1)))
>      (netifcon eth3 context_1 context_2)
> +```
>
>  nodecon
>  -------
> @@ -109,7 +117,9 @@ IP Addresses may be declared without a previous decla=
ration by enclosing within
>
>  **Statement definition:**
>
> +```secil
>      (nodecon subnet_id netmask_id context_id)
> +```
>
>  **Where:**
>
> @@ -142,6 +152,7 @@ IP Addresses may be declared without a previous decla=
ration by enclosing within
>
>  These examples show named and anonymous [`nodecon`](cil_network_labeling=
_statements.md#nodecon) statements:
>
> +```secil
>      (context context_1 (unconfined.user object_r unconfined.object low_l=
ow))
>      (context context_2 (unconfined.user object_r unconfined.object (syst=
emlow level_2)))
>
> @@ -160,6 +171,7 @@ These examples show named and anonymous [`nodecon`](c=
il_network_labeling_stateme
>      (nodecon ipv6_2 netmask_2 context_3)
>      (nodecon (2001:db8:1:0:0:0:0:0) (ffff:ffff:ffff:0:0:0:0:0) context_3=
)
>      (nodecon (2001:db8:1:0:0:0:0:0) netmask_2 (sys.id sys.role my48prefi=
x.node ((s0)(s0))))
> +```
>
>  portcon
>  -------
> @@ -168,7 +180,9 @@ Label a udp, tcp, dccp or sctp port.
>
>  **Statement definition:**
>
> +```secil
>      (portcon protocol port|(port_low port_high) context_id)
> +```
>
>  **Where:**
>
> @@ -203,6 +217,7 @@ Label a udp, tcp, dccp or sctp port.
>
>  These examples show named and anonymous [`portcon`](cil_network_labeling=
_statements.md#portcon) statements:
>
> +```secil
>      (portcon tcp 1111 (unconfined.user object_r unconfined.object ((s0) =
(s0 (c0)))))
>      (portcon tcp 2222 (unconfined.user object_r unconfined.object levelr=
ange_2))
>      (portcon tcp 3333 (unconfined.user object_r unconfined.object levelr=
ange_1))
> @@ -210,3 +225,4 @@ These examples show named and anonymous [`portcon`](c=
il_network_labeling_stateme
>      (portcon tcp (2000 20000) (unconfined.user object_r unconfined.objec=
t (systemlow level_3)))
>      (portcon dccp (6840 6880) (unconfined.user object_r unconfined.objec=
t ((s0) level_2)))
>      (portcon sctp (1024 1035) (unconfined.user object_r unconfined.objec=
t ((s0) level_2)))
> +```
> diff --git a/secilc/docs/cil_policy_config_statements.md b/secilc/docs/ci=
l_policy_config_statements.md
> index 48e29d67..0258b913 100644
> --- a/secilc/docs/cil_policy_config_statements.md
> +++ b/secilc/docs/cil_policy_config_statements.md
> @@ -10,7 +10,9 @@ Note that this can be over-ridden by the CIL compiler c=
ommand line parameter `-M
>
>  **Statement definition:**
>
> +```secil
>      (mls boolean)
> +```
>
>  **Where:**
>
> @@ -33,7 +35,9 @@ Note that this can be over-ridden by the CIL compiler c=
ommand line parameter `-M
>
>  **Example:**
>
> +```secil
>      (mls true)
> +```
>
>  handleunknown
>  -------------
> @@ -44,7 +48,9 @@ Note that this can be over-ridden by the CIL compiler c=
ommand line parameter `-U
>
>  **Statement definition:**
>
> +```secil
>      (handleunknown action)
> +```
>
>  **Where:**
>
> @@ -72,7 +78,9 @@ Note that this can be over-ridden by the CIL compiler c=
ommand line parameter `-U
>
>  This will allow unknown classes / permissions to be present in the polic=
y:
>
> +```secil
>      (handleunknown allow)
> +```
>
>  policycap
>  ---------
> @@ -81,7 +89,9 @@ Allow policy capabilities to be enabled via policy. The=
se should be declared in
>
>  **Statement definition:**
>
> +```secil
>      (policycap policycap_id)
> +```
>
>  **Where:**
>
> @@ -106,8 +116,10 @@ Allow policy capabilities to be enabled via policy. =
These should be declared in
>
>  These set two valid policy capabilities:
>
> +```secil
>      ; Enable networking controls.
>      (policycap network_peer_controls)
>
>      ; Enable open permission check.
>      (policycap open_perms)
> +```
> diff --git a/secilc/docs/cil_reference_guide.md b/secilc/docs/cil_referen=
ce_guide.md
> index 3e33c5f7..c08ad114 100644
> --- a/secilc/docs/cil_reference_guide.md
> +++ b/secilc/docs/cil_reference_guide.md
> @@ -57,10 +57,12 @@ Declarations may be named or anonymous and have three=
 different forms:
>      ipaddr
>      macro
>      policycap
> +
>  2.  Explicit anonymous declarations - These are currently restricted to =
IP addresses where they can be declared directly in statements by enclosing=
 them within parentheses e.g. `(127.0.0.1)` or `(::1)`. See the [Network La=
beling Statements](#network_labeling) section for examples.
>
>  3.  Anonymous declarations - These have been previously declared and the=
 object already exists, therefore they may be referenced by their name or i=
dentifier within statements. For example the following declare all the comp=
onents required to specify a context:
>
> +    ```secil
>          (sensitivity s0)
>          (category c0)
>          (role object_r)
> @@ -69,10 +71,13 @@ Declarations may be named or anonymous and have three=
 different forms:
>              (user user)
>              (type object)
>          )
> +    ```
>
>      now a [`portcon`](cil_network_labeling_statements.md#portcon) statem=
ent can be defined that uses these individual components to build a context=
 as follows:
>
> +    ```secil
>          (portcon udp 12345 (unconfined.user object_r unconfined.object (=
(s0) (s0(c0)))))
> +    ```
>
>  Definitions
>  -----------
> @@ -113,6 +118,7 @@ Namespaces
>
>  CIL supports namespaces via containers such as the [`block`](cil_contain=
er_statements.md#block) statement. When a block is resolved to form the par=
ent / child relationship a dot '`.`' is used, for example the following [`a=
llow`](cil_access_vector_rules.md#allow) rule:
>
> +```secil
>      (block example_ns
>          (type process)
>          (type object)
> @@ -120,16 +126,20 @@ CIL supports namespaces via containers such as the =
[`block`](cil_container_state
>
>          (allow process object (file (open read getattr)))
>      )
> +```
>
>  will resolve to the following kernel policy language statement:
>
> +```
>      allow example_ns.process example_ns.object : example_ns.file { open =
read getattr };
> +```
>
>  Global Namespace
>  ----------------
>
>  CIL has a global namespace that is always present. Any symbol that is de=
clared outside a container is in the global namespace. To reference a symbo=
l in global namespace, the symbol should be prefixed with a dot '`.`' as sh=
own in the following example:
>
> +```secil
>      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
>      ; This example has three namespace 'tmpfs' types declared:
>      ;    1) Global .tmpfs
> @@ -170,6 +180,7 @@ CIL has a global namespace that is always present. An=
y symbol that is declared o
>      (block other_ns
>          (type tmpfs)
>      )
> +```
>
>  Should the symbol not be prefixed with a dot, the current namespace woul=
d be searched first and then the global namespace (provided there is not a =
symbol of that name in the current namespace).
>
> @@ -204,6 +215,7 @@ The number of `expr_set`'s in an `expr` is dependent =
on the statement type (ther
>
>      This example includes all `fs_type type` entries except `file.usermo=
dehelper` and `file.proc_security` in the associated [`typeattribute`](cil_=
type_statements.md#typeattribute) identifier `all_fs_type_except_usermodehe=
lper_and_proc_security`:
>
> +    ```secil
>          (typeattribute all_fs_type_except_usermodehelper_and_proc_securi=
ty)
>
>          (typeattributeset all_fs_type_except_usermodehelper_and_proc_sec=
urity
> @@ -215,17 +227,21 @@ The number of `expr_set`'s in an `expr` is dependen=
t on the statement type (ther
>                  (not file.proc_security)
>              )
>          )
> +    ```
>
>      The `cps_1 classpermissionset` identifier includes all permissions e=
xcept `load_policy` and `setenforce`:
>
> +    ```secil
>          (class security (compute_av compute_create compute_member check_=
context load_policy compute_relabel compute_user setenforce setbool setsecp=
aram setcheckreqprot read_policy))
>
>          (classpermission cps_1)
>
>          (classpermissionset cps_1 (security (not (load_policy setenforce=
))))
> +    ```
>
>      This example includes all permissions in the associated [`classpermi=
ssionset`](cil_class_and_permission_statements.md#classpermissionset) ident=
ifier `security_all_perms`:
>
> +    ```secil
>          (class security (compute_av compute_create compute_member check_=
context load_policy
>              compute_relabel compute_user setenforce setbool setsecparam =
setcheckreqprot
>              read_policy)
> @@ -234,6 +250,7 @@ The number of `expr_set`'s in an `expr` is dependent =
on the statement type (ther
>          (classpermission security_all_perms)
>
>          (classpermissionset security_all_perms (security (all)))
> +    ```
>
>  2.  The [`categoryset`](cil_mls_labeling_statements.md#categoryset) stat=
ement allows `expr_set` to mix names and `expr_key` values of: `and`, `or`,=
 `not`, `xor`, `all`, `range` as shown in the examples.
>
> @@ -241,6 +258,7 @@ The number of `expr_set`'s in an `expr` is dependent =
on the statement type (ther
>
>  3.  The [`booleanif`](cil_conditional_statements.md#booleanif) and [`tun=
ableif`](cil_conditional_statements.md#tunableif) statements only allow an =
`expr_set` to have one `name` or `expr` with `expr_key` values of `and`, `o=
r`, `xor`, `not`, `eq`, `neq` as shown in the examples:
>
> +    ```secil
>          (booleanif disableAudio
>              (false
>                  (allow process device.audio_device (chr_file_set (rw_fil=
e_perms)))
> @@ -252,9 +270,11 @@ The number of `expr_set`'s in an `expr` is dependent=
 on the statement type (ther
>                  (allow process device.audio_capture_device (chr_file_set=
 (rw_file_perms)))
>              )
>          )
> +    ```
>
>  4.  The [`constrain`](cil_constraint_statements.md#constrain), [`mlscons=
train`](cil_constraint_statements.md#mlsconstrain), [`validatetrans`](cil_c=
onstraint_statements.md#validatetrans) and [`mlsvalidatetrans`](cil_constra=
int_statements.md#mlsvalidatetrans) statements only allow an `expr_set` to =
have one `name` or `expr` with `expr_key` values of `and`, `or`, `not`, `al=
l`, `eq`, `neq`, `dom`, `domby`, `incomp`. When `expr_key` is `dom`, `domby=
` or `incomp`, it must be followed by a string (e.g. `h1`, `l2`) and anothe=
r string or a set of `name`s. The following examples show CIL constraint st=
atements and their policy language equivalents:
>
> +    ```secil
>          ; Process transition:  Require equivalence unless the subject is=
 trusted.
>          (mlsconstrain (process (transition dyntransition))
>              (or (and (eq h1 h2) (eq l1 l2)) (eq t1 mlstrustedsubject)))
> @@ -270,29 +290,36 @@ The number of `expr_set`'s in an `expr` is dependen=
t on the statement type (ther
>          ; The equivalent policy language mlsconstrain statememt is:
>          ;mlsconstrain process { getsched getsession getpgid getcap getat=
tr ptrace share }
>          ;    (l1 dom l2 or t1 =3D=3D mlstrustedsubject);
> +    ```
>
>  Name String
>  -----------
>
>  Used to define [`macro`](cil_call_macro_statements.md#macro) statement p=
arameter string types:
>
> +```secil
>      (call macro1("__kmsg__"))
>
>      (macro macro1 ((string ARG1))
>          (typetransition audit.process device.device chr_file ARG1 device=
.klog_device)
>      )
> +```
>
>  Alternatively:
>
> +```secil
>      (call macro1("__kmsg__"))
>
>      (macro macro1 ((name ARG1))
>          (typetransition audit.process device.device chr_file ARG1 device=
.klog_device)
>      )
> +```
>
>  self
>  ----
>
>  The [`self`](cil_reference_guide.md#self) keyword may be used as the tar=
get in AVC rule statements, and means that the target is the same as the so=
urce as shown in the following example:.
>
> +```secil
>      (allow unconfined.process self (file (read write)))
> +```
> diff --git a/secilc/docs/cil_role_statements.md b/secilc/docs/cil_role_st=
atements.md
> index c1e457a7..ee6a5868 100644
> --- a/secilc/docs/cil_role_statements.md
> +++ b/secilc/docs/cil_role_statements.md
> @@ -8,7 +8,9 @@ Declares a role identifier in the current namespace.
>
>  **Statement definition:**
>
> +```secil
>      (role role_id)
> +```
>
>  **Where:**
>
> @@ -33,11 +35,13 @@ Declares a role identifier in the current namespace.
>
>  This example declares two roles: `object_r` in the global namespace and =
`unconfined.role`:
>
> +```secil
>      (role object_r)
>
>      (block unconfined
>          (role role)
>      )
> +```
>
>  roletype
>  --------
> @@ -46,7 +50,9 @@ Authorises a [`role`](cil_role_statements.md#role) to a=
ccess a [`type`](cil_type
>
>  **Statement definition:**
>
> +```secil
>      (role role_id type_id)
> +```
>
>  **Where:**
>
> @@ -75,11 +81,13 @@ Authorises a [`role`](cil_role_statements.md#role) to=
 access a [`type`](cil_type
>
>  This example will declare [`role`](cil_role_statements.md#role) and [`ty=
pe`](cil_type_statements.md#type) identifiers, then associate them:
>
> +```secil
>      (block unconfined
>          (role role)
>          (type process)
>          (roletype role process)
>      )
> +```
>
>  roleattribute
>  -------------
> @@ -88,7 +96,9 @@ Declares a role attribute identifier in the current nam=
espace. The identifier ma
>
>  **Statement definition:**
>
> +```secil
>      (roleattribute roleattribute_id)
> +```
>
>  **Where:**
>
> @@ -113,9 +123,11 @@ Declares a role attribute identifier in the current =
namespace. The identifier ma
>
>  This example will declare a role attribute `roles.role_holder` that will=
 have an empty set:
>
> +```secil
>      (block roles
>          (roleattribute role_holder)
>      )
> +```
>
>  roleattributeset
>  ----------------
> @@ -124,7 +136,9 @@ Allows the association of one or more previously decl=
ared [`role`](cil_role_stat
>
>  **Statement definition:**
>
> +```secil
>      (roleattributeset roleattribute_id (role_id ... | expr ...))
> +```
>
>  **Where:**
>
> @@ -163,6 +177,7 @@ Allows the association of one or more previously decl=
ared [`role`](cil_role_stat
>
>  This example will declare three roles and two role attributes, then asso=
ciate all the roles to them as shown:
>
> +```secil
>      (block roles
>          (role role_1)
>          (role role_2)
> @@ -174,6 +189,7 @@ This example will declare three roles and two role at=
tributes, then associate al
>          (roleattribute role_holder_all)
>          (roleattributeset role_holder_all (all))
>      )
> +```
>
>  roleallow
>  ---------
> @@ -188,7 +204,9 @@ Notes:
>
>  **Statement definition:**
>
> +```secil
>      (roleallow current_role_id new_role_id)
> +```
>
>  **Where:**
>
> @@ -224,7 +242,9 @@ Specify a role transition from the current role to a =
new role when computing a c
>
>  **Statement definition:**
>
> +```secil
>      (roletransition current_role_id target_type_id class_id new_role_id)
> +```
>
>  **Where:**
>
> @@ -261,6 +281,7 @@ Specify a role transition from the current role to a =
new role when computing a c
>
>  This example will authorise the `unconfined.role` to assume the `msg_fil=
ter.role` role, and then transition to that role:
>
> +```secil
>      (block ext_gateway
>          (type process)
>          (type exec)
> @@ -269,6 +290,7 @@ This example will authorise the `unconfined.role` to =
assume the `msg_filter.role
>          (roleallow unconfined.role msg_filter.role)
>          (roletransition unconfined.role exec process msg_filter.role)
>      )
> +```
>
>  rolebounds
>  ----------
> @@ -283,7 +305,9 @@ Notes:
>
>  **Statement definition:**
>
> +```secil
>      (rolebounds parent_role_id child_role_id)
> +```
>
>  **Where:**
>
> @@ -312,9 +336,11 @@ Notes:
>
>  In this example the role `test` cannot have greater privileges than `unc=
onfined.role`:
>
> +```secil
>      (role test)
>
>      (unconfined
>          (role role)
>          (rolebounds role .test)
>      )
> +```
> diff --git a/secilc/docs/cil_sid_statements.md b/secilc/docs/cil_sid_stat=
ements.md
> index a9b25373..a5d21013 100644
> --- a/secilc/docs/cil_sid_statements.md
> +++ b/secilc/docs/cil_sid_statements.md
> @@ -8,7 +8,9 @@ Declares a new SID identifier in the current namespace.
>
>  **Statement definition:**
>
> +```secil
>      (sid sid_id)
> +```
>
>  **Where:**
>
> @@ -33,9 +35,11 @@ Declares a new SID identifier in the current namespace=
.
>
>  These examples show three [`sid`](cil_sid_statements.md#sid) declaration=
s:
>
> +```secil
>      (sid kernel)
>      (sid security)
>      (sid igmp_packet)
> +```
>
>  sidorder
>  --------
> @@ -44,7 +48,9 @@ Defines the order of [sid](#sid)'s. This is a mandatory=
 statement when SIDs are
>
>  **Statement definition:**
>
> +```secil
>      (sidorder (sid_id ...))
> +```
>
>  **Where:**
>
> @@ -69,11 +75,13 @@ Defines the order of [sid](#sid)'s. This is a mandato=
ry statement when SIDs are
>
>  This will produce an ordered list of "`kernel security unlabeled`"
>
> +```secil
>      (sid kernel)
>      (sid security)
>      (sid unlabeled)
>      (sidorder (kernel security))
>      (sidorder (security unlabeled))
> +```
>
>  sidcontext
>  ----------
> @@ -82,7 +90,9 @@ Associates an SELinux security [context](#context) to a=
 previously declared [`si
>
>  **Statement definition:**
>
> +```secil
>      (sidcontext sid_id context_id)
> +```
>
>  **Where:**
>
> @@ -111,6 +121,7 @@ Associates an SELinux security [context](#context) to=
 a previously declared [`si
>
>  This shows two named security context examples plus an anonymous context=
:
>
> +```secil
>      ; Two named context:
>      (sid kernel)
>      (context kernel_context (u r process low_low))
> @@ -123,3 +134,4 @@ This shows two named security context examples plus a=
n anonymous context:
>      ; An anonymous context:
>      (sid unlabeled)
>      (sidcontext unlabeled (u object_r ((s0) (s0))))
> +```
> diff --git a/secilc/docs/cil_type_statements.md b/secilc/docs/cil_type_st=
atements.md
> index 432cede5..19438417 100644
> --- a/secilc/docs/cil_type_statements.md
> +++ b/secilc/docs/cil_type_statements.md
> @@ -8,7 +8,9 @@ Declares a type identifier in the current namespace.
>
>  **Statement definition:**
>
> +```secil
>      (type type_id)
> +```
>
>  **Where:**
>
> @@ -33,9 +35,11 @@ Declares a type identifier in the current namespace.
>
>  This example declares a type identifier `bluetooth.process`:
>
> +```secil
>      (block bluetooth
>          (type process)
>      )
> +```
>
>  typealias
>  ---------
> @@ -44,7 +48,9 @@ Declares a type alias in the current namespace.
>
>  **Statement definition:**
>
> +```secil
>      (typealias typealias_id)
> +```
>
>  **Where:**
>
> @@ -76,7 +82,9 @@ Associates a previously declared [`typealias`](cil_type=
_statements.md#typealias)
>
>  **Statement definition:**
>
> +```secil
>      (typealiasactual typealias_id type_id)
> +```
>
>  **Where:**
>
> @@ -105,12 +113,14 @@ Associates a previously declared [`typealias`](cil_=
type_statements.md#typealias)
>
>  This example will alias `unconfined.process` as `unconfined_t` in the gl=
obal namespace:
>
> +```secil
>      (typealias unconfined_t)
>      (typealiasactual unconfined_t unconfined.process)
>
>      (block unconfined
>          (type process)
>      )
> +```
>
>  typeattribute
>  -------------
> @@ -119,7 +129,9 @@ Declares a type attribute identifier in the current n=
amespace. The identifier ma
>
>  **Statement definition:**
>
> +```secil
>      (typeattribute typeattribute_id)
> +```
>
>  **Where:**
>
> @@ -144,7 +156,9 @@ Declares a type attribute identifier in the current n=
amespace. The identifier ma
>
>  This example declares a type attribute `domain` in global namespace that=
 will have an empty set:
>
> +```secil
>      (typeattribute domain)
> +```
>
>  typeattributeset
>  ----------------
> @@ -153,7 +167,9 @@ Allows the association of one or more previously decl=
ared [`type`](cil_type_stat
>
>  **Statement definition:**
>
> +```secil
>      (typeattributeset typeattribute_id (type_id ... | expr ...))
> +```
>
>  **Where:**
>
> @@ -192,12 +208,15 @@ Allows the association of one or more previously de=
clared [`type`](cil_type_stat
>
>  This example will take all the policy types and exclude those in `appdom=
ain`. It is equivalent to `~appdomain` in the kernel policy language.
>
> +```secil
>      (typeattribute not_in_appdomain)
>
>      (typeattributeset not_in_appdomain (not (appdomain)))
> +```
>
>  This example is equivalent to `{ domain -kernel.process -ueventd.process=
 -init.process }` in the kernel policy language:
>
> +```secil
>      (typeattribute na_kernel_or_ueventd_or_init_in_domain)
>
>      (typeattributeset na_kernel_or_ueventd_or_init_in_domain
> @@ -212,6 +231,7 @@ This example is equivalent to `{ domain -kernel.proce=
ss -ueventd.process -init.p
>              (not (init.process))
>          )
>      )
> +```
>
>  expandtypeattribute
>  -------------------
> @@ -229,7 +249,9 @@ option cause the rules involving the type attribute t=
o be expanded.
>
>  **Statement definition:**
>
> +```secil
>      (expandtypeattribute typeattribute_id expand_value)
> +```
>
>  **Where:**
>
> @@ -258,11 +280,15 @@ option cause the rules involving the type attribute=
 to be expanded.
>
>  This example uses the expandtypeattribute statement to forcibly expand a=
 previously declared `domain` type attribute.
>
> +```secil
>      (expandtypeattribute domain true)
> +```
>
>  This example uses the expandtypeattribute statement to not expand previo=
usly declared `file_type` and `port_type` type attributes regardless of com=
piler defaults.
>
> +```secil
>      (expandtypeattribute (file_type port_type) false)
> +```
>
>  typebounds
>  ----------
> @@ -273,7 +299,9 @@ Requires kernel 2.6.28 and above to control the secur=
ity context associated to t
>
>  **Statement definition:**
>
> +```secil
>      (typebounds parent_type_id child_type_id)
> +```
>
>  **Where:**
>
> @@ -302,6 +330,7 @@ Requires kernel 2.6.28 and above to control the secur=
ity context associated to t
>
>  In this example the `httpd.child.process` cannot have `file (write)` due=
 to lack of permissions on `httpd.process` which is the parent. It means th=
e child domain will always have equal or less privileges than the parent:
>
> +```secil
>      (class file (getattr read write))
>
>      (block httpd
> @@ -320,6 +349,7 @@ In this example the `httpd.child.process` cannot have=
 `file (write)` due to lack
>              (allow process httpd.object (file (read write)))
>          )
>      )
> +```
>
>  typechange
>  ----------
> @@ -328,7 +358,9 @@ The type change rule is used to define a different la=
bel of an object for usersp
>
>  **Statement definition:**
>
> +```secil
>      (typechange source_type_id target_type_id class_id change_type_id)
> +```
>
>  **Where:**
>
> @@ -371,6 +403,7 @@ the function will return a context of:
>
>  `    unconfined.object:object_r:unconfined.change_label:s0`
>
> +```secil
>      (class file (getattr read write))
>
>      (block unconfined
> @@ -380,6 +413,7 @@ the function will return a context of:
>
>          (typechange object object file change_label)
>      )
> +```
>
>  typemember
>  ----------
> @@ -388,7 +422,9 @@ The type member rule is used to define a new polyinst=
antiated label of an object
>
>  **Statement definition:**
>
> +```secil
>      (typemember source_type_id target_type_id class_id member_type_id)
> +```
>
>  **Where:**
>
> @@ -431,6 +467,7 @@ the function will return a context of:
>
>  `    unconfined.object:object_r:unconfined.member_label:s0`
>
> +```secil
>      (class file (getattr read write))
>
>      (block unconfined
> @@ -440,6 +477,7 @@ the function will return a context of:
>
>          (typemember object object file member_label)
>      )
> +```
>
>  typetransition
>  --------------
> @@ -448,7 +486,9 @@ The type transition rule specifies the labeling and o=
bject creation allowed betw
>
>  **Statement definition:**
>
> +```secil
>      (typetransition source_type_id target_type_id class_id [object_name]=
 default_type_id)
> +```
>
>  **Where:**
>
> @@ -489,29 +529,35 @@ The type transition rule specifies the labeling and=
 object creation allowed betw
>
>  This example shows a process transition rule with its supporting [`allow=
`](cil_access_vector_rules.md#allow) rule:
>
> +```secil
>      (macro domain_auto_trans ((type ARG1) (type ARG2) (type ARG3))
>          ; Allow the necessary permissions.
>          (call domain_trans (ARG1 ARG2 ARG3))
>          ; Make the transition occur by default.
>          (typetransition ARG1 ARG2 process ARG3)
>      )
> +```
>
>  This example shows a file object transition rule with its supporting [`a=
llow`](cil_access_vector_rules.md#allow) rule:
>
> +```secil
>      (macro tmpfs_domain ((type ARG1))
>          (type tmpfs)
>          (typeattributeset file_type (tmpfs))
>          (typetransition ARG1 file.tmpfs file tmpfs)
>          (allow ARG1 tmpfs (file (read write execute execmod)))
>      )
> +```
>
>  This example shows the 'name transition' rule with its supporting [`allo=
w`](cil_access_vector_rules.md#allow) rule:
>
> +```secil
>      (macro write_klog ((type ARG1))
>          (typetransition ARG1 device.device chr_file "__kmsg__" device.kl=
og_device)
>          (allow ARG1 device.klog_device (chr_file (create open write unli=
nk)))
>          (allow ARG1 device.device (dir (write add_name remove_name)))
>      )
> +```
>
>  typepermissive
>  --------------
> @@ -520,7 +566,9 @@ Policy database version 23 introduced the permissive =
statement to allow the name
>
>  **Statement definition:**
>
> +```secil
>      (typepermissive source_type_id)
> +```
>
>  **Where:**
>
> @@ -545,9 +593,11 @@ Policy database version 23 introduced the permissive=
 statement to allow the name
>
>  This example will allow SELinux to run the `healthd.process` domain in p=
ermissive mode even when enforcing is enabled:
>
> +```secil
>      (block healthd
>          (type process)
>          (typepermissive process)
>
>          (allow ...)
>      )
> +```
> diff --git a/secilc/docs/cil_user_statements.md b/secilc/docs/cil_user_st=
atements.md
> index 26e45510..d5674f12 100644
> --- a/secilc/docs/cil_user_statements.md
> +++ b/secilc/docs/cil_user_statements.md
> @@ -8,7 +8,9 @@ Declares an SELinux user identifier in the current namesp=
ace.
>
>  **Statement definition:**
>
> +```secil
>      (user user_id)
> +```
>
>  **Where:**
>
> @@ -33,9 +35,11 @@ Declares an SELinux user identifier in the current nam=
espace.
>
>  This will declare an SELinux user as `unconfined.user`:
>
> +```secil
>      (block unconfined
>          (user user)
>      )
> +```
>
>  userrole
>  --------
> @@ -44,7 +48,9 @@ Associates a previously declared [`user`](cil_user_stat=
ements.md#user) identifie
>
>  **Statement definition:**
>
> +```secil
>      (userrole user_id role_id)
> +```
>
>  **Where:**
>
> @@ -73,11 +79,13 @@ Associates a previously declared [`user`](cil_user_st=
atements.md#user) identifie
>
>  This example will associate `unconfined.user` to `unconfined.role`:
>
> +```secil
>      (block unconfined
>          (user user)
>          (role role)
>          (userrole user role)
>      )
> +```
>
>  userattribute
>  -------------
> @@ -86,7 +94,9 @@ Declares a user attribute identifier in the current nam=
espace. The identifier ma
>
>  **Statement definition:**
>
> +```secil
>      (userattribute userattribute_id)
> +```
>
>  **Where:**
>
> @@ -111,9 +121,11 @@ Declares a user attribute identifier in the current =
namespace. The identifier ma
>
>  This example will declare a user attribute `users.user_holder` that will=
 have an empty set:
>
> +```secil
>      (block users
>          (userattribute user_holder)
>      )
> +```
>
>  userattributeset
>  ----------------
> @@ -122,7 +134,9 @@ Allows the association of one or more previously decl=
ared [`user`](cil_user_stat
>
>  **Statement definition:**
>
> +```secil
>      (userattributeset userattribute_id (user_id ... | expr ...))
> +```
>
>  **Where:**
>
> @@ -161,6 +175,7 @@ Allows the association of one or more previously decl=
ared [`user`](cil_user_stat
>
>  This example will declare three users and two user attributes, then asso=
ciate all the users to them as shown:
>
> +```secil
>      (block users
>          (user user_1)
>          (user user_2)
> @@ -172,6 +187,7 @@ This example will declare three users and two user at=
tributes, then associate al
>          (userattribute user_holder_all)
>          (userattributeset user_holder_all (all))
>      )
> +```
>
>  userlevel
>  ---------
> @@ -180,7 +196,9 @@ Associates a previously declared [`user`](cil_user_st=
atements.md#user) identifie
>
>  **Statement definition:**
>
> +```secil
>      (userlevel user_id level_id)
> +```
>
>  **Where:**
>
> @@ -209,6 +227,7 @@ Associates a previously declared [`user`](cil_user_st=
atements.md#user) identifie
>
>  This example will associate `unconfined.user` with a named [`level`](cil=
_mls_labeling_statements.md#level) of `systemlow`:
>
> +```secil
>      (sensitivity s0)
>      (level systemlow (s0))
>
> @@ -218,6 +237,7 @@ This example will associate `unconfined.user` with a =
named [`level`](cil_mls_lab
>          ; An anonymous example:
>          ;(userlevel user (s0))
>      )
> +```
>
>  userrange
>  ---------
> @@ -226,7 +246,9 @@ Associates a previously declared [`user`](cil_user_st=
atements.md#user) identifie
>
>  **Statement definition:**
>
> +```secil
>      (userrange user_id levelrange_id)
> +```
>
>  **Where:**
>
> @@ -255,6 +277,7 @@ Associates a previously declared [`user`](cil_user_st=
atements.md#user) identifie
>
>  This example will associate `unconfined.user` with a named [`levelrange`=
](cil_mls_labeling_statements.md#levelrange) of `low_high`, other anonymous=
 examples are also shown:
>
> +```secil
>      (category c0)
>      (category c1)
>      (categoryorder (c0 c1))
> @@ -277,6 +300,7 @@ This example will associate `unconfined.user` with a =
named [`levelrange`](cil_ml
>          ;(userrange user (systemLow (s0 (c0 c1))))
>          ;(userrange user ((s0) (s0 (c0 c1))))
>      )
> +```
>
>  userbounds
>  ----------
> @@ -291,7 +315,9 @@ Notes:
>
>  **Statement definition:**
>
> +```secil
>      (userbounds parent_user_id child_user_id)
> +```
>
>  **Where:**
>
> @@ -320,12 +346,14 @@ Notes:
>
>  The user `test` cannot have greater privileges than `unconfined.user`:
>
> +```secil
>      (user test)
>
>      (unconfined
>          (user user)
>          (userbounds user .test)
>      )
> +```
>
>  userprefix
>  ----------
> @@ -334,7 +362,9 @@ Declare a user prefix that will be replaced by the fi=
le labeling utilities descr
>
>  **Statement definition:**
>
> +```secil
>      (userprefix user_id prefix)
> +```
>
>  **Where:**
>
> @@ -363,10 +393,12 @@ Declare a user prefix that will be replaced by the =
file labeling utilities descr
>
>  This example will associate `unconfined.admin` user with a prefix of "[`=
user`](cil_user_statements.md#user)":
>
> +```secil
>      (block unconfined
> -        (user admin
> +        (user admin)
>          (userprefix admin user)
>      )
> +```
>
>  selinuxuser
>  -----------
> @@ -375,7 +407,9 @@ Associates a GNU/Linux user to a previously declared =
[`user`](cil_user_statement
>
>  **Statement definition:**
>
> +```secil
>      (selinuxuser user_name user_id userrange_id)
> +```
>
>  **Where:**
>
> @@ -408,10 +442,12 @@ Associates a GNU/Linux user to a previously declare=
d [`user`](cil_user_statement
>
>  This example will associate `unconfined.admin` user with a GNU / Linux u=
ser "`admin_1`":
>
> +```secil
>      (block unconfined
>          (user admin)
>          (selinuxuser admin_1 admin low_low)
>      )
> +```
>
>  selinuxuserdefault
>  ------------------
> @@ -420,7 +456,9 @@ Declares the default SELinux user. Only one [`selinux=
userdefault`](cil_user_stat
>
>  **Statement definition:**
>
> +```secil
>      (selinuxuserdefault user_id userrange_id)
> +```
>
>  **Where:**
>
> @@ -449,7 +487,9 @@ Declares the default SELinux user. Only one [`selinux=
userdefault`](cil_user_stat
>
>  This example will define the `unconfined.user` as the default SELinux us=
er:
>
> +```secil
>      (block unconfined
>          (user user)
>          (selinuxuserdefault user low_low)
>      )
> +```
> diff --git a/secilc/docs/cil_xen_statements.md b/secilc/docs/cil_xen_stat=
ements.md
> index 5ae03e6e..3cfc5dd2 100644
> --- a/secilc/docs/cil_xen_statements.md
> +++ b/secilc/docs/cil_xen_statements.md
> @@ -12,7 +12,9 @@ Label i/o memory. This may be a single memory location =
or a range.
>
>  **Statement definition:**
>
> +```secil
>      (iomemcon mem_addr|(mem_low mem_high) context_id)
> +```
>
>  **Where:**
>
> @@ -43,7 +45,9 @@ Label i/o memory. This may be a single memory location =
or a range.
>
>  An anonymous context for a memory address range of `0xfebe0-0xfebff`:
>
> +```secil
>      (iomemcon (1043424 1043455) (unconfined.user object_r unconfined.obj=
ect low_low))
> +```
>
>  ioportcon
>  ---------
> @@ -52,7 +56,9 @@ Label i/o ports. This may be a single port or a range.
>
>  **Statement definition:**
>
> +```secil
>      (ioportcon port|(port_low port_high) context_id)
> +```
>
>  **Where:**
>
> @@ -83,7 +89,9 @@ Label i/o ports. This may be a single port or a range.
>
>  An anonymous context for a single port of :`0xecc0`:
>
> +```secil
>      (ioportcon 60608 (unconfined.user object_r unconfined.object low_low=
))
> +```
>
>  pcidevicecon
>  ------------
> @@ -92,7 +100,9 @@ Label a PCI device.
>
>  **Statement definition:**
>
> +```secil
>      (pcidevicecon device context_id)
> +```
>
>  **Where:**
>
> @@ -121,7 +131,9 @@ Label a PCI device.
>
>  An anonymous context for a pci device address of `0xc800`:
>
> +```secil
>      (pcidevicecon 51200 (unconfined.user object_r unconfined.object low_=
low))
> +```
>
>  pirqcon
>  -------
> @@ -130,7 +142,9 @@ Label an interrupt level.
>
>  **Statement definition:**
>
> +```secil
>      (pirqcon irq_level context_id)
> +```
>
>  **Where:**
>
> @@ -159,7 +173,9 @@ Label an interrupt level.
>
>  An anonymous context for IRQ 33:
>
> +```secil
>      (pirqcon 33 (unconfined.user object_r unconfined.object low_low))
> +```
>
>  devicetreecon
>  -------------
> @@ -168,7 +184,9 @@ Label device tree nodes.
>
>  **Statement definition:**
>
> +```secil
>      (devicetreecon path context_id)
> +```
>
>  **Where:**
>
> @@ -197,4 +215,6 @@ Label device tree nodes.
>
>  An anonymous context for the specified path:
>
> +```secil
>      (devicetreecon "/this is/a/path" (unconfined.user object_r unconfine=
d.object low_low))
> +```
> --
> 2.30.0
>
