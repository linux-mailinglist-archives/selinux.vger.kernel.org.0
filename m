Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4084649D5B1
	for <lists+selinux@lfdr.de>; Wed, 26 Jan 2022 23:51:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbiAZWva (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 26 Jan 2022 17:51:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbiAZWva (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 26 Jan 2022 17:51:30 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91756C06173B
        for <selinux@vger.kernel.org>; Wed, 26 Jan 2022 14:51:29 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id o12so1617494eju.13
        for <selinux@vger.kernel.org>; Wed, 26 Jan 2022 14:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yQNdbADTGqyfyu/xlW8lKU6Q7NNIee/5AQO9Up6diCk=;
        b=ywxG3Q0KHzQUMQQN7Ob6DXR1DiOlvSyMsvzbbIbsVd0FsO8SQND8SPfj0XDHYexe4q
         /x0mOKHk/5DC1nVotLg6bErkOE8jQ74Bp9mPKS85qEt2eApquHIGAZ3QhlHibgEgBh8F
         YVM5m++JQJXjg4an3828MSZPln4ZgkYrWdPBJoC6WTJI7JYBmtbOqQBHOJ40iwDxzOac
         9sqc52uaoZeaZ8IHptSI0U1iVdB0Z0AsOtJZuNXzsl+Grz62lL75ih5ylMSdJBA3Rsqj
         ls1bp3K4P4i0t9KFaUx8Z+MwlRyN99g5wvvXzxzshhEeQoK2jmfXVBJ/bRPGXcKRZgKs
         10eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yQNdbADTGqyfyu/xlW8lKU6Q7NNIee/5AQO9Up6diCk=;
        b=Ga2WZ0RZf/CPWhYKExmAg1bLYnlAF+iuXc8FaICp6uaNuhkr8XdKy1JdQvHYC619yV
         DtXK1KMidqhMUU4GAEtoXPMGQL5fOaptEZMD+R7oH9bf3fEWcTfwmVknkRhIiXN5P5E1
         d5jaXYVKoP8XBZLyQSy1ycZ+89i6jLdsbM6FlbLUruS7zeX14O+mwuwFej7BLaWq9RoJ
         mNAkGR8QGOYqntepsNFIgMo+MyqqDy/nkcemWwoYut4mwqAZ0DV840uSrOMdgpAdstmQ
         c1dXaIX3jR+EJaP2waRTK4qbTkdGvV5glSPr3v8Z57WhkaVERgjgIER9IpPUj9dKLdp0
         W7uQ==
X-Gm-Message-State: AOAM530UrTL8Or/pzLg7yCmiSaqj6qkETQrLlZK1vyawQt93V/jHGVYM
        KMgb9NRGksdss+JyRJO64uMuM9D1ng4o4Iv4EjKqI+IVXiIy
X-Google-Smtp-Source: ABdhPJzee4cIKHHNaTZgFWGv4l47cr1Lx23XgpGyuF7sBtewVucu2hKWSuwU70TORjubtzwhq6IrZ+UNdDsMt9Q2m+E=
X-Received: by 2002:a17:906:1e06:: with SMTP id g6mr689463ejj.517.1643237488104;
 Wed, 26 Jan 2022 14:51:28 -0800 (PST)
MIME-Version: 1.0
References: <20220125145931.56831-1-cgzones@googlemail.com>
In-Reply-To: <20220125145931.56831-1-cgzones@googlemail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 26 Jan 2022 17:51:16 -0500
Message-ID: <CAHC9VhTCf4L9rif-+7gTK64JoUiDv28DFwS1vUsvzv8rG+JCuQ@mail.gmail.com>
Subject: Re: [RFC PATCH] selinux: split no transition execve check
To:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc:     selinux@vger.kernel.org,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        "David S. Miller" <davem@davemloft.net>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Xiong Zhenwu <xiong.zhenwu@zte.com.cn>,
        Tyler Hicks <tyhicks@linux.microsoft.com>,
        linux-kernel@vger.kernel.org, selinux-refpolicy@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Jan 25, 2022 at 9:59 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> In case a setuid or setgid binary is mislabeled with a generic context,
> either via a policy mistake or a move by the distribution package,
> executing it will be checked by the file permission execute_no_trans on
> the generic file context (e.g. bin_t).  The setuid(2)/setgid(2) syscall
> within will then be checked against the unchanged caller process
> context, which might have been granted the capability permission setuid/
> setgid to initially drop privileges.  To avoid that scenario split the
> execute_no_trans permission in case of a setuid/setgid binary into a new
> permission execute_sxid_no_trans.
>
> For backward compatibility this behavior is contained in a new policy
> capability.
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
>  security/selinux/hooks.c                   | 9 ++++++++-
>  security/selinux/include/classmap.h        | 2 +-
>  security/selinux/include/policycap.h       | 1 +
>  security/selinux/include/policycap_names.h | 3 ++-
>  security/selinux/include/security.h        | 8 ++++++++
>  5 files changed, 20 insertions(+), 3 deletions(-)

Adding the refpolicy list to this thread as their opinion seems
particularly relevant to this discussion.

FWIW, this looks reasonable to me but I would like to hear what others
have to say.

> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 5b6895e4fc29..b825fee39a70 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -2348,9 +2348,16 @@ static int selinux_bprm_creds_for_exec(struct linu=
x_binprm *bprm)
>         ad.u.file =3D bprm->file;
>
>         if (new_tsec->sid =3D=3D old_tsec->sid) {
> +               u32 perm;
> +
> +               if (selinux_policycap_execute_sxid_no_trans() && is_sxid(=
inode->i_mode))
> +                       perm =3D FILE__EXECUTE_SXID_NO_TRANS;
> +               else
> +                       perm =3D FILE__EXECUTE_NO_TRANS;
> +
>                 rc =3D avc_has_perm(&selinux_state,
>                                   old_tsec->sid, isec->sid,
> -                                 SECCLASS_FILE, FILE__EXECUTE_NO_TRANS, =
&ad);
> +                                 SECCLASS_FILE, perm, &ad);
>                 if (rc)
>                         return rc;
>         } else {
> diff --git a/security/selinux/include/classmap.h b/security/selinux/inclu=
de/classmap.h
> index 35aac62a662e..53a1eeeb86fb 100644
> --- a/security/selinux/include/classmap.h
> +++ b/security/selinux/include/classmap.h
> @@ -65,7 +65,7 @@ struct security_class_mapping secclass_map[] =3D {
>             "quotaget", "watch", NULL } },
>         { "file",
>           { COMMON_FILE_PERMS,
> -           "execute_no_trans", "entrypoint", NULL } },
> +           "execute_no_trans", "entrypoint", "execute_sxid_no_trans", NU=
LL } },
>         { "dir",
>           { COMMON_FILE_PERMS, "add_name", "remove_name",
>             "reparent", "search", "rmdir", NULL } },
> diff --git a/security/selinux/include/policycap.h b/security/selinux/incl=
ude/policycap.h
> index 2ec038efbb03..23929dc3e1db 100644
> --- a/security/selinux/include/policycap.h
> +++ b/security/selinux/include/policycap.h
> @@ -11,6 +11,7 @@ enum {
>         POLICYDB_CAPABILITY_CGROUPSECLABEL,
>         POLICYDB_CAPABILITY_NNP_NOSUID_TRANSITION,
>         POLICYDB_CAPABILITY_GENFS_SECLABEL_SYMLINKS,
> +       POLICYDB_CAPABILITY_EXECUTE_SXID_NO_TRANS,
>         __POLICYDB_CAPABILITY_MAX
>  };
>  #define POLICYDB_CAPABILITY_MAX (__POLICYDB_CAPABILITY_MAX - 1)
> diff --git a/security/selinux/include/policycap_names.h b/security/selinu=
x/include/policycap_names.h
> index b89289f092c9..4c014c2cf352 100644
> --- a/security/selinux/include/policycap_names.h
> +++ b/security/selinux/include/policycap_names.h
> @@ -12,7 +12,8 @@ const char *selinux_policycap_names[__POLICYDB_CAPABILI=
TY_MAX] =3D {
>         "always_check_network",
>         "cgroup_seclabel",
>         "nnp_nosuid_transition",
> -       "genfs_seclabel_symlinks"
> +       "genfs_seclabel_symlinks",
> +       "execute_sxid_no_trans",
>  };
>
>  #endif /* _SELINUX_POLICYCAP_NAMES_H_ */
> diff --git a/security/selinux/include/security.h b/security/selinux/inclu=
de/security.h
> index ac0ece01305a..ab95241b6b7b 100644
> --- a/security/selinux/include/security.h
> +++ b/security/selinux/include/security.h
> @@ -219,6 +219,14 @@ static inline bool selinux_policycap_genfs_seclabel_=
symlinks(void)
>         return READ_ONCE(state->policycap[POLICYDB_CAPABILITY_GENFS_SECLA=
BEL_SYMLINKS]);
>  }
>
> +static inline bool selinux_policycap_execute_sxid_no_trans(void)
> +{
> +       struct selinux_state *state =3D &selinux_state;
> +
> +       return READ_ONCE(state->policycap[POLICYDB_CAPABILITY_EXECUTE_SXI=
D_NO_TRANS]);
> +}
> +
> +
>  struct selinux_policy_convert_data;
>
>  struct selinux_load_state {
> --
> 2.34.1
>


--=20
paul-moore.com
