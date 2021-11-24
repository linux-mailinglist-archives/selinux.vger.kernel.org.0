Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4CC45CC14
	for <lists+selinux@lfdr.de>; Wed, 24 Nov 2021 19:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242667AbhKXScM (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 24 Nov 2021 13:32:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242028AbhKXScL (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 24 Nov 2021 13:32:11 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E33DAC061574
        for <selinux@vger.kernel.org>; Wed, 24 Nov 2021 10:29:01 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id t19so7160896oij.1
        for <selinux@vger.kernel.org>; Wed, 24 Nov 2021 10:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SNTHmmkO5dMzy+yYmPqkntiPoJr1b5KsjjwBr+6LpMo=;
        b=ZKDCuZhN/HGqD0XZakwTQk165dTkOtRibLvKzCp6QA++5WvT6DcWTZBrZlg63uPtkE
         IIHx8Bqep3p+ZyZT4j8eFYnm6mWwz4GZfbjDvQozomnQOdiYgg7/hT5mXG6171z0agiH
         Y1+Ru14fcUt80bLjnwlNKrnLf2gSxm1RzetH5RNVboMDmzK57SNTayD4IsujLM+/xTbK
         iQ1f9j8RDEU+jFtNCw6u+M5NJZICVcm8WpHlZXdEe0dQ+CZM0u7PH+ITmXuDfdKzuL4k
         qtMLo5a2RFfsbjdb15R8MYsNUT7/ogF2M7F1tRgTpOQ6zo169Y1cJt2DN/na7Ka0sa5j
         qkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SNTHmmkO5dMzy+yYmPqkntiPoJr1b5KsjjwBr+6LpMo=;
        b=aXwNZsma+x3KJXu1C0VhZoVuhHUzmPpjRfUaOk3CdBGmyq56KpT6+dFu5UFUVvWiWw
         /6v7k0+VgQaIdA38XWB8/clzxVqWtFoejP3wUW9OvL4s3tr+NotBhbaqRkP7ae4ZwDXm
         tn/o2ZolbmIt6u4XGqDoztSfju4nvvryVcj+l8xFVaEtWe5yLQIJmBpJaxIl75a1WAd9
         flhfzd30opjNVsKFNP6/9C5Dt8K8fliHI7JcPV5NwYRfry2/J8u1KB+FfLA2Gkx5akei
         2ag2iE8G2WpjL1x53P4qOqAPbimhpVkFG9ayTcYP3vaXKDaf1/d99cBlgbyEZUAU1Xtq
         VAGA==
X-Gm-Message-State: AOAM531wwasiWG9YGs6opvnni/XsQYtAT2bL0mtXCy4IGBFQyNDDrapq
        /HvImvmJV43hXAv2X+8HJrXmYiECS2Dcu8VJNRE=
X-Google-Smtp-Source: ABdhPJz7vJ6VVY1MvPdJjcT6ARkjam77/jWYwyotyd2Ld0wDyNpxrFRPW001EL++eG2JA96COSb8i6Ot0X12y9wQgiQ=
X-Received: by 2002:a05:6808:1311:: with SMTP id y17mr8418155oiv.32.1637778541199;
 Wed, 24 Nov 2021 10:29:01 -0800 (PST)
MIME-Version: 1.0
References: <20211124014332.36128-1-casey@schaufler-ca.com> <20211124014332.36128-15-casey@schaufler-ca.com>
In-Reply-To: <20211124014332.36128-15-casey@schaufler-ca.com>
From:   =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Date:   Wed, 24 Nov 2021 19:28:50 +0100
Message-ID: <CAJ2a_DfytpZRqcbZH=493kY7BQ9qy15F=T-XC=jJ6DMwHNsjLg@mail.gmail.com>
Subject: Re: [PATCH v30 14/28] LSM: Specify which LSM to display
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     casey.schaufler@intel.com, SElinux list <selinux@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, 24 Nov 2021 at 02:59, Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Create a new entry "interface_lsm" in the procfs attr directory for
> controlling which LSM security information is displayed for a
> process. A process can only read or write its own display value.
>
> The name of an active LSM that supplies hooks for
> human readable data may be written to "interface_lsm" to set the
> value. The name of the LSM currently in use can be read from
> "interface_lsm". At this point there can only be one LSM capable
> of display active. A helper function lsm_task_ilsm() is
> provided to get the interface lsm slot for a task_struct.
>
> Setting the "interface_lsm" requires that all security modules using
> setprocattr hooks allow the action. Each security module is
> responsible for defining its policy.
>
> AppArmor hook provided by John Johansen <john.johansen@canonical.com>
> SELinux hook provided by Stephen Smalley <stephen.smalley.work@gmail.com>
>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: John Johansen <john.johansen@canonical.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-api@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> ---
>  .../ABI/testing/procfs-attr-lsm_display       |  22 +++
>  Documentation/security/lsm.rst                |  14 ++
>  fs/proc/base.c                                |   1 +
>  include/linux/security.h                      |  17 ++
>  security/apparmor/include/apparmor.h          |   3 +-
>  security/apparmor/lsm.c                       |  32 ++++
>  security/security.c                           | 166 ++++++++++++++++--
>  security/selinux/hooks.c                      |  11 ++
>  security/selinux/include/classmap.h           |   2 +-
>  security/smack/smack_lsm.c                    |   7 +
>  10 files changed, 256 insertions(+), 19 deletions(-)
>  create mode 100644 Documentation/ABI/testing/procfs-attr-lsm_display
>
> diff --git a/Documentation/ABI/testing/procfs-attr-lsm_display b/Documentation/ABI/testing/procfs-attr-lsm_display
> new file mode 100644
> index 000000000000..0f60005c235c
> --- /dev/null
> +++ b/Documentation/ABI/testing/procfs-attr-lsm_display
> @@ -0,0 +1,22 @@
> +What:          /proc/*/attr/lsm_display
> +Contact:       linux-security-module@vger.kernel.org,
> +Description:   The name of the Linux security module (LSM) that will
> +               provide information in the /proc/*/attr/current,
> +               /proc/*/attr/prev and /proc/*/attr/exec interfaces.
> +               The details of permissions required to read from
> +               this interface are dependent on the LSMs active on the
> +               system.
> +               A process cannot write to this interface unless it
> +               refers to itself.
> +               The other details of permissions required to write to
> +               this interface are dependent on the LSMs active on the
> +               system.
> +               The format of the data used by this interface is a
> +               text string identifying the name of an LSM. The values
> +               accepted are:
> +                       selinux         - the SELinux LSM
> +                       smack           - the Smack LSM
> +                       apparmor        - The AppArmor LSM
> +               By convention the LSM names are lower case and do not
> +               contain special characters.
> +Users:         LSM user-space
> diff --git a/Documentation/security/lsm.rst b/Documentation/security/lsm.rst
> index 6a2a2e973080..b77b4a540391 100644
> --- a/Documentation/security/lsm.rst
> +++ b/Documentation/security/lsm.rst
> @@ -129,3 +129,17 @@ to identify it as the first security module to be registered.
>  The capabilities security module does not use the general security
>  blobs, unlike other modules. The reasons are historical and are
>  based on overhead, complexity and performance concerns.
> +
> +LSM External Interfaces
> +=======================
> +
> +The LSM infrastructure does not generally provide external interfaces.
> +The individual security modules provide what external interfaces they
> +require.
> +
> +The file ``/sys/kernel/security/lsm`` provides a comma
> +separated list of the active security modules.
> +
> +The file ``/proc/pid/attr/interface_lsm`` contains the name of the security
> +module for which the ``/proc/pid/attr/current`` interface will
> +apply. This interface can be written to.
> diff --git a/fs/proc/base.c b/fs/proc/base.c
> index 13eda8de2998..50dbe5612a26 100644
> --- a/fs/proc/base.c
> +++ b/fs/proc/base.c
> @@ -2828,6 +2828,7 @@ static const struct pid_entry attr_dir_stuff[] = {
>         ATTR(NULL, "fscreate",          0666),
>         ATTR(NULL, "keycreate",         0666),
>         ATTR(NULL, "sockcreate",        0666),
> +       ATTR(NULL, "interface_lsm",     0666),
>  #ifdef CONFIG_SECURITY_SMACK
>         DIR("smack",                    0555,
>             proc_smack_attr_dir_inode_ops, proc_smack_attr_dir_ops),
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 5271b2f4dfca..1b82590a6a59 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -219,6 +219,23 @@ static inline u32 lsmblob_value(const struct lsmblob *blob)
>         return 0;
>  }
>
> +/**
> + * lsm_task_ilsm - the "interface_lsm" for this task
> + * @task: The task to report on
> + *
> + * Returns the task's interface LSM slot.
> + */
> +static inline int lsm_task_ilsm(struct task_struct *task)
> +{
> +#ifdef CONFIG_SECURITY
> +       int *ilsm = task->security;
> +
> +       if (ilsm)
> +               return *ilsm;
> +#endif
> +       return LSMBLOB_INVALID;
> +}
> +
>  /* These functions are in security/commoncap.c */
>  extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
>                        int cap, unsigned int opts);
> diff --git a/security/apparmor/include/apparmor.h b/security/apparmor/include/apparmor.h
> index 1fbabdb565a8..b1622fcb4394 100644
> --- a/security/apparmor/include/apparmor.h
> +++ b/security/apparmor/include/apparmor.h
> @@ -28,8 +28,9 @@
>  #define AA_CLASS_SIGNAL                10
>  #define AA_CLASS_NET           14
>  #define AA_CLASS_LABEL         16
> +#define AA_CLASS_DISPLAY_LSM   17
>
> -#define AA_CLASS_LAST          AA_CLASS_LABEL
> +#define AA_CLASS_LAST          AA_CLASS_DISPLAY_LSM
>
>  /* Control parameters settable through module/boot flags */
>  extern enum audit_mode aa_g_audit;
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 24241db8ec54..5ed40fd93ce9 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -621,6 +621,25 @@ static int apparmor_getprocattr(struct task_struct *task, char *name,
>         return error;
>  }
>
> +
> +static int profile_interface_lsm(struct aa_profile *profile,
> +                                struct common_audit_data *sa)
> +{
> +       struct aa_perms perms = { };
> +       unsigned int state;
> +
> +       state = PROFILE_MEDIATES(profile, AA_CLASS_DISPLAY_LSM);
> +       if (state) {
> +               aa_compute_perms(profile->policy.dfa, state, &perms);
> +               aa_apply_modes_to_perms(profile, &perms);
> +               aad(sa)->label = &profile->label;
> +
> +               return aa_check_perms(profile, &perms, AA_MAY_WRITE, sa, NULL);
> +       }
> +
> +       return 0;
> +}
> +
>  static int apparmor_setprocattr(const char *name, void *value,
>                                 size_t size)
>  {
> @@ -632,6 +651,19 @@ static int apparmor_setprocattr(const char *name, void *value,
>         if (size == 0)
>                 return -EINVAL;
>
> +       /* LSM infrastructure does actual setting of interface_lsm if allowed */
> +       if (!strcmp(name, "interface_lsm")) {
> +               struct aa_profile *profile;
> +               struct aa_label *label;
> +
> +               aad(&sa)->info = "set interface lsm";
> +               label = begin_current_label_crit_section();
> +               error = fn_for_each_confined(label, profile,
> +                                       profile_interface_lsm(profile, &sa));
> +               end_current_label_crit_section(label);
> +               return error;
> +       }
> +
>         /* AppArmor requires that the buffer must be null terminated atm */
>         if (args[size - 1] != '\0') {
>                 /* null terminate */
> diff --git a/security/security.c b/security/security.c
> index f7af2444fcc3..cfd75659e7e6 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -78,7 +78,16 @@ static struct kmem_cache *lsm_file_cache;
>  static struct kmem_cache *lsm_inode_cache;
>
>  char *lsm_names;
> -static struct lsm_blob_sizes blob_sizes __lsm_ro_after_init;
> +
> +/*
> + * The task blob includes the "interface_lsm" slot used for
> + * chosing which module presents contexts.
> + * Using a long to avoid potential alignment issues with
> + * module assigned task blobs.
> + */
> +static struct lsm_blob_sizes blob_sizes __lsm_ro_after_init = {
> +       .lbs_task = sizeof(long),
> +};
>
>  /* Boot-time LSM user choice */
>  static __initdata const char *chosen_lsm_order;
> @@ -672,6 +681,8 @@ int lsm_inode_alloc(struct inode *inode)
>   */
>  static int lsm_task_alloc(struct task_struct *task)
>  {
> +       int *ilsm;
> +
>         if (blob_sizes.lbs_task == 0) {
>                 task->security = NULL;
>                 return 0;
> @@ -680,6 +691,15 @@ static int lsm_task_alloc(struct task_struct *task)
>         task->security = kzalloc(blob_sizes.lbs_task, GFP_KERNEL);
>         if (task->security == NULL)
>                 return -ENOMEM;
> +
> +       /*
> +        * The start of the task blob contains the "interface" LSM slot number.
> +        * Start with it set to the invalid slot number, indicating that the
> +        * default first registered LSM be displayed.
> +        */
> +       ilsm = task->security;
> +       *ilsm = LSMBLOB_INVALID;
> +
>         return 0;
>  }
>
> @@ -1736,14 +1756,26 @@ int security_file_open(struct file *file)
>
>  int security_task_alloc(struct task_struct *task, unsigned long clone_flags)
>  {
> +       int *oilsm = current->security;
> +       int *nilsm;
>         int rc = lsm_task_alloc(task);
>
> -       if (rc)
> +       if (unlikely(rc))
>                 return rc;
> +
>         rc = call_int_hook(task_alloc, 0, task, clone_flags);
> -       if (unlikely(rc))
> +       if (unlikely(rc)) {
>                 security_task_free(task);
> -       return rc;
> +               return rc;
> +       }
> +
> +       if (oilsm) {
> +               nilsm = task->security;
> +               if (nilsm)
> +                       *nilsm = *oilsm;
> +       }
> +
> +       return 0;
>  }
>
>  void security_task_free(struct task_struct *task)
> @@ -2175,23 +2207,110 @@ int security_getprocattr(struct task_struct *p, const char *lsm, char *name,
>                                 char **value)
>  {
>         struct security_hook_list *hp;
> +       int ilsm = lsm_task_ilsm(current);
> +       int slot = 0;
> +
> +       if (!strcmp(name, "interface_lsm")) {
> +               /*
> +                * lsm_slot will be 0 if there are no displaying modules.
> +                */
> +               if (lsm_slot == 0)
> +                       return -EINVAL;
> +
> +               /*
> +                * Only allow getting the current process' interface_lsm.
> +                * There are too few reasons to get another process'
> +                * interface_lsm and too many LSM policy issues.
> +                */
> +               if (current != p)
> +                       return -EINVAL;
> +
> +               ilsm = lsm_task_ilsm(p);
> +               if (ilsm != LSMBLOB_INVALID)
> +                       slot = ilsm;
> +               *value = kstrdup(lsm_slotlist[slot]->lsm, GFP_KERNEL);
> +               if (*value)
> +                       return strlen(*value);
> +               return -ENOMEM;
> +       }
>
>         hlist_for_each_entry(hp, &security_hook_heads.getprocattr, list) {
>                 if (lsm != NULL && strcmp(lsm, hp->lsmid->lsm))
>                         continue;
> +               if (lsm == NULL && ilsm != LSMBLOB_INVALID &&
> +                   ilsm != hp->lsmid->slot)
> +                       continue;
>                 return hp->hook.getprocattr(p, name, value);
>         }
>         return LSM_RET_DEFAULT(getprocattr);
>  }
>
> +/**
> + * security_setprocattr - Set process attributes via /proc
> + * @lsm: name of module involved, or NULL
> + * @name: name of the attribute
> + * @value: value to set the attribute to
> + * @size: size of the value
> + *
> + * Set the process attribute for the specified security module
> + * to the specified value. Note that this can only be used to set
> + * the process attributes for the current, or "self" process.
> + * The /proc code has already done this check.
> + *
> + * Returns 0 on success, an appropriate code otherwise.
> + */
>  int security_setprocattr(const char *lsm, const char *name, void *value,
>                          size_t size)
>  {
>         struct security_hook_list *hp;
> +       char *termed;
> +       char *copy;
> +       int *ilsm = current->security;
> +       int rc = -EINVAL;
> +       int slot = 0;
> +
> +       if (!strcmp(name, "interface_lsm")) {
> +               /*
> +                * Change the "interface_lsm" value only if all the security
> +                * modules that support setting a procattr allow it.
> +                * It is assumed that all such security modules will be
> +                * cooperative.
> +                */
> +               if (size == 0)
> +                       return -EINVAL;
> +
> +               hlist_for_each_entry(hp, &security_hook_heads.setprocattr,
> +                                    list) {
> +                       rc = hp->hook.setprocattr(name, value, size);
> +                       if (rc < 0)
> +                               return rc;
> +               }
> +
> +               rc = -EINVAL;
> +
> +               copy = kmemdup_nul(value, size, GFP_KERNEL);
> +               if (copy == NULL)
> +                       return -ENOMEM;
> +
> +               termed = strsep(&copy, " \n");
> +
> +               for (slot = 0; slot < lsm_slot; slot++)
> +                       if (!strcmp(termed, lsm_slotlist[slot]->lsm)) {
> +                               *ilsm = lsm_slotlist[slot]->slot;
> +                               rc = size;
> +                               break;
> +                       }
> +
> +               kfree(termed);
> +               return rc;
> +       }
>
>         hlist_for_each_entry(hp, &security_hook_heads.setprocattr, list) {
>                 if (lsm != NULL && strcmp(lsm, hp->lsmid->lsm))
>                         continue;
> +               if (lsm == NULL && *ilsm != LSMBLOB_INVALID &&
> +                   *ilsm != hp->lsmid->slot)
> +                       continue;
>                 return hp->hook.setprocattr(name, value, size);
>         }
>         return LSM_RET_DEFAULT(setprocattr);
> @@ -2211,15 +2330,15 @@ EXPORT_SYMBOL(security_ismaclabel);
>  int security_secid_to_secctx(struct lsmblob *blob, char **secdata, u32 *seclen)
>  {
>         struct security_hook_list *hp;
> -       int rc;
> +       int ilsm = lsm_task_ilsm(current);
>
>         hlist_for_each_entry(hp, &security_hook_heads.secid_to_secctx, list) {
>                 if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
>                         continue;
> -               rc = hp->hook.secid_to_secctx(blob->secid[hp->lsmid->slot],
> -                                             secdata, seclen);
> -               if (rc != LSM_RET_DEFAULT(secid_to_secctx))
> -                       return rc;
> +               if (ilsm == LSMBLOB_INVALID || ilsm == hp->lsmid->slot)
> +                       return hp->hook.secid_to_secctx(
> +                                       blob->secid[hp->lsmid->slot],
> +                                       secdata, seclen);
>         }
>
>         return LSM_RET_DEFAULT(secid_to_secctx);
> @@ -2230,16 +2349,15 @@ int security_secctx_to_secid(const char *secdata, u32 seclen,
>                              struct lsmblob *blob)
>  {
>         struct security_hook_list *hp;
> -       int rc;
> +       int ilsm = lsm_task_ilsm(current);
>
>         lsmblob_init(blob, 0);
>         hlist_for_each_entry(hp, &security_hook_heads.secctx_to_secid, list) {
>                 if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
>                         continue;
> -               rc = hp->hook.secctx_to_secid(secdata, seclen,
> -                                             &blob->secid[hp->lsmid->slot]);
> -               if (rc != 0)
> -                       return rc;
> +               if (ilsm == LSMBLOB_INVALID || ilsm == hp->lsmid->slot)
> +                       return hp->hook.secctx_to_secid(secdata, seclen,
> +                                               &blob->secid[hp->lsmid->slot]);
>         }
>         return 0;
>  }
> @@ -2247,7 +2365,14 @@ EXPORT_SYMBOL(security_secctx_to_secid);
>
>  void security_release_secctx(char *secdata, u32 seclen)
>  {
> -       call_void_hook(release_secctx, secdata, seclen);
> +       struct security_hook_list *hp;
> +       int ilsm = lsm_task_ilsm(current);
> +
> +       hlist_for_each_entry(hp, &security_hook_heads.release_secctx, list)
> +               if (ilsm == LSMBLOB_INVALID || ilsm == hp->lsmid->slot) {
> +                       hp->hook.release_secctx(secdata, seclen);
> +                       return;
> +               }
>  }
>  EXPORT_SYMBOL(security_release_secctx);
>
> @@ -2388,8 +2513,15 @@ EXPORT_SYMBOL(security_sock_rcv_skb);
>  int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
>                                       int __user *optlen, unsigned len)
>  {
> -       return call_int_hook(socket_getpeersec_stream, -ENOPROTOOPT, sock,
> -                               optval, optlen, len);
> +       int ilsm = lsm_task_ilsm(current);
> +       struct security_hook_list *hp;
> +
> +       hlist_for_each_entry(hp, &security_hook_heads.socket_getpeersec_stream,
> +                            list)
> +               if (ilsm == LSMBLOB_INVALID || ilsm == hp->lsmid->slot)
> +                       return hp->hook.socket_getpeersec_stream(sock, optval,
> +                                                                optlen, len);
> +       return -ENOPROTOOPT;
>  }
>
>  int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index c295b1035bc6..824a6e4fb126 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -6441,6 +6441,17 @@ static int selinux_setprocattr(const char *name, void *value, size_t size)
>         /*
>          * Basic control over ability to set these attributes at all.
>          */
> +
> +       /*
> +        * For setting interface_lsm, we only perform a permission check;
> +        * the actual update to the interface_lsm value is handled by the
> +        * LSM framework.
> +        */
> +       if (!strcmp(name, "interface_lsm"))
> +               return avc_has_perm(&selinux_state,
> +                                   mysid, mysid, SECCLASS_PROCESS2,
> +                                   PROCESS2__SETDISPLAY, NULL);
> +
>         if (!strcmp(name, "exec"))
>                 error = avc_has_perm(&selinux_state,
>                                      mysid, mysid, SECCLASS_PROCESS,
> diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
> index 35aac62a662e..46a7cfaf392d 100644
> --- a/security/selinux/include/classmap.h
> +++ b/security/selinux/include/classmap.h
> @@ -53,7 +53,7 @@ struct security_class_mapping secclass_map[] = {
>             "execmem", "execstack", "execheap", "setkeycreate",
>             "setsockcreate", "getrlimit", NULL } },
>         { "process2",
> -         { "nnp_transition", "nosuid_transition", NULL } },
> +         { "nnp_transition", "nosuid_transition", "setdisplay", NULL } },

Could this new permission verb be more descriptive?
E.g. "setlsmdisplay", "set_lsm_display", "setlsminterface",
"set_lsm_interface", "setinterfacelsm", "set_interface_lsm" ... ?

>         { "system",
>           { "ipc_info", "syslog_read", "syslog_mod",
>             "syslog_console", "module_request", "module_load", NULL } },
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index 9c44327d8ea7..1069ba7abf40 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -3517,6 +3517,13 @@ static int smack_setprocattr(const char *name, void *value, size_t size)
>         struct smack_known_list_elem *sklep;
>         int rc;
>
> +       /*
> +        * Allow the /proc/.../attr/current and SO_PEERSEC "interface_lsm"
> +        * to be reset at will.
> +        */
> +       if (strcmp(name, "interface_lsm") == 0)
> +               return 0;
> +
>         if (!smack_privileged(CAP_MAC_ADMIN) && list_empty(&tsp->smk_relabel))
>                 return -EPERM;
>
> --
> 2.31.1
>
