Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 337C36F5EBE
	for <lists+selinux@lfdr.de>; Wed,  3 May 2023 21:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjECTAQ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 3 May 2023 15:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbjECTAO (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 3 May 2023 15:00:14 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B6B7D8E
        for <selinux@vger.kernel.org>; Wed,  3 May 2023 12:00:07 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4effb818c37so6377513e87.3
        for <selinux@vger.kernel.org>; Wed, 03 May 2023 12:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683140406; x=1685732406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoDmgVtjzgPmUvZFVI7q8N3nbC0wrKThwmoskHFlnUU=;
        b=YVoxWmGBInvnrLLUqiT/eVyImu2zLh8vIE63gteS6PpPGr5CJdXm/9ItrqKUJGDDEA
         HZexXj38jSNcfTCaDe9EHI6pzHJgs26QbtS4GkG3J9BwRabLR9Cr39eQ/A0Dbv7d9SFQ
         e0JBg9xshDCyZDkMi4KR2lDJcBtsQ4CcZktNGD8cr2UiAK4cju41gE+e8oX8Q9c4TDEz
         lQ28vrwQ8qowfeadG/tVlS3yjdLNeEGpXJxz9CM9ei53i7m3WkaAZdDXrGiiF8a1DVut
         2Myg04SHt7dh6YwOxECXuLsTl91b4B9qxtV09rV7bxL6ixgOZUwPPLK+UBWekBvCFszu
         8fSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683140406; x=1685732406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoDmgVtjzgPmUvZFVI7q8N3nbC0wrKThwmoskHFlnUU=;
        b=b4sy0s9xHFPGLrb1QGRSXgkffJNtU9vISHNznCU1vpgCeL915X97HkX3Jvp/877Yai
         RGiDwu/E6fvx/rsbZXekh1kcLJZULRswmY4kPXVkDQ7GFn5FvsQYmtwOnik0KCUnVx69
         C8OVFPci0GWTM8j70t8qZUmbURN/v5wz5vQML84+8C2Vh8bnQPCnnSe2+wJou3REnepO
         3fvtsLI9QrL1QvPIctYue2ecIxyh5ACyKDaquMw+hd+6PLyVHFkDuyKSk6RA4P2wIrxC
         rF57kj0cwBlEh6QW1+tfxUVifi6Mivae8/tI1/hTsSQifiOZFYHT58FQ7LciE5Eu1d6v
         lCfg==
X-Gm-Message-State: AC+VfDw4KrPRg7gBprQqJkslRf1YK8m/EzW5PWwBJjaxjIMoUZxnQRDy
        sprWB2ghPRIimgX3Tp1X0MZEyi2PeWmKvKjMd/UlvaYA
X-Google-Smtp-Source: ACHHUZ5pqThCcSDWAaTxDl+OVO4J45qIPZ7H/RUsGnCImcYexyj+VYG4FLSM+8sfhq9i8g2KXLoe003jFUpcp23pfgc=
X-Received: by 2002:ac2:5291:0:b0:4f0:81c:73e5 with SMTP id
 q17-20020ac25291000000b004f0081c73e5mr1028852lfm.40.1683140405346; Wed, 03
 May 2023 12:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230503120332.699464-1-vmojzis@redhat.com> <20230503120332.699464-4-vmojzis@redhat.com>
In-Reply-To: <20230503120332.699464-4-vmojzis@redhat.com>
From:   James Carter <jwcart2@gmail.com>
Date:   Wed, 3 May 2023 14:59:53 -0400
Message-ID: <CAP+JOzQBSknYVqAqhu6WGwnTDBCXc-P1B73+MnfbcEyGi621CA@mail.gmail.com>
Subject: Re: [PATCH 3/3] python/semanage: Improve man pages
To:     Vit Mojzis <vmojzis@redhat.com>
Cc:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, May 3, 2023 at 8:11=E2=80=AFAM Vit Mojzis <vmojzis@redhat.com> wrot=
e:
>
> - Add missing options
> - Add more examples
> - Note special cases
> ---
>  python/semanage/semanage-boolean.8    |  9 ++++++---
>  python/semanage/semanage-dontaudit.8  |  8 +++++---
>  python/semanage/semanage-export.8     | 10 +++++++++-
>  python/semanage/semanage-fcontext.8   | 15 ++++++++++-----
>  python/semanage/semanage-ibendport.8  |  6 ++++--
>  python/semanage/semanage-ibpkey.8     |  6 ++++--
>  python/semanage/semanage-import.8     | 10 +++++++++-
>  python/semanage/semanage-interface.8  |  8 ++++++--
>  python/semanage/semanage-login.8      | 14 ++++++++------
>  python/semanage/semanage-module.8     | 15 ++++++++++-----
>  python/semanage/semanage-node.8       | 16 +++++++++++++---
>  python/semanage/semanage-permissive.8 |  8 +++++---
>  python/semanage/semanage-port.8       | 10 ++++++----
>  python/semanage/semanage-user.8       |  8 +++++---
>  14 files changed, 100 insertions(+), 43 deletions(-)
>
> diff --git a/python/semanage/semanage-boolean.8 b/python/semanage/semanag=
e-boolean.8
> index 1282d106..3b664023 100644
> --- a/python/semanage/semanage-boolean.8
> +++ b/python/semanage/semanage-boolean.8
> @@ -7,11 +7,14 @@ semanage\-boolean \- SELinux Policy Management boolean =
tool
>  .SH "DESCRIPTION"
>  semanage is used to configure certain elements of
>  SELinux policy without requiring modification to or recompilation
> -from policy sources.  semanage boolean command controls the settings of =
booleans in SELinux policy.  booleans are if\-then\-else rules written in S=
ELinux Policy.  They can be used to customize the way that SELinux Policy r=
ules effect a confined domain.
> +from policy sources.
> +.B semanage boolean
> +command controls the settings of booleans in SELinux policy. Booleans ar=
e if\-then\-else rules written in SELinux Policy. They can be used to custo=
mize the way that SELinux Policy rules effect a confined domain.
> +
>  .SH "OPTIONS"
>  .TP
>  .I  \-h, \-\-help
> -show this help message and exit
> +Show this help message and exit
>  .TP
>  .I \-n, \-\-noheading
>  Do not print heading when listing the specified object type
> @@ -45,7 +48,7 @@ Disable the boolean
>
>  .SH EXAMPLE
>  .nf
> -Turn on the apache can send mail boolean
> +Turn on the "apache can send mail" boolean (persistent version of #setse=
bool httpd_can_sendmail on)
>  # semanage boolean \-m \-\-on httpd_can_sendmail
>
>  List customized booleans
> diff --git a/python/semanage/semanage-dontaudit.8 b/python/semanage/seman=
age-dontaudit.8
> index 81accc6f..51d1f4b6 100644
> --- a/python/semanage/semanage-dontaudit.8
> +++ b/python/semanage/semanage-dontaudit.8
> @@ -7,13 +7,15 @@
>  .SH "DESCRIPTION"
>  semanage is used to configure certain elements of
>  SELinux policy without requiring modification to or recompilation
> -from policy sources.  semanage dontaudit toggles whether or not dontaudi=
t rules will be in the policy.  Policy writers use dontaudit rules to cause
> -confined applications to use alternative paths.  Dontaudit rules are den=
ied but not reported in the logs.  Some times dontaudit rules can cause bug=
s in applications but policy writers will not realize it since the AVC is n=
ot audited.  Turning off dontaudit rules with this command to see if the ke=
rnel is blocking an access.
> +from policy sources.
> +.B semanage dontaudit
> +toggles whether or not dontaudit rules will be in the policy. Policy wri=
ters use dontaudit rules to cause
> +confined applications to use alternative paths. Dontaudit rules are deni=
ed but not reported in the logs. Sometimes dontaudit rules can cause bugs i=
n applications but policy writers will not realize it since the AVC is not =
audited. Turn off dontaudit rules with this command to see if the kernel is=
 blocking an access.
>
>  .SH "OPTIONS"
>  .TP
>  .I   \-h, \-\-help
> -show this help message and exit
> +Show this help message and exit
>  .TP
>  .I   \-S STORE, \-\-store STORE
>  Select an alternate SELinux Policy Store to manage
> diff --git a/python/semanage/semanage-export.8 b/python/semanage/semanage=
-export.8
> index d422683b..b25b186d 100644
> --- a/python/semanage/semanage-export.8
> +++ b/python/semanage/semanage-export.8
> @@ -7,7 +7,15 @@
>  .SH "DESCRIPTION"
>  semanage is used to configure certain elements of
>  SELinux policy without requiring modification to or recompilation
> -from policy sources.  semanage import and export can be used to extract =
the SELinux modifications from one machine and apply them to another. You c=
an put a whole group of semanage commands within a file and apply them to a=
 machine in a single transaction.
> +from policy sources.
> +.B semanage import
> +and
> +.B export
> +can be used to extract the SELinux modifications from one machine and ap=
ply them to another. Please note that this will remove all current semanage=
 customisations on the second machine as the command list generated using

In the USA we spell it "customization" rather than "customisation".

> +.B semanage export
> +start with
> +.I <command> -D
> +for all semanage sub-commands. You can put a whole group of semanage com=
mands within a file and apply them to a machine in a single transaction.
>
>  .SH "OPTIONS"
>  .TP
> diff --git a/python/semanage/semanage-fcontext.8 b/python/semanage/semana=
ge-fcontext.8
> index 1ebf085f..4339aec9 100644
> --- a/python/semanage/semanage-fcontext.8
> +++ b/python/semanage/semanage-fcontext.8
> @@ -8,8 +8,10 @@ semanage\-fcontext \- SELinux Policy Management file con=
text tool
>  .SH "DESCRIPTION"
>  semanage is used to configure certain elements of
>  SELinux policy without requiring modification to or recompilation
> -from policy sources.  semanage fcontext is used to  manage the default
> -file system labeling on an SELinux system.  This command maps file paths=
 using regular expressions to SELinux labels.
> +from policy sources.
> +.B semanage fcontext
> +is used to manage the default file system labeling on an SELinux system.
> +This command maps file paths using regular expressions to SELinux labels=
.
>
>  FILE_SPEC may contain either a fully qualified path,
>  or a Perl compatible regular expression (PCRE),
> @@ -32,7 +34,7 @@ to avoid unintentionally impacting other parts of the f=
ilesystem.
>  .SH "OPTIONS"
>  .TP
>  .I  \-h, \-\-help
> -show this help message and exit
> +Show this help message and exit
>  .TP
>  .I   \-n, \-\-noheading
>  Do not print heading when listing the specified object type
> @@ -83,11 +85,12 @@ MLS/MCS Security Range (MLS/MCS Systems only) SELinux=
 Range for SELinux login ma
>  .SH EXAMPLE
>  .nf
>  .I remember to run restorecon after you set the file context

Should capitalize Remember as well

> -Add file-context for everything under /web
> +Add file-context httpd_sys_content_t for everything under /web
>  # semanage fcontext \-a \-t httpd_sys_content_t "/web(/.*)?"
>  # restorecon \-R \-v /web
>
>  Substitute /home1 with /home when setting file context
> +i.e. label everything under /home1 the same way /home is labeled
>  # semanage fcontext \-a \-e /home /home1
>  # restorecon \-R \-v /home1
>
> @@ -99,7 +102,9 @@ execute the following commands.
>
>  .SH "SEE ALSO"
>  .BR selinux (8),
> -.BR semanage (8)
> +.BR semanage (8),
> +.BR restorecon (8),
> +.BR selabel_file (5)
>
>  .SH "AUTHOR"
>  This man page was written by Daniel Walsh <dwalsh@redhat.com>
> diff --git a/python/semanage/semanage-ibendport.8 b/python/semanage/seman=
age-ibendport.8
> index 0a29eae1..53fe4ee8 100644
> --- a/python/semanage/semanage-ibendport.8
> +++ b/python/semanage/semanage-ibendport.8
> @@ -5,12 +5,14 @@
>  .B semanage ibendport [\-h] [\-n] [\-N] [\-S STORE] [ \-\-add \-t TYPE \=
-z IBDEV_NAME \-r RANGE port | \-\-delete \-z IBDEV_NAME port | \-\-deletea=
ll  | \-\-extract  | \-\-list [\-C] | \-\-modify \-t TYPE \-z IBDEV_NAME \-=
r RANGE port ]
>
>  .SH "DESCRIPTION"
> -semanage is used to configure certain elements of SELinux policy without=
 requiring modification to or recompilation from policy sources.  semanage =
ibendport controls the ibendport number to ibendport type definitions.
> +semanage is used to configure certain elements of SELinux policy without=
 requiring modification to or recompilation from policy sources.
> +.B semanage ibendport
> +controls the ibendport number to ibendport type definitions.
>
>  .SH "OPTIONS"
>  .TP
>  .I  \-h, \-\-help
> -show this help message and exit
> +Show this help message and exit
>  .TP
>  .I   \-n, \-\-noheading
>  Do not print heading when listing the specified object type
> diff --git a/python/semanage/semanage-ibpkey.8 b/python/semanage/semanage=
-ibpkey.8
> index 51f455ab..6cc5e02f 100644
> --- a/python/semanage/semanage-ibpkey.8
> +++ b/python/semanage/semanage-ibpkey.8
> @@ -5,12 +5,14 @@
>  .B semanage ibpkey [\-h] [\-n] [\-N] [\-S STORE] [ \-\-add \-t TYPE \-x =
SUBNET_PREFIX \-r RANGE ibpkey_name | ibpkey_range | \-\-delete \-x SUBNET_=
PREFIX ibpkey_name | ibpkey_range | \-\-deleteall  | \-\-extract  | \-\-lis=
t [\-C] | \-\-modify \-t TYPE \-x SUBNET_PREFIX \-r RANGE ibpkey_name | ibp=
key_range ]
>
>  .SH "DESCRIPTION"
> -semanage is used to configure certain elements of SELinux policy without=
 requiring modification to or recompilation from policy sources.  semanage =
ibpkey controls the ibpkey number to ibpkey type definitions.
> +semanage is used to configure certain elements of SELinux policy without=
 requiring modification to or recompilation from policy sources.
> +.B semanage ibpkey
> +controls the ibpkey number to ibpkey type definitions.
>
>  .SH "OPTIONS"
>  .TP
>  .I  \-h, \-\-help
> -show this help message and exit
> +Show this help message and exit
>  .TP
>  .I   \-n, \-\-noheading
>  Do not print heading when listing the specified object type
> diff --git a/python/semanage/semanage-import.8 b/python/semanage/semanage=
-import.8
> index 4a9b3e76..47e69b99 100644
> --- a/python/semanage/semanage-import.8
> +++ b/python/semanage/semanage-import.8
> @@ -7,7 +7,15 @@
>  .SH "DESCRIPTION"
>  semanage is used to configure certain elements of
>  SELinux policy without requiring modification to or recompilation
> -from policy sources.  semanage import and export can be used to extract =
the SELinux modifications from one machine and apply them to another. You c=
an put a whole group of semanage commands within a file and apply them to a=
 machine in a single transaction.
> +from policy sources.
> +.B semanage import
> +and
> +.B export
> +can be used to extract the SELinux modifications from one machine and ap=
ply them to another. Please note that this will remove all current semanage=
 customisations on the second machine as the command list generated using

"customizations"

Everything else looks good.
Thanks,
Jim

> +.B semanage export
> +start with
> +.I <command> -D
> +for all semanage sub-commands. You can put a whole group of semanage com=
mands within a file and apply them to a machine in a single transaction.
>
>  .SH "OPTIONS"
>  .TP
> diff --git a/python/semanage/semanage-interface.8 b/python/semanage/seman=
age-interface.8
> index d9d526dc..080db70b 100644
> --- a/python/semanage/semanage-interface.8
> +++ b/python/semanage/semanage-interface.8
> @@ -7,12 +7,14 @@
>  .SH "DESCRIPTION"
>  semanage is used to configure certain elements of
>  SELinux policy without requiring modification to or recompilation
> -from policy sources.  semanage interface controls the labels assigned to=
 network interfaces.
> +from policy sources.
> +.B semanage interface
> +controls the labels assigned to network interfaces.
>
>  .SH "OPTIONS"
>  .TP
>  .I \-h, \-\-help
> -show this help message and exit
> +Show this help message and exit
>  .TP
>  .I  \-n, \-\-noheading
>  Do not print heading when listing the specified object type
> @@ -54,6 +56,8 @@ MLS/MCS Security Range (MLS/MCS Systems only) SELinux R=
ange for SELinux login ma
>  .nf
>  list all interface definitions
>  # semanage interface \-l
> +Assign type netif_t and MLS/MCS range s0:c0.c1023 to interface eth0
> +# semanage interface \-a \-t netif_t \-r s0:c0.c1023 eth0
>
>  .SH "SEE ALSO"
>  .BR selinux (8),
> diff --git a/python/semanage/semanage-login.8 b/python/semanage/semanage-=
login.8
> index f451bdc6..9076a1ed 100644
> --- a/python/semanage/semanage-login.8
> +++ b/python/semanage/semanage-login.8
> @@ -7,12 +7,14 @@
>  .SH "DESCRIPTION"
>  semanage is used to configure certain elements of
>  SELinux policy without requiring modification to or recompilation
> -from policy sources.  semanage login controls the mapping between a Linu=
x User and the SELinux User.  It can be used to turn  on confined users.  F=
or example you could define that a particular user or group of users will l=
ogin to a system as the user_u user.  Prefix the group name with a '%' sign=
 to indicate a group name.
> +from policy sources.
> +.B semanage login
> +controls the mapping between a Linux User and the SELinux User. It can b=
e used to turn on confined users. For example you could define that a parti=
cular user or group of users will login to a system as the user_u user. Pre=
fix the group name with a '%' sign to indicate a group name.
>
>  .SH "OPTIONS"
>  .TP
>  .I  \-h, \-\-help
> -show this help message and exit
> +Show this help message and exit
>  .TP
>  .I  \-n, \-\-noheading
>  Do not print heading when listing the specified object type
> @@ -52,11 +54,11 @@ MLS/MCS Security Range (MLS/MCS Systems only) SELinux=
 Range for SELinux login ma
>
>  .SH EXAMPLE
>  .nf
> -Modify the default user on the system to the guest_u user
> +Set the default SELinux user on the system to guest_u
>  # semanage login \-m \-s guest_u __default__
> -Assign gijoe user on an MLS machine  a range and to the staff_u user
> -# semanage login \-a \-s staff_u \-rSystemLow-Secret gijoe
> -Assign all users in the engineering group to the staff_u user
> +Map user gijoe to SELinux user staff_u and assign MLS range SystemLow\-S=
ecret
> +# semanage login \-a \-s staff_u \-rSystemLow\-Secret gijoe
> +Map all users in the engineering group to SELinux user staff_u
>  # semanage login \-a \-s staff_u %engineering
>
>  .SH "SEE ALSO"
> diff --git a/python/semanage/semanage-module.8 b/python/semanage/semanage=
-module.8
> index e0057167..6913b0cd 100644
> --- a/python/semanage/semanage-module.8
> +++ b/python/semanage/semanage-module.8
> @@ -5,12 +5,14 @@
>  .B semanage module [\-h] [\-n] [\-N] [\-S STORE] (\-a | \-r | \-e | \-d =
| \-\-extract | \-\-list [\-C] | \-\-deleteall) [module_name]
>
>  .SH "DESCRIPTION"
> -semanage is used to configure certain elements of SELinux policy without=
 requiring modification to or recompilation from policy sources.  semanage =
module installs, removes, disables SELinux Policy modules.
> +semanage is used to configure certain elements of SELinux policy without=
 requiring modification to or recompilation from policy sources.
> +.B semanage module
> +installs, removes, disables, or enables SELinux Policy modules.
>
>  .SH "OPTIONS"
>  .TP
>  .I  \-h, \-\-help
> -show this help message and exit
> +Show this help message and exit
>  .TP
>  .I   \-n, \-\-noheading
>  Do not print heading when listing the specified object type
> @@ -22,11 +24,14 @@ Do not reload policy after commit
>  Select an alternate SELinux Policy Store to manage
>  .TP
>  .I   \-a, \-\-add
> -Install specified module
> +Install specified module. Accepts both binary policy files (.pp) and CIL=
 source files
>  .TP
>  .I   \-r, \-\-remove
>  Remove specified module
>  .TP
> +.I   \-D, \-\-deleteall
> +Remove all local customizations related to modules
> +.TP
>  .I   \-d \-\-disable
>  Disable specified module
>  .TP
> @@ -48,8 +53,8 @@ List all modules
>  # semanage module \-l
>  Disable unconfined module
>  # semanage module \-\-disable unconfined
> -Install custom apache policy module
> -# semanage module \-a myapache
> +Install custom apache policy module (same as #semodule -i myapache.pp)
> +# semanage module \-a myapache.pp
>
>  .SH "SEE ALSO"
>  .BR selinux (8),
> diff --git a/python/semanage/semanage-node.8 b/python/semanage/semanage-n=
ode.8
> index a0098221..c78d6c3e 100644
> --- a/python/semanage/semanage-node.8
> +++ b/python/semanage/semanage-node.8
> @@ -7,12 +7,14 @@
>  .SH "DESCRIPTION"
>  semanage is used to configure certain elements of
>  SELinux policy without requiring modification to or recompilation
> -from policy sources.  semanage controls the ipaddress to node type defin=
itions.
> +from policy sources.
> +.B semanage node
> +controls the IP address to node type definitions.
>
>  .SH "OPTIONS"
>  .TP
>  .I \-h, \-\-help
> -show this help message and exit
> +Show this help message and exit
>  .TP
>  .I   \-n, \-\-noheading
>  Do not print heading when listing the specified object type
> @@ -54,5 +56,13 @@ SELinux type for the object
>  MLS/MCS Security Range (MLS/MCS Systems only) SELinux Range for SELinux =
login mapping defaults to the SELinux user record range. SELinux Range for =
SELinux user defaults to s0.
>  .TP
>  .I   \-p PROTO, \-\-proto PROTO
> -
>  Protocol for the specified port (tcp|udp) or internet protocol version f=
or the specified node (ipv4|ipv6).
> +
> +.SH "EXAMPLE"
> +.nf
> +Apply type node_t to ipv4 node 127.0.0.2
> +# semanage node \-a \-t node_t \-p ipv4 \-M 255.255.255.255 127.0.0.2
> +
> +.SH "SEE ALSO"
> +.BR selinux (8),
> +.BR semanage (8)
> diff --git a/python/semanage/semanage-permissive.8 b/python/semanage/sema=
nage-permissive.8
> index 5c3364fa..0414a850 100644
> --- a/python/semanage/semanage-permissive.8
> +++ b/python/semanage/semanage-permissive.8
> @@ -5,12 +5,14 @@
>  .B semanage permissive [\-h] [\-n] [\-N] [\-S STORE] (\-\-add TYPE | \-\=
-delete TYPE | \-\-deleteall | \-\-extract | \-\-list)
>
>  .SH "DESCRIPTION"
> -semanage is used to configure certain elements of SELinux policy without=
 requiring modification to or recompilation from policy sources.  semanage =
permissive adds or removes a SELinux Policy permissive module.
> +semanage is used to configure certain elements of SELinux policy without=
 requiring modification to or recompilation from policy sources.
> +.B semanage permissive
> +adds or removes a SELinux Policy permissive module. Please note that thi=
s command can make any domain permissive, but can only remove the permissiv=
e property from domains where it was added by semanage permissive ("semanag=
e permissive -d" can only be used on types listed as "Customized Permissive=
 Types" by "semanage permissive -l").
>
>  .SH "OPTIONS"
>  .TP
>  .I  \-h, \-\-help
> -show this help message and exit
> +Show this help message and exit
>  .TP
>  .I   \-a, \-\-add
>  Add a record of the specified object type
> @@ -38,7 +40,7 @@ Select an alternate SELinux Policy Store to manage
>
>  .SH EXAMPLE
>  .nf
> -List all permissive modules
> +List all permissive domains ("Builtin Permissive Types" where set by the=
 system policy, or a custom policy module)
>  # semanage permissive \-l
>  Make httpd_t (Web Server) a permissive domain
>  # semanage permissive \-a httpd_t
> diff --git a/python/semanage/semanage-port.8 b/python/semanage/semanage-p=
ort.8
> index 12ec14c2..c6048660 100644
> --- a/python/semanage/semanage-port.8
> +++ b/python/semanage/semanage-port.8
> @@ -5,12 +5,14 @@
>  .B semanage port [\-h] [\-n] [\-N] [\-S STORE] [ \-\-add \-t TYPE \-p PR=
OTOCOL \-r RANGE port_name | port_range | \-\-delete \-p PROTOCOL port_name=
 | port_range | \-\-deleteall  | \-\-extract  | \-\-list [\-C] | \-\-modify=
 \-t TYPE \-p PROTOCOL \-r RANGE port_name | port_range ]
>
>  .SH "DESCRIPTION"
> -semanage is used to configure certain elements of SELinux policy without=
 requiring modification to or recompilation from policy sources.  semanage =
port controls the port number to port type definitions.
> +semanage is used to configure certain elements of SELinux policy without=
 requiring modification to or recompilation from policy sources.
> +.B semanage port
> +controls the port number to port type definitions.
>
>  .SH "OPTIONS"
>  .TP
>  .I  \-h, \-\-help
> -show this help message and exit
> +Show this help message and exit
>  .TP
>  .I   \-n, \-\-noheading
>  Do not print heading when listing the specified object type
> @@ -55,9 +57,9 @@ Protocol for the specified port (tcp|udp|dccp|sctp) or =
internet protocol version
>  .nf
>  List all port definitions
>  # semanage port \-l
> -Allow Apache to listen on tcp port 81
> +Allow Apache to listen on tcp port 81 (i.e. assign tcp port 81 label htt=
p_port_t, which apache is allowed to listen on)
>  # semanage port \-a \-t http_port_t \-p tcp 81
> -Allow sshd to listen on tcp port 8991
> +Allow sshd to listen on tcp port 8991 (i.e. assign tcp port 8991 label s=
sh_port_t, which sshd is allowed to listen on)
>  # semanage port \-a \-t ssh_port_t \-p tcp 8991
>
>  .SH "SEE ALSO"
> diff --git a/python/semanage/semanage-user.8 b/python/semanage/semanage-u=
ser.8
> index 23fec698..50d50bea 100644
> --- a/python/semanage/semanage-user.8
> +++ b/python/semanage/semanage-user.8
> @@ -7,12 +7,14 @@
>  .SH "DESCRIPTION"
>  semanage is used to configure certain elements of
>  SELinux policy without requiring modification to or recompilation
> -from policy sources.  semanage user controls the mapping between an SELi=
nux User and the roles and MLS/MCS levels.
> +from policy sources.
> +.B semanage user
> +controls the mapping between an SELinux User and the roles and MLS/MCS l=
evels.
>
>  .SH "OPTIONS"
>  .TP
>  .I   \-h, \-\-help
> -show this help message and exit
> +Show this help message and exit
>  .TP
>  .I   \-n, \-\-noheading
>  Do not print heading when listing the specified object type
> @@ -59,7 +61,7 @@ List SELinux users
>  # semanage user \-l
>  Modify groups for staff_u user
>  # semanage user \-m \-R "system_r unconfined_r staff_r" staff_u
> -Add level for TopSecret Users
> +Assign user topsecret_u role staff_r and range s0\-TopSecret
>  # semanage user \-a \-R "staff_r" \-rs0\-TopSecret topsecret_u
>
>  .SH "SEE ALSO"
> --
> 2.40.0
>
