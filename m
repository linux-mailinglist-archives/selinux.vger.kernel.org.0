Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2A983047C7
	for <lists+selinux@lfdr.de>; Tue, 26 Jan 2021 20:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388857AbhAZF4m (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 26 Jan 2021 00:56:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50694 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730275AbhAYPpd (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 25 Jan 2021 10:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611589445;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KqL2HMb0MGgl4H/ej8Ody4hZh50x7AhurKsdID6/vTE=;
        b=dG3PBN86JIjRZ2qerqJHc0/t+/4BrNFi1vyqEDvruHs8LZGgWujJ5ypgR4VHskYe81SZqq
        sGL33hho+ewEJHk6DFkdN6oHkna5nZX7NmZHZdVuNoQR9b8S8BAD4sYvE6I1oFpIVZkEDT
        5ZtJRLuAbtL0tMDiCH2MAeF6jERwovM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-OiRQeDzYM2Kb3_WOa-7r-A-1; Mon, 25 Jan 2021 10:44:00 -0500
X-MC-Unique: OiRQeDzYM2Kb3_WOa-7r-A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76328107ACE4;
        Mon, 25 Jan 2021 15:43:59 +0000 (UTC)
Received: from localhost (unknown [10.40.193.58])
        by smtp.corp.redhat.com (Postfix) with ESMTP id ACE4A60C47;
        Mon, 25 Jan 2021 15:43:58 +0000 (UTC)
From:   Petr Lautrbach <plautrba@redhat.com>
To:     SElinux list <selinux@vger.kernel.org>
Cc:     Nicolas Iooss <nicolas.iooss@m4x.org>,
        Christian =?utf-8?Q?G=C3=B6ttsc?= =?utf-8?Q?he?= 
        <cgzones@googlemail.com>
Subject: Re: [PATCH] newrole: preserve environment variable XDG_RUNTIME_DIR
In-Reply-To: <CAJfZ7=kvVcix_qbTywWAF8v3HHrRx13qeAaW9GQrLHR83cDaow@mail.gmail.com>
References: <20210106133449.193940-1-cgzones@googlemail.com>
 <CAJfZ7=kvVcix_qbTywWAF8v3HHrRx13qeAaW9GQrLHR83cDaow@mail.gmail.com>
Date:   Mon, 25 Jan 2021 16:43:57 +0100
Message-ID: <87im7l10oy.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Nicolas Iooss <nicolas.iooss@m4x.org> writes:

> On Wed, Jan 6, 2021 at 2:36 PM Christian G=C3=B6ttsche
> <cgzones@googlemail.com> wrote:
>>
>> XDG_RUNTIME_DIR is required for systemctl --user to work.
>> See https://github.com/systemd/systemd/issues/15231
>>
>> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
>> ---
>>  policycoreutils/newrole/newrole.c | 20 +++++++++++++++-----
>>  1 file changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/policycoreutils/newrole/newrole.c b/policycoreutils/newrole=
/newrole.c
>> index 36e2ba9c..500969e0 100644
>> --- a/policycoreutils/newrole/newrole.c
>> +++ b/policycoreutils/newrole/newrole.c
>> @@ -466,7 +466,7 @@ static int extract_pw_data(struct passwd *pw_copy)
>>   * Either restore the original environment, or set up a minimal one.
>>   *
>>   * The minimal environment contains:
>> - * TERM, DISPLAY and XAUTHORITY - if they are set, preserve values
>> + * TERM, DISPLAY, XAUTHORITY and XDG_RUNTIME_DIR - if they are set, pre=
serve values
>>   * HOME, SHELL, USER and LOGNAME - set to contents of /etc/passwd
>>   * PATH - set to default value DEFAULT_PATH
>>   *
>> @@ -478,9 +478,11 @@ static int restore_environment(int preserve_environ=
ment,
>>         char const *term_env;
>>         char const *display_env;
>>         char const *xauthority_env;
>> -       char *term =3D NULL;      /* temporary container */
>> -       char *display =3D NULL;   /* temporary container */
>> +       char const *xdg_runtime_dir_env;
>> +       char *term =3D NULL;              /* temporary container */
>> +       char *display =3D NULL;           /* temporary container */
>>         char *xauthority =3D NULL;        /* temporary container */
>> +       char *xdg_runtime_dir =3D NULL;   /* temporary container */
>>         int rc;
>>
>>         environ =3D old_environ;
>> @@ -491,6 +493,7 @@ static int restore_environment(int preserve_environm=
ent,
>>         term_env =3D getenv("TERM");
>>         display_env =3D getenv("DISPLAY");
>>         xauthority_env =3D getenv("XAUTHORITY");
>> +       xdg_runtime_dir_env =3D getenv("XDG_RUNTIME_DIR");        /* nee=
ded for `systemd --user` operations */
>>
>>         /* Save the variable values we want */
>>         if (term_env)
>> @@ -499,8 +502,12 @@ static int restore_environment(int preserve_environ=
ment,
>>                 display =3D strdup(display_env);
>>         if (xauthority_env)
>>                 xauthority =3D strdup(xauthority_env);
>> -       if ((term_env && !term) || (display_env && !display) ||
>> -           (xauthority_env && !xauthority)) {
>> +       if (xdg_runtime_dir_env)
>> +               xdg_runtime_dir =3D strdup(xdg_runtime_dir_env);
>> +       if ((term_env && !term) ||
>> +           (display_env && !display) ||
>> +           (xauthority_env && !xauthority) ||
>> +           (xdg_runtime_dir_env && !xdg_runtime_dir)) {
>>                 rc =3D -1;
>>                 goto out;
>>         }
>> @@ -518,6 +525,8 @@ static int restore_environment(int preserve_environm=
ent,
>>                 rc |=3D setenv("DISPLAY", display, 1);
>>         if (xauthority)
>>                 rc |=3D setenv("XAUTHORITY", xauthority, 1);
>> +       if (xdg_runtime_dir)
>> +               rc |=3D setenv("XDG_RUNTIME_DIR", xdg_runtime_dir, 1);
>>         rc |=3D setenv("HOME", pw->pw_dir, 1);
>>         rc |=3D setenv("SHELL", pw->pw_shell, 1);
>>         rc |=3D setenv("USER", pw->pw_name, 1);
>> @@ -527,6 +536,7 @@ static int restore_environment(int preserve_environm=
ent,
>>         free(term);
>>         free(display);
>>         free(xauthority);
>> +       free(xdg_runtime_dir);
>>         return rc;
>>  }
>
> Hello,
> I am quite uncomfortable with this approach of keeping only one more
> variable: why is only XDG_RUNTIME_DIR added, and not also
> XDG_DATA_DIRS, XDG_SESSION_ID, XDG_SESSION_PATH, etc.? For example
> someone pointed out in
> https://github.com/systemd/systemd/issues/18301#issuecomment-763933678
> that DBUS_SESSION_BUS_ADDRESS could also need to be preserved, so
> there seem to be a long list of items.
>
> Moreover I am wondering whether this would be fine to keep such
> environment variables while newrole uses the information from another
> user (i.e. when newrole is built with USE_AUDIT and
> audit_getloginuid() !=3D getuid() because the user changed their UID ;
> in such a situation newrole resets $HOME and $SHELL to the HOME of
> audit_getloginuid()).
>
> In my humble opinion, I also do not understand why TERM, DISPLAY and
> XAUTHORITY are kept but not LANG, LC_ALL, and all other LC_...
> variables. I understand that there exist dangerous environment
> variables (LD_LIBRARY_PATH, LD_PRELOAD, ...), that resetting the
> environment to a minimal one is nice, and that using "newrole
> --preserve-environment" could seem dangerous. For information, sudo
> has been maintaining a list of "bad" variables, of variables with
> potential dangerous values and of variables preserved by default, in
> https://github.com/sudo-project/sudo/blob/SUDO_1_9_5p1/plugins/sudoers/en=
v.c#L134-L228.
>
> This being said, I have never really used newrole but to expose a bug
> in "sudo -r" a few years ago
> (https://bugzilla.sudo.ws/show_bug.cgi?id=3D611 "root user can change
> its SELinux context without password"). Since then I have always used
> sudo to change role, with the advantage that it can be configured to
> keep some environment variables, so I am not really the best reviewer
> for such a patch (and also I am a little bit confused about the
> "isolation guarantees" that newrole implements, and I am not sure
> whether keeping XDG_RUNTIME_DIR would not break such guarantees).
>
> TL;DR: can another maintainer more familiar with newrole review this
> patch, please?
>

From my POV, it does not make much sense to keep XDG_RUNTIME_DIR

As I see it when you change a role, type or level, it's like changing a
linux user and it should be completely new session.

Also using Fedora policy, sysadm_t is not even allow to get status of
staff_t units:

    [staff@rawhide ~]$ echo $XDG_RUNTIME_DIR
    /run/user/1001
    [staff@rawhide ~]$ newrole -r sysadm_r
    Password:=20
    [staff@rawhide ~]$ export XDG_RUNTIME_DIR=3D/run/user/1001
    [staff@rawhide ~]$ systemctl --user list-units
    Failed to list units: Access denied

    systemd[33326]: selinux: avc:  denied  { status } for auid=3Dn/a uid=3D=
1001 gid=3D1001 cmdline=3D"" scontext=3Dstaff_u:sysadm_r:sysadm_t:s0-s0:c0.=
c1023 tcontext=3Dstaff_u:staff_r:staff_t:s0-s0:c0.c1023 tclass=3Dsystem per=
missive=3D0
    systemd[33326]: selinux: avc:  denied  { status } for auid=3Dn/a uid=3D=
1001 gid=3D1001 cmdline=3D"" scontext=3Dstaff_u:sysadm_r:sysadm_t:s0-s0:c0.=
c1023 tcontext=3Dstaff_u:staff_r:staff_t:s0-s0:c0.c1023 tclass=3Dsystem per=
missive=3D0

newrole could change level as well and it would be simply inappropriate
to control systemd user session using different levels.

And you don't need to run newrole to control your user systemd session.

