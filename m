Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF21C100E30
	for <lists+selinux@lfdr.de>; Mon, 18 Nov 2019 22:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfKRVqY (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 18 Nov 2019 16:46:24 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38345 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfKRVqX (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 18 Nov 2019 16:46:23 -0500
Received: by mail-lf1-f66.google.com with SMTP id q28so15117499lfa.5
        for <selinux@vger.kernel.org>; Mon, 18 Nov 2019 13:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HIyv0p+iLjFbFERkP2qg4JcVm0HpuPqFGjdUEW4KPRA=;
        b=Uarp2+C9LhYWEHHrC98hwQMxCYClMUmYsdS03a4mgpcV5AUG/0poqtecCCJWGfO9u6
         9HrbqFjJhNnjOftYyPLQ6B/8zOC4cI10OaLITYaAwZA9jPBNgM6dpRLE4W6R+d6hvmqj
         qrb0E449UTs1xXAG3hE6/OPjdUkxLbmJsVcDLpb31sLbmbbPoxXz4uceN5tQEKVnzVsa
         raPePj6jn9UfxhMkowUJTmQSAl4O8nzzZmwrP8aV8xd1jOxv7fryc4mrmGz2KkCkpdwP
         QKWbgQCblGTiD2OFfL5A42cKL33PKUaliy/uh/78dBVlbHWe+JGac7INhmAt8Bf134Wi
         ZPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HIyv0p+iLjFbFERkP2qg4JcVm0HpuPqFGjdUEW4KPRA=;
        b=RBi70kD7HuiEwrywcHpelMZSfHPLpTQb3w3sYE06WffIS72eCXjC3n1+6hziOwunse
         w6sfSYhM6Ych+MUsiuyplAQH4GL2XGu9iHVBLz5Q8sSzpYwsE7vBzP2WJ9gVsgW8UM/d
         Fnke5MIE9EMx5AhSatWwWE77f1UCMt9lELlCejT1vPegMRg9/XKMtarhXsv0KLQWUJoo
         AodhkK9hL+PeE867Dvlvb59/bTyMjdloCLmPakt0kzsrNRJtCt2XuHQD1fNqDamrwr9a
         ubODKv1/JBudkwO1lLUpq1uKvkMp1q2gK9y/qeFjennMEPo9oV72/B31pkvF0sRTKaAW
         tCbg==
X-Gm-Message-State: APjAAAXX3swW2OnVf2/a6btH1bU7k4LfcO6lVRtaEXQpPZiQGBLJ+0a8
        0hripzf7d5IXY0DXtJS5DwlMYhd8ntaGMJbx0XJ8tg==
X-Google-Smtp-Source: APXvYqzbpcStm7/CI/v36qoK36ONvdV7nkgrhqyVF0cXJYY8sIhlF46XOOYTb7HoCD4LbRYOElCbibhQbn+39iRwC+o=
X-Received: by 2002:a19:7510:: with SMTP id y16mr1126567lfe.24.1574113578347;
 Mon, 18 Nov 2019 13:46:18 -0800 (PST)
MIME-Version: 1.0
References: <20191118122150.198992-1-jeffv@google.com> <cc62d79d-0932-8aa1-0e8b-6ede31a02df7@tycho.nsa.gov>
In-Reply-To: <cc62d79d-0932-8aa1-0e8b-6ede31a02df7@tycho.nsa.gov>
From:   Jeffrey Vander Stoep <jeffv@google.com>
Date:   Mon, 18 Nov 2019 22:46:06 +0100
Message-ID: <CABXk95Bu_nOGaBFrEjvy6_6NFRFYS7oLt6vtL-a1B-oDc6m7Mg@mail.gmail.com>
Subject: Re: [PATCH v7] selinux: sidtab: reverse lookup hash table
To:     Stephen Smalley <sds@tycho.nsa.gov>
Cc:     SElinux list <selinux@vger.kernel.org>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Paul Moore <paul@paul-moore.com>,
        Will Deacon <will@kernel.org>, paulmck@kernel.org,
        rcu@vger.kernel.org, Jovana Knezevic <jovanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

It's complaining that it's given an object instead of a pointer to the
object. I don't know if there's a good way to fix that since the
objects are defined in an array and we're then (re) using them in the
hashtable. I'll remove the annotation.

On Mon, Nov 18, 2019 at 3:00 PM Stephen Smalley <sds@tycho.nsa.gov> wrote:
>
> On 11/18/19 7:21 AM, Jeff Vander Stoep wrote:
> > This replaces the reverse table lookup and reverse cache with a
> > hashtable which improves cache-miss reverse-lookup times from
> > O(n) to O(1)* and maintains the same performance as a reverse
> > cache hit.
> >
> > This reduces the time needed to add a new sidtab entry from ~500us
> > to 5us on a Pixel 3 when there are ~10,000 sidtab entries.
> >
> > The implementation uses the kernel's generic hashtable API,
> > It uses the context's string represtation as the hash source,
> > and the kernels generic string hashing algorithm full_name_hash()
> > to reduce the string to a 32 bit value.
> >
> > This change also maintains the improvement introduced in
> > commit ee1a84fdfeed ("selinux: overhaul sidtab to fix bug and improve
> > performance") which removed the need to keep the current sidtab
> > locked during policy reload. It does however introduce periodic
> > locking of the target sidtab while converting the hashtable. Sidtab
> > entries are never modified or removed, so the context struct stored
> > in the sid_to_context tree can also be used for the context_to_sid
> > hashtable to reduce memory usage.
> >
> > This bug was reported by:
> > - On the selinux bug tracker.
> >    BUG: kernel softlockup due to too many SIDs/contexts #37
> >    https://github.com/SELinuxProject/selinux-kernel/issues/37
> > - Jovana Knezevic on Android's bugtracker.
> >    Bug: 140252993
> >    "During multi-user performance testing, we create and remove users
> >    many times. selinux_android_restorecon_pkgdir goes from 1ms to over
> >    20ms after about 200 user creations and removals. Accumulated over
> >    ~280 packages, that adds a significant time to user creation,
> >    making perf benchmarks unreliable."
> >
> > * Hashtable lookup is only O(1) when n < the number of buckets.
> >
> > Changes in V2:
> > -The hashtable uses sidtab_entry_leaf objects directly so these
> > objects are shared between the sid_to_context lookup tree and the
> > context_to_sid hashtable. This simplifies memory allocation and
> > was suggested by Ondrej Mosnacek.
> > -The new sidtab hash stats file in selinuxfs has been moved out of
> > the avc dir and into a new "ss" dir.
> >
> > V3:
> > -Add lock nesting notation.
> >
> > V4/V5:
> > -Moved to *_rcu variants of the various hashtable functions
> > as suggested by Will Deacon.
> > -Naming/spelling fixups.
> >
> > V6
> > -Remove nested locking. Use lock of active sidtab to gate
> > access to the new sidtab.
> > -Remove use of rcu_head/kfree_rcu(), they're unnecessary because
> > hashtable objects are never removed when read/add operations are
> > occurring. Why is this safe? Quoting Ondrej Mosnacek from the
> > selinux mailing list:
> > "It is not visible in this patch, but the sidtab (along with other
> > policy-lifetime structures) is protected by a big fat read-write lock.
> > The only places where sidtab_destroy() is called are (a) error paths
> > when initializing a new sidtab (here the sidtab isn't shared yet, so
> > no race) and (b) when freeing the old sidtab during policy reload - in
> > this case it is happening after a policy write-locked critical
> > section, which had removed the old sidtab pointer from the shared
> > structures, so at that point all sidtab readers will already be
> > accessing the new sidtab and the old one is visible only by the thread
> > doing the destruction."
> >
> > V7
> > -Change format of /sys/fs/selinux/ss/sidtab_hash_stats to match
> > /sys/fs/selinux/avc/hash_stats.
> > -Add __rcu annotation to rcu pointers.
> > -Test with CONFIG_SPARSE_RCU_POINTER and CONFIG_PROVE_RCU.
> > -Add rcu@vger.kernel.org and Paul McKenney to Cc for review of the
> > RCU logic.
>
> With the __rcu annotation, I get the following warnings upon make C=2
> security/selinux/ss/sidtab.o:
>
>    CHECK   security/selinux/ss/sidtab.c
> security/selinux/ss/sidtab.c:192:41: warning: incorrect type in return
> expression (different modifiers)
> security/selinux/ss/sidtab.c:192:41:    expected struct sidtab_entry_leaf *
> security/selinux/ss/sidtab.c:192:41:    got struct sidtab_entry_leaf
> [noderef] *
> security/selinux/ss/sidtab.c:369:68: warning: incorrect type in argument
> 1 (different modifiers)
> security/selinux/ss/sidtab.c:369:68:    expected struct context *oldc
> security/selinux/ss/sidtab.c:369:68:    got struct context [noderef] *
> security/selinux/ss/sidtab.c:370:68: warning: incorrect type in argument
> 2 (different modifiers)
> security/selinux/ss/sidtab.c:370:68:    expected struct context *newc
> security/selinux/ss/sidtab.c:370:68:    got struct context [noderef] *
> security/selinux/ss/sidtab.c:462:55: warning: incorrect type in argument
> 1 (different modifiers)
> security/selinux/ss/sidtab.c:462:55:    expected struct context *c
> security/selinux/ss/sidtab.c:462:55:    got struct context [noderef] *
>
> >
> > Signed-off-by: Jeff Vander Stoep <jeffv@google.com>
> > Reported-by: Stephen Smalley <sds@tycho.nsa.gov>
> > Reported-by: Jovana Knezevic <jovanak@google.com>
> > ---
> >   security/selinux/Kconfig            |  12 ++
> >   security/selinux/include/security.h |   1 +
> >   security/selinux/selinuxfs.c        |  65 +++++++
> >   security/selinux/ss/context.h       |  11 +-
> >   security/selinux/ss/policydb.c      |   5 +
> >   security/selinux/ss/services.c      |  83 +++++++--
> >   security/selinux/ss/services.h      |   4 +-
> >   security/selinux/ss/sidtab.c        | 263 ++++++++++++++--------------
> >   security/selinux/ss/sidtab.h        |  18 +-
> >   9 files changed, 300 insertions(+), 162 deletions(-)
> >
> > diff --git a/security/selinux/Kconfig b/security/selinux/Kconfig
> > index 5711689deb6a..c9e576c430c2 100644
> > --- a/security/selinux/Kconfig
> > +++ b/security/selinux/Kconfig
> > @@ -85,3 +85,15 @@ config SECURITY_SELINUX_CHECKREQPROT_VALUE
> >         via /selinux/checkreqprot if authorized by policy.
> >
> >         If you are unsure how to answer this question, answer 0.
> > +
> > +config SECURITY_SELINUX_SIDTAB_HASH_BITS
> > +     int "NSA SELinux sidtab hashtable size"
> > +     depends on SECURITY_SELINUX
> > +     range 8 13
> > +     default 9
> > +     help
> > +       This option sets the number of buckets used in the sidtab hashtable
> > +       to 2^SECURITY_SELINUX_SIDTAB_HASH_BITS buckets. The number of hash
> > +       collisions may be viewed at /sys/fs/selinux/ss/sidtab_hash_stats. If
> > +       chain lengths are high (e.g. > 20) then selecting a higher value here
> > +       will ensure that lookups times are short and stable.
> > diff --git a/security/selinux/include/security.h b/security/selinux/include/security.h
> > index ae840634e3c7..8c0dbbd076c6 100644
> > --- a/security/selinux/include/security.h
> > +++ b/security/selinux/include/security.h
> > @@ -395,5 +395,6 @@ extern int selinux_nlmsg_lookup(u16 sclass, u16 nlmsg_type, u32 *perm);
> >   extern void avtab_cache_init(void);
> >   extern void ebitmap_cache_init(void);
> >   extern void hashtab_cache_init(void);
> > +extern int security_sidtab_hash_stats(struct selinux_state *state, char *page);
> >
> >   #endif /* _SELINUX_SECURITY_H_ */
> > diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
> > index ee94fa469c29..dd7bb1f1dc99 100644
> > --- a/security/selinux/selinuxfs.c
> > +++ b/security/selinux/selinuxfs.c
> > @@ -1482,6 +1482,32 @@ static ssize_t sel_read_avc_hash_stats(struct file *filp, char __user *buf,
> >       return length;
> >   }
> >
> > +static ssize_t sel_read_sidtab_hash_stats(struct file *filp, char __user *buf,
> > +                                     size_t count, loff_t *ppos)
> > +{
> > +     struct selinux_fs_info *fsi = file_inode(filp)->i_sb->s_fs_info;
> > +     struct selinux_state *state = fsi->state;
> > +     char *page;
> > +     ssize_t length;
> > +
> > +     page = (char *)__get_free_page(GFP_KERNEL);
> > +     if (!page)
> > +             return -ENOMEM;
> > +
> > +     length = security_sidtab_hash_stats(state, page);
> > +     if (length >= 0)
> > +             length = simple_read_from_buffer(buf, count, ppos, page,
> > +                                             length);
> > +     free_page((unsigned long)page);
> > +
> > +     return length;
> > +}
> > +
> > +static const struct file_operations sel_sidtab_hash_stats_ops = {
> > +     .read           = sel_read_sidtab_hash_stats,
> > +     .llseek         = generic_file_llseek,
> > +};
> > +
> >   static const struct file_operations sel_avc_cache_threshold_ops = {
> >       .read           = sel_read_avc_cache_threshold,
> >       .write          = sel_write_avc_cache_threshold,
> > @@ -1599,6 +1625,37 @@ static int sel_make_avc_files(struct dentry *dir)
> >       return 0;
> >   }
> >
> > +static int sel_make_ss_files(struct dentry *dir)
> > +{
> > +     struct super_block *sb = dir->d_sb;
> > +     struct selinux_fs_info *fsi = sb->s_fs_info;
> > +     int i;
> > +     static struct tree_descr files[] = {
> > +             { "sidtab_hash_stats", &sel_sidtab_hash_stats_ops, S_IRUGO },
> > +     };
> > +
> > +     for (i = 0; i < ARRAY_SIZE(files); i++) {
> > +             struct inode *inode;
> > +             struct dentry *dentry;
> > +
> > +             dentry = d_alloc_name(dir, files[i].name);
> > +             if (!dentry)
> > +                     return -ENOMEM;
> > +
> > +             inode = sel_make_inode(dir->d_sb, S_IFREG|files[i].mode);
> > +             if (!inode) {
> > +                     dput(dentry);
> > +                     return -ENOMEM;
> > +             }
> > +
> > +             inode->i_fop = files[i].ops;
> > +             inode->i_ino = ++fsi->last_ino;
> > +             d_add(dentry, inode);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >   static ssize_t sel_read_initcon(struct file *file, char __user *buf,
> >                               size_t count, loff_t *ppos)
> >   {
> > @@ -1963,6 +2020,14 @@ static int sel_fill_super(struct super_block *sb, struct fs_context *fc)
> >       }
> >
> >       ret = sel_make_avc_files(dentry);
> > +
> > +     dentry = sel_make_dir(sb->s_root, "ss", &fsi->last_ino);
> > +     if (IS_ERR(dentry)) {
> > +             ret = PTR_ERR(dentry);
> > +             goto err;
> > +     }
> > +
> > +     ret = sel_make_ss_files(dentry);
> >       if (ret)
> >               goto err;
> >
> > diff --git a/security/selinux/ss/context.h b/security/selinux/ss/context.h
> > index 513e67f48878..3ba044fe02ed 100644
> > --- a/security/selinux/ss/context.h
> > +++ b/security/selinux/ss/context.h
> > @@ -31,6 +31,7 @@ struct context {
> >       u32 len;        /* length of string in bytes */
> >       struct mls_range range;
> >       char *str;      /* string representation if context cannot be mapped. */
> > +     u32 hash;       /* a hash of the string representation */
> >   };
> >
> >   static inline void mls_context_init(struct context *c)
> > @@ -168,12 +169,13 @@ static inline int context_cpy(struct context *dst, struct context *src)
> >               kfree(dst->str);
> >               return rc;
> >       }
> > +     dst->hash = src->hash;
> >       return 0;
> >   }
> >
> >   static inline void context_destroy(struct context *c)
> >   {
> > -     c->user = c->role = c->type = 0;
> > +     c->user = c->role = c->type = c->hash = 0;
> >       kfree(c->str);
> >       c->str = NULL;
> >       c->len = 0;
> > @@ -182,6 +184,8 @@ static inline void context_destroy(struct context *c)
> >
> >   static inline int context_cmp(struct context *c1, struct context *c2)
> >   {
> > +     if (c1->hash && c2->hash && (c1->hash != c2->hash))
> > +             return 0;
> >       if (c1->len && c2->len)
> >               return (c1->len == c2->len && !strcmp(c1->str, c2->str));
> >       if (c1->len || c2->len)
> > @@ -192,5 +196,10 @@ static inline int context_cmp(struct context *c1, struct context *c2)
> >               mls_context_cmp(c1, c2));
> >   }
> >
> > +static inline unsigned int context_compute_hash(const char *s)
> > +{
> > +     return full_name_hash(NULL, s, strlen(s));
> > +}
> > +
> >   #endif      /* _SS_CONTEXT_H_ */
> >
> > diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> > index e20624a68f5d..e369b0092cdf 100644
> > --- a/security/selinux/ss/policydb.c
> > +++ b/security/selinux/ss/policydb.c
> > @@ -878,6 +878,11 @@ int policydb_load_isids(struct policydb *p, struct sidtab *s)
> >                       sidtab_destroy(s);
> >                       goto out;
> >               }
> > +             rc = context_add_hash(p, &c->context[0]);
> > +             if (rc) {
> > +                     sidtab_destroy(s);
> > +                     goto out;
> > +             }
> >
> >               rc = sidtab_set_initial(s, c->sid[0], &c->context[0]);
> >               if (rc) {
> > diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
> > index 3a29e7c24ba9..689dff4e756f 100644
> > --- a/security/selinux/ss/services.c
> > +++ b/security/selinux/ss/services.c
> > @@ -1257,6 +1257,17 @@ static int context_struct_to_string(struct policydb *p,
> >
> >   #include "initial_sid_to_string.h"
> >
> > +int security_sidtab_hash_stats(struct selinux_state *state, char *page)
> > +{
> > +     int rc;
> > +
> > +     read_lock(&state->ss->policy_rwlock);
> > +     rc = sidtab_hash_stats(state->ss->sidtab, page);
> > +     read_unlock(&state->ss->policy_rwlock);
> > +
> > +     return rc;
> > +}
> > +
> >   const char *security_get_initial_sid_context(u32 sid)
> >   {
> >       if (unlikely(sid > SECINITSID_NUM))
> > @@ -1384,6 +1395,8 @@ static int string_to_context_struct(struct policydb *pol,
> >       int rc = 0;
> >
> >       context_init(ctx);
> > +     /* hash the string before it gets mutated */
> > +     ctx->hash = context_compute_hash(scontext);
> >
> >       /* Parse the security context. */
> >
> > @@ -1449,6 +1462,42 @@ static int string_to_context_struct(struct policydb *pol,
> >       return rc;
> >   }
> >
> > +int context_add_hash(struct policydb *policydb,
> > +                  struct context *context)
> > +{
> > +     int rc;
> > +     char *str;
> > +     int len;
> > +
> > +     if (context->str) {
> > +             context->hash = context_compute_hash(context->str);
> > +     } else {
> > +             rc = context_struct_to_string(policydb, context,
> > +                                           &str, &len);
> > +             if (rc)
> > +                     return rc;
> > +             context->hash = context_compute_hash(str);
> > +             kfree(str);
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int context_struct_to_sid(struct selinux_state *state,
> > +                              struct context *context, u32 *sid)
> > +{
> > +     int rc;
> > +     struct sidtab *sidtab = state->ss->sidtab;
> > +     struct policydb *policydb = &state->ss->policydb;
> > +
> > +     if (!context->hash) {
> > +             rc = context_add_hash(policydb, context);
> > +             if (rc)
> > +                     return rc;
> > +     }
> > +
> > +     return sidtab_context_to_sid(sidtab, context, sid);
> > +}
> > +
> >   static int security_context_to_sid_core(struct selinux_state *state,
> >                                       const char *scontext, u32 scontext_len,
> >                                       u32 *sid, u32 def_sid, gfp_t gfp_flags,
> > @@ -1501,7 +1550,7 @@ static int security_context_to_sid_core(struct selinux_state *state,
> >               str = NULL;
> >       } else if (rc)
> >               goto out_unlock;
> > -     rc = sidtab_context_to_sid(sidtab, &context, sid);
> > +     rc = context_struct_to_sid(state, &context, sid);
> >       context_destroy(&context);
> >   out_unlock:
> >       read_unlock(&state->ss->policy_rwlock);
> > @@ -1805,7 +1854,7 @@ static int security_compute_sid(struct selinux_state *state,
> >                       goto out_unlock;
> >       }
> >       /* Obtain the sid for the context. */
> > -     rc = sidtab_context_to_sid(sidtab, &newcontext, out_sid);
> > +     rc = context_struct_to_sid(state, &newcontext, out_sid);
> >   out_unlock:
> >       read_unlock(&state->ss->policy_rwlock);
> >       context_destroy(&newcontext);
> > @@ -2026,6 +2075,10 @@ static int convert_context(struct context *oldc, struct context *newc, void *p)
> >                       goto bad;
> >       }
> >
> > +     rc = context_add_hash(args->newp, newc);
> > +     if (rc)
> > +             goto bad;
> > +
> >       return 0;
> >   bad:
> >       /* Map old representation to string and save it. */
> > @@ -2273,8 +2326,7 @@ int security_port_sid(struct selinux_state *state,
> >
> >       if (c) {
> >               if (!c->sid[0]) {
> > -                     rc = sidtab_context_to_sid(sidtab,
> > -                                                &c->context[0],
> > +                     rc = context_struct_to_sid(state, &c->context[0],
> >                                                  &c->sid[0]);
> >                       if (rc)
> >                               goto out;
> > @@ -2367,8 +2419,7 @@ int security_ib_endport_sid(struct selinux_state *state,
> >
> >       if (c) {
> >               if (!c->sid[0]) {
> > -                     rc = sidtab_context_to_sid(sidtab,
> > -                                                &c->context[0],
> > +                     rc = context_struct_to_sid(state, &c->context[0],
> >                                                  &c->sid[0]);
> >                       if (rc)
> >                               goto out;
> > @@ -2409,13 +2460,11 @@ int security_netif_sid(struct selinux_state *state,
> >
> >       if (c) {
> >               if (!c->sid[0] || !c->sid[1]) {
> > -                     rc = sidtab_context_to_sid(sidtab,
> > -                                               &c->context[0],
> > -                                               &c->sid[0]);
> > +                     rc = context_struct_to_sid(state, &c->context[0],
> > +                                                &c->sid[0]);
> >                       if (rc)
> >                               goto out;
> > -                     rc = sidtab_context_to_sid(sidtab,
> > -                                                &c->context[1],
> > +                     rc = context_struct_to_sid(state, &c->context[1],
> >                                                  &c->sid[1]);
> >                       if (rc)
> >                               goto out;
> > @@ -2594,7 +2643,7 @@ int security_get_user_sids(struct selinux_state *state,
> >                                                &usercon))
> >                               continue;
> >
> > -                     rc = sidtab_context_to_sid(sidtab, &usercon, &sid);
> > +                     rc = context_struct_to_sid(state, &usercon, &sid);
> >                       if (rc)
> >                               goto out_unlock;
> >                       if (mynel < maxnel) {
> > @@ -2665,7 +2714,6 @@ static inline int __security_genfs_sid(struct selinux_state *state,
> >                                      u32 *sid)
> >   {
> >       struct policydb *policydb = &state->ss->policydb;
> > -     struct sidtab *sidtab = state->ss->sidtab;
> >       int len;
> >       u16 sclass;
> >       struct genfs *genfs;
> > @@ -2700,7 +2748,7 @@ static inline int __security_genfs_sid(struct selinux_state *state,
> >               goto out;
> >
> >       if (!c->sid[0]) {
> > -             rc = sidtab_context_to_sid(sidtab, &c->context[0], &c->sid[0]);
> > +             rc = context_struct_to_sid(state, &c->context[0], &c->sid[0]);
> >               if (rc)
> >                       goto out;
> >       }
> > @@ -2763,7 +2811,7 @@ int security_fs_use(struct selinux_state *state, struct super_block *sb)
> >       if (c) {
> >               sbsec->behavior = c->v.behavior;
> >               if (!c->sid[0]) {
> > -                     rc = sidtab_context_to_sid(sidtab, &c->context[0],
> > +                     rc = context_struct_to_sid(state, &c->context[0],
> >                                                  &c->sid[0]);
> >                       if (rc)
> >                               goto out;
> > @@ -3019,8 +3067,7 @@ int security_sid_mls_copy(struct selinux_state *state,
> >                       goto out_unlock;
> >               }
> >       }
> > -
> > -     rc = sidtab_context_to_sid(sidtab, &newcon, new_sid);
> > +     rc = context_struct_to_sid(state, &newcon, new_sid);
> >   out_unlock:
> >       read_unlock(&state->ss->policy_rwlock);
> >       context_destroy(&newcon);
> > @@ -3613,7 +3660,7 @@ int security_netlbl_secattr_to_sid(struct selinux_state *state,
> >               if (!mls_context_isvalid(policydb, &ctx_new))
> >                       goto out_free;
> >
> > -             rc = sidtab_context_to_sid(sidtab, &ctx_new, sid);
> > +             rc = context_struct_to_sid(state, &ctx_new, sid);
> >               if (rc)
> >                       goto out_free;
> >
> > diff --git a/security/selinux/ss/services.h b/security/selinux/ss/services.h
> > index 9a36de860368..fc40640a9725 100644
> > --- a/security/selinux/ss/services.h
> > +++ b/security/selinux/ss/services.h
> > @@ -8,7 +8,7 @@
> >   #define _SS_SERVICES_H_
> >
> >   #include "policydb.h"
> > -#include "sidtab.h"
> > +#include "context.h"
> >
> >   /* Mapping for a single class */
> >   struct selinux_mapping {
> > @@ -39,4 +39,6 @@ void services_compute_xperms_drivers(struct extended_perms *xperms,
> >   void services_compute_xperms_decision(struct extended_perms_decision *xpermd,
> >                                       struct avtab_node *node);
> >
> > +int context_add_hash(struct policydb *policydb, struct context *context);
> > +
> >   #endif      /* _SS_SERVICES_H_ */
> > diff --git a/security/selinux/ss/sidtab.c b/security/selinux/ss/sidtab.c
> > index 7d49994e8d5f..97d6fedeff68 100644
> > --- a/security/selinux/ss/sidtab.c
> > +++ b/security/selinux/ss/sidtab.c
> > @@ -17,26 +17,43 @@
> >   #include "security.h"
> >   #include "sidtab.h"
> >
> > +#define index_to_sid(index) (index + SECINITSID_NUM + 1)
> > +#define sid_to_index(sid) (sid - (SECINITSID_NUM + 1))
> > +
> >   int sidtab_init(struct sidtab *s)
> >   {
> >       u32 i;
> >
> >       memset(s->roots, 0, sizeof(s->roots));
> >
> > -     /* max count is SIDTAB_MAX so valid index is always < SIDTAB_MAX */
> > -     for (i = 0; i < SIDTAB_RCACHE_SIZE; i++)
> > -             s->rcache[i] = SIDTAB_MAX;
> > -
> >       for (i = 0; i < SECINITSID_NUM; i++)
> >               s->isids[i].set = 0;
> >
> >       s->count = 0;
> >       s->convert = NULL;
> > +     hash_init(s->context_to_sid);
> >
> >       spin_lock_init(&s->lock);
> >       return 0;
> >   }
> >
> > +static u32 context_to_sid(struct sidtab *s, struct context *context)
> > +{
> > +     struct sidtab_entry_leaf *entry;
> > +     u32 sid = 0;
> > +
> > +     rcu_read_lock();
> > +     hash_for_each_possible_rcu(s->context_to_sid, entry, list,
> > +                                context->hash) {
> > +             if (context_cmp(&entry->context, context)) {
> > +                     sid = entry->sid;
> > +                     break;
> > +             }
> > +     }
> > +     rcu_read_unlock();
> > +     return sid;
> > +}
> > +
> >   int sidtab_set_initial(struct sidtab *s, u32 sid, struct context *context)
> >   {
> >       struct sidtab_isid_entry *entry;
> > @@ -47,14 +64,60 @@ int sidtab_set_initial(struct sidtab *s, u32 sid, struct context *context)
> >
> >       entry = &s->isids[sid - 1];
> >
> > -     rc = context_cpy(&entry->context, context);
> > +     rc = context_cpy(&entry->leaf.context, context);
> >       if (rc)
> >               return rc;
> >
> >       entry->set = 1;
> > +
> > +     /*
> > +      * Multiple initial sids may map to the same context. Check that this
> > +      * context is not already represented in the context_to_sid hashtable
> > +      * to avoid duplicate entries and long linked lists upon hash
> > +      * collision.
> > +      */
> > +     if (!context_to_sid(s, context)) {
> > +             entry->leaf.sid = sid;
> > +             hash_add(s->context_to_sid, &entry->leaf.list, context->hash);
> > +     }
> > +
> >       return 0;
> >   }
> >
> > +int sidtab_hash_stats(struct sidtab *sidtab, char *page)
> > +{
> > +     int i;
> > +     int chain_len = 0;
> > +     int slots_used = 0;
> > +     int entries = 0;
> > +     int max_chain_len = 0;
> > +     int cur_bucket = 0;
> > +     struct sidtab_entry_leaf *entry;
> > +
> > +     rcu_read_lock();
> > +     hash_for_each_rcu(sidtab->context_to_sid, i, entry, list) {
> > +             entries++;
> > +             if (i == cur_bucket) {
> > +                     chain_len++;
> > +                     if (chain_len == 1)
> > +                             slots_used++;
> > +             } else {
> > +                     cur_bucket = i;
> > +                     if (chain_len > max_chain_len)
> > +                             max_chain_len = chain_len;
> > +                     chain_len = 0;
> > +             }
> > +     }
> > +     rcu_read_unlock();
> > +
> > +     if (chain_len > max_chain_len)
> > +             max_chain_len = chain_len;
> > +
> > +     return scnprintf(page, PAGE_SIZE, "entries: %d\nbuckets used: %d/%d\n"
> > +                      "longest chain: %d\n", entries,
> > +                      slots_used, SIDTAB_HASH_BUCKETS, max_chain_len);
> > +}
> > +
> >   static u32 sidtab_level_from_count(u32 count)
> >   {
> >       u32 capacity = SIDTAB_LEAF_ENTRIES;
> > @@ -88,7 +151,8 @@ static int sidtab_alloc_roots(struct sidtab *s, u32 level)
> >       return 0;
> >   }
> >
> > -static struct context *sidtab_do_lookup(struct sidtab *s, u32 index, int alloc)
> > +static struct sidtab_entry_leaf *sidtab_do_lookup(struct sidtab *s, u32 index,
> > +                                               int alloc)
> >   {
> >       union sidtab_entry_inner *entry;
> >       u32 level, capacity_shift, leaf_index = index / SIDTAB_LEAF_ENTRIES;
> > @@ -125,7 +189,7 @@ static struct context *sidtab_do_lookup(struct sidtab *s, u32 index, int alloc)
> >               if (!entry->ptr_leaf)
> >                       return NULL;
> >       }
> > -     return &entry->ptr_leaf->entries[index % SIDTAB_LEAF_ENTRIES].context;
> > +     return &entry->ptr_leaf->entries[index % SIDTAB_LEAF_ENTRIES];
> >   }
> >
> >   static struct context *sidtab_lookup(struct sidtab *s, u32 index)
> > @@ -136,12 +200,12 @@ static struct context *sidtab_lookup(struct sidtab *s, u32 index)
> >       if (index >= count)
> >               return NULL;
> >
> > -     return sidtab_do_lookup(s, index, 0);
> > +     return &sidtab_do_lookup(s, index, 0)->context;
> >   }
> >
> >   static struct context *sidtab_lookup_initial(struct sidtab *s, u32 sid)
> >   {
> > -     return s->isids[sid - 1].set ? &s->isids[sid - 1].context : NULL;
> > +     return s->isids[sid - 1].set ? &s->isids[sid - 1].leaf.context : NULL;
> >   }
> >
> >   static struct context *sidtab_search_core(struct sidtab *s, u32 sid, int force)
> > @@ -150,7 +214,7 @@ static struct context *sidtab_search_core(struct sidtab *s, u32 sid, int force)
> >
> >       if (sid != 0) {
> >               if (sid > SECINITSID_NUM)
> > -                     context = sidtab_lookup(s, sid - (SECINITSID_NUM + 1));
> > +                     context = sidtab_lookup(s, sid_to_index(sid));
> >               else
> >                       context = sidtab_lookup_initial(s, sid);
> >               if (context && (!context->len || force))
> > @@ -170,117 +234,30 @@ struct context *sidtab_search_force(struct sidtab *s, u32 sid)
> >       return sidtab_search_core(s, sid, 1);
> >   }
> >
> > -static int sidtab_find_context(union sidtab_entry_inner entry,
> > -                            u32 *pos, u32 count, u32 level,
> > -                            struct context *context, u32 *index)
> > -{
> > -     int rc;
> > -     u32 i;
> > -
> > -     if (level != 0) {
> > -             struct sidtab_node_inner *node = entry.ptr_inner;
> > -
> > -             i = 0;
> > -             while (i < SIDTAB_INNER_ENTRIES && *pos < count) {
> > -                     rc = sidtab_find_context(node->entries[i],
> > -                                              pos, count, level - 1,
> > -                                              context, index);
> > -                     if (rc == 0)
> > -                             return 0;
> > -                     i++;
> > -             }
> > -     } else {
> > -             struct sidtab_node_leaf *node = entry.ptr_leaf;
> > -
> > -             i = 0;
> > -             while (i < SIDTAB_LEAF_ENTRIES && *pos < count) {
> > -                     if (context_cmp(&node->entries[i].context, context)) {
> > -                             *index = *pos;
> > -                             return 0;
> > -                     }
> > -                     (*pos)++;
> > -                     i++;
> > -             }
> > -     }
> > -     return -ENOENT;
> > -}
> > -
> > -static void sidtab_rcache_update(struct sidtab *s, u32 index, u32 pos)
> > -{
> > -     while (pos > 0) {
> > -             WRITE_ONCE(s->rcache[pos], READ_ONCE(s->rcache[pos - 1]));
> > -             --pos;
> > -     }
> > -     WRITE_ONCE(s->rcache[0], index);
> > -}
> > -
> > -static void sidtab_rcache_push(struct sidtab *s, u32 index)
> > -{
> > -     sidtab_rcache_update(s, index, SIDTAB_RCACHE_SIZE - 1);
> > -}
> > -
> > -static int sidtab_rcache_search(struct sidtab *s, struct context *context,
> > -                             u32 *index)
> > -{
> > -     u32 i;
> > -
> > -     for (i = 0; i < SIDTAB_RCACHE_SIZE; i++) {
> > -             u32 v = READ_ONCE(s->rcache[i]);
> > -
> > -             if (v >= SIDTAB_MAX)
> > -                     continue;
> > -
> > -             if (context_cmp(sidtab_do_lookup(s, v, 0), context)) {
> > -                     sidtab_rcache_update(s, v, i);
> > -                     *index = v;
> > -                     return 0;
> > -             }
> > -     }
> > -     return -ENOENT;
> > -}
> > -
> > -static int sidtab_reverse_lookup(struct sidtab *s, struct context *context,
> > -                              u32 *index)
> > +int sidtab_context_to_sid(struct sidtab *s, struct context *context,
> > +                       u32 *sid)
> >   {
> >       unsigned long flags;
> > -     u32 count, count_locked, level, pos;
> > +     u32 count;
> >       struct sidtab_convert_params *convert;
> > -     struct context *dst, *dst_convert;
> > +     struct sidtab_entry_leaf *dst, *dst_convert;
> >       int rc;
> >
> > -     rc = sidtab_rcache_search(s, context, index);
> > -     if (rc == 0)
> > -             return 0;
> > -
> > -     /* read entries only after reading count */
> > -     count = smp_load_acquire(&s->count);
> > -     level = sidtab_level_from_count(count);
> > -
> > -     pos = 0;
> > -     rc = sidtab_find_context(s->roots[level], &pos, count, level,
> > -                              context, index);
> > -     if (rc == 0) {
> > -             sidtab_rcache_push(s, *index);
> > +     *sid = context_to_sid(s, context);
> > +     if (*sid)
> >               return 0;
> > -     }
> >
> >       /* lock-free search failed: lock, re-search, and insert if not found */
> >       spin_lock_irqsave(&s->lock, flags);
> >
> > +     rc = 0;
> > +     *sid = context_to_sid(s, context);
> > +     if (*sid)
> > +             goto out_unlock;
> > +
> > +     /* read entries only after reading count */
> > +     count = smp_load_acquire(&s->count);
> >       convert = s->convert;
> > -     count_locked = s->count;
> > -     level = sidtab_level_from_count(count_locked);
> > -
> > -     /* if count has changed before we acquired the lock, then catch up */
> > -     while (count < count_locked) {
> > -             if (context_cmp(sidtab_do_lookup(s, count, 0), context)) {
> > -                     sidtab_rcache_push(s, count);
> > -                     *index = count;
> > -                     rc = 0;
> > -                     goto out_unlock;
> > -             }
> > -             ++count;
> > -     }
> >
> >       /* bail out if we already reached max entries */
> >       rc = -EOVERFLOW;
> > @@ -293,7 +270,9 @@ static int sidtab_reverse_lookup(struct sidtab *s, struct context *context,
> >       if (!dst)
> >               goto out_unlock;
> >
> > -     rc = context_cpy(dst, context);
> > +     dst->sid = index_to_sid(count);
> > +
> > +     rc = context_cpy(&dst->context, context);
> >       if (rc)
> >               goto out_unlock;
> >
> > @@ -305,29 +284,32 @@ static int sidtab_reverse_lookup(struct sidtab *s, struct context *context,
> >               rc = -ENOMEM;
> >               dst_convert = sidtab_do_lookup(convert->target, count, 1);
> >               if (!dst_convert) {
> > -                     context_destroy(dst);
> > +                     context_destroy(&dst->context);
> >                       goto out_unlock;
> >               }
> >
> > -             rc = convert->func(context, dst_convert, convert->args);
> > +             rc = convert->func(context, &dst_convert->context,
> > +                             convert->args);
> >               if (rc) {
> > -                     context_destroy(dst);
> > +                     context_destroy(&dst->context);
> >                       goto out_unlock;
> >               }
> > -
> > -             /* at this point we know the insert won't fail */
> > +             dst_convert->sid = index_to_sid(count);
> >               convert->target->count = count + 1;
> > +
> > +             hash_add_rcu(convert->target->context_to_sid,
> > +                             &dst_convert->list, dst_convert->context.hash);
> >       }
> >
> >       if (context->len)
> >               pr_info("SELinux:  Context %s is not valid (left unmapped).\n",
> >                       context->str);
> >
> > -     sidtab_rcache_push(s, count);
> > -     *index = count;
> > +     *sid = index_to_sid(count);
> >
> > -     /* write entries before writing new count */
> > +     /* Write entries before updating count. */
> >       smp_store_release(&s->count, count + 1);
> > +     hash_add_rcu(s->context_to_sid, &dst->list, dst->context.hash);
> >
> >       rc = 0;
> >   out_unlock:
> > @@ -335,25 +317,19 @@ static int sidtab_reverse_lookup(struct sidtab *s, struct context *context,
> >       return rc;
> >   }
> >
> > -int sidtab_context_to_sid(struct sidtab *s, struct context *context, u32 *sid)
> > +static void sidtab_convert_hashtable(struct sidtab *s, u32 count)
> >   {
> > -     int rc;
> > +     struct sidtab_entry_leaf *entry;
> >       u32 i;
> >
> > -     for (i = 0; i < SECINITSID_NUM; i++) {
> > -             struct sidtab_isid_entry *entry = &s->isids[i];
> > +     for (i = 0; i < count; i++) {
> > +             entry = sidtab_do_lookup(s, i, 0);
> > +             entry->sid = index_to_sid(i);
> >
> > -             if (entry->set && context_cmp(context, &entry->context)) {
> > -                     *sid = i + 1;
> > -                     return 0;
> > -             }
> > -     }
> > +             hash_add_rcu(s->context_to_sid, &entry->list,
> > +                             entry->context.hash);
> >
> > -     rc = sidtab_reverse_lookup(s, context, sid);
> > -     if (rc)
> > -             return rc;
> > -     *sid += SECINITSID_NUM + 1;
> > -     return 0;
> > +     }
> >   }
> >
> >   static int sidtab_convert_tree(union sidtab_entry_inner *edst,
> > @@ -400,6 +376,7 @@ static int sidtab_convert_tree(union sidtab_entry_inner *edst,
> >               }
> >               cond_resched();
> >       }
> > +
> >       return 0;
> >   }
> >
> > @@ -435,7 +412,7 @@ int sidtab_convert(struct sidtab *s, struct sidtab_convert_params *params)
> >       /* enable live convert of new entries */
> >       s->convert = params;
> >
> > -     /* we can safely do the rest of the conversion outside the lock */
> > +     /* we can safely convert the tree outside the lock */
> >       spin_unlock_irqrestore(&s->lock, flags);
> >
> >       pr_info("SELinux:  Converting %u SID table entries...\n", count);
> > @@ -449,8 +426,17 @@ int sidtab_convert(struct sidtab *s, struct sidtab_convert_params *params)
> >               spin_lock_irqsave(&s->lock, flags);
> >               s->convert = NULL;
> >               spin_unlock_irqrestore(&s->lock, flags);
> > +             return rc;
> >       }
> > -     return rc;
> > +     /*
> > +      * The hashtable can also be modified in sidtab_context_to_sid()
> > +      * so we must re-acquire the lock here.
> > +      */
> > +     spin_lock_irqsave(&s->lock, flags);
> > +     sidtab_convert_hashtable(params->target, count);
> > +     spin_unlock_irqrestore(&s->lock, flags);
> > +
> > +     return 0;
> >   }
> >
> >   static void sidtab_destroy_tree(union sidtab_entry_inner entry, u32 level)
> > @@ -484,11 +470,16 @@ void sidtab_destroy(struct sidtab *s)
> >
> >       for (i = 0; i < SECINITSID_NUM; i++)
> >               if (s->isids[i].set)
> > -                     context_destroy(&s->isids[i].context);
> > +                     context_destroy(&s->isids[i].leaf.context);
> >
> >       level = SIDTAB_MAX_LEVEL;
> >       while (level && !s->roots[level].ptr_inner)
> >               --level;
> >
> >       sidtab_destroy_tree(s->roots[level], level);
> > +     /*
> > +      * The context_to_sid hashtable's objects are all shared
> > +      * with the isids array and context tree, and so don't need
> > +      * to be cleaned up here.
> > +      */
> >   }
> > diff --git a/security/selinux/ss/sidtab.h b/security/selinux/ss/sidtab.h
> > index 1f4763141aa1..27e68babc1b8 100644
> > --- a/security/selinux/ss/sidtab.h
> > +++ b/security/selinux/ss/sidtab.h
> > @@ -13,11 +13,14 @@
> >
> >   #include <linux/spinlock_types.h>
> >   #include <linux/log2.h>
> > +#include <linux/hashtable.h>
> >
> >   #include "context.h"
> >
> >   struct sidtab_entry_leaf {
> > +     u32 sid;
> >       struct context context;
> > +     struct hlist_node list;
> >   };
> >
> >   struct sidtab_node_inner;
> > @@ -48,7 +51,7 @@ union sidtab_entry_inner {
> >                    SIDTAB_INNER_SHIFT)
> >
> >   struct sidtab_node_leaf {
> > -     struct sidtab_entry_leaf entries[SIDTAB_LEAF_ENTRIES];
> > +     struct sidtab_entry_leaf __rcu entries[SIDTAB_LEAF_ENTRIES];
> >   };
> >
> >   struct sidtab_node_inner {
> > @@ -57,7 +60,7 @@ struct sidtab_node_inner {
> >
> >   struct sidtab_isid_entry {
> >       int set;
> > -     struct context context;
> > +     struct sidtab_entry_leaf leaf;
> >   };
> >
> >   struct sidtab_convert_params {
> > @@ -66,7 +69,8 @@ struct sidtab_convert_params {
> >       struct sidtab *target;
> >   };
> >
> > -#define SIDTAB_RCACHE_SIZE 3
> > +#define SIDTAB_HASH_BITS CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS
> > +#define SIDTAB_HASH_BUCKETS (1 << SIDTAB_HASH_BITS)
> >
> >   struct sidtab {
> >       /*
> > @@ -83,11 +87,11 @@ struct sidtab {
> >       struct sidtab_convert_params *convert;
> >       spinlock_t lock;
> >
> > -     /* reverse lookup cache - access atomically via {READ|WRITE}_ONCE() */
> > -     u32 rcache[SIDTAB_RCACHE_SIZE];
> > -
> >       /* index == SID - 1 (no entry for SECSID_NULL) */
> >       struct sidtab_isid_entry isids[SECINITSID_NUM];
> > +
> > +     /* Hash table for fast reverse context-to-sid lookups. */
> > +     DECLARE_HASHTABLE(context_to_sid, SIDTAB_HASH_BITS);
> >   };
> >
> >   int sidtab_init(struct sidtab *s);
> > @@ -101,6 +105,8 @@ int sidtab_context_to_sid(struct sidtab *s, struct context *context, u32 *sid);
> >
> >   void sidtab_destroy(struct sidtab *s);
> >
> > +int sidtab_hash_stats(struct sidtab *sidtab, char *page);
> > +
> >   #endif      /* _SS_SIDTAB_H_ */
> >
> >
> >
>
