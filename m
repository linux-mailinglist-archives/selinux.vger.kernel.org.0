Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD08192B90
	for <lists+selinux@lfdr.de>; Wed, 25 Mar 2020 15:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbgCYOzN (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 25 Mar 2020 10:55:13 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:37483 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727319AbgCYOzN (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 25 Mar 2020 10:55:13 -0400
Received: by mail-il1-f196.google.com with SMTP id a6so2106419ilr.4
        for <selinux@vger.kernel.org>; Wed, 25 Mar 2020 07:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=a+cEPEplU6jSiPfTJtO0+vEtDhz8qRSPpPGPCC1KCQE=;
        b=uIdmGACJnyvZZGtNQaTyNruz4uOBq3XkuKs6eZFlrvrHepJBW9odmJ+bOLV/3zPvaW
         3iN+curtxcG6Gu7v/RFd0foC8M0GtUAEy3t/NIzfjlkwcewW6zRgmdoUmXMYm9PWIlu4
         o5Y+gW2YpNNYrJYYbaRqNc3jBOnaEQJ5KWW+6bq8uNVy5vLMecpS7dfukJfmHNQ6Z2E0
         x1uCQW4j+6FM56zLChbIT/VfpZFMjR1Mdp+8Jw7MlXZgsMrvjBxWAY+2lUAetcVo45bB
         psvCyACUk/Mzq2ZX1KXl7BHRyvAx454uQr2Y63wVPficoFCqRc58LX2d8AwVFC9d/EjR
         8D6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=a+cEPEplU6jSiPfTJtO0+vEtDhz8qRSPpPGPCC1KCQE=;
        b=NQdOVckOiCkLaahfOHZlqLh7HlQHKAJ/a3OAB+v1GdpegcNZzgQ/6DeC/97icgLP7S
         XdWXJ7hN9dOFDiIDkoj6lofXAZy5ta/LA96jHxpWYtQc9TrzJMTsl5lU78Hp0SMedRbZ
         CfpSbIiJHP6SwkJS/EpsWIDPaslul73vGSfJK4bGElY5y3NWfToNJNQL9PfTSf+ylM2j
         0ZZH7PIcrSds88QWYTTDITu28WRzxyapC3aDE/jsgAlLpXKB3zLuG9bV2HsJMqXPEGb5
         SK09D1iaW+LR6j2ygtW3Bvgcs6RVyLN8gkSLVjqlhM+xI6McPduxVcXF0BW7t2961g3r
         mkEg==
X-Gm-Message-State: ANhLgQ1rzdSamqOPPa3a3m1ffOla++BDB3EzD9BE+2XYuDu4sWXEF+SO
        dHh59raZECOrZa3OPZQXip6q4kUeGGPtTSvk+IE=
X-Google-Smtp-Source: ADFU+vu4dlUyDUI81UjMj+lULSiYMh8rwxrHwEk7uhrT6IBCwm8kEY6BIzfi9l10NjoYMh6zWesfgKSbA1mKssylsXk=
X-Received: by 2002:a92:d111:: with SMTP id a17mr3818181ilb.163.1585148111667;
 Wed, 25 Mar 2020 07:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200323183130.17307-1-cgzones@googlemail.com> <476DC76E7D1DF2438D32BFADF679FC5649EB1C16@ORSMSX101.amr.corp.intel.com>
In-Reply-To: <476DC76E7D1DF2438D32BFADF679FC5649EB1C16@ORSMSX101.amr.corp.intel.com>
From:   William Roberts <bill.c.roberts@gmail.com>
Date:   Wed, 25 Mar 2020 09:55:00 -0500
Message-ID: <CAFftDdrCo-CfhrCxxCWx_9A2WcUpJ1KH=YztoOn32eNVg3riAA@mail.gmail.com>
Subject: Re: [PATCH] tree-wide: replace last occurrences of security_context_t
To:     "Roberts, William C" <william.c.roberts@intel.com>
Cc:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Mar 23, 2020 at 3:00 PM Roberts, William C
<william.c.roberts@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: selinux-owner@vger.kernel.org [mailto:selinux-owner@vger.kernel.o=
rg]
> > On Behalf Of Christian G=C3=B6ttsche
> > Sent: Monday, March 23, 2020 1:32 PM
> > To: selinux@vger.kernel.org
> > Subject: [PATCH] tree-wide: replace last occurrences of security_contex=
t_t
> >
> > Follow-up of: 9eb9c9327563014ad6a807814e7975424642d5b9 ("Get rid of
> > security_context_t and fix const declarations.")
> >
> > Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> > ---
> >  mcstrans/src/mcscolor.c             |  8 +++---
> >  mcstrans/src/mcstrans.c             | 12 ++++-----
> >  mcstrans/src/mcstrans.h             |  4 +--
> >  mcstrans/src/mcstransd.c            |  6 ++---
> >  mcstrans/utils/transcon.c           |  2 +-
> >  mcstrans/utils/untranscon.c         |  2 +-
> >  policycoreutils/newrole/newrole.c   | 40 ++++++++++++++---------------
> >  policycoreutils/run_init/run_init.c |  4 +--
> >  policycoreutils/secon/secon.c       | 19 +++++++-------
> >  sandbox/seunshare.c                 | 10 ++++----
> >  10 files changed, 54 insertions(+), 53 deletions(-)
> >
> > diff --git a/mcstrans/src/mcscolor.c b/mcstrans/src/mcscolor.c index
> > 4ee0db50..a3838850 100644
> > --- a/mcstrans/src/mcscolor.c
> > +++ b/mcstrans/src/mcscolor.c
> > @@ -44,7 +44,7 @@ static setab_t *clist[N_COLOR];  static setab_t
> > *cend[N_COLOR];  static semnemonic_t *mnemonics;
> >
> > -static security_context_t my_context;
> > +static char *my_context;
> >
> >  void finish_context_colors(void) {
> >       setab_t *cur, *next;
> > @@ -76,7 +76,7 @@ void finish_context_colors(void) {  }
> >
> >  static int check_dominance(const char *pattern, const char *raw) {
> > -     security_context_t ctx;
> > +     char *ctx;
> >       context_t con;
> >       struct av_decision avd;
> >       int rc =3D -1;
> > @@ -109,7 +109,7 @@ static int check_dominance(const char *pattern, con=
st
> > char *raw) {
> >       if (!raw)
> >               goto out;
> >
> > -     rc =3D security_compute_av_raw(ctx, (security_context_t)raw,
> > context_class, context_contains_perm, &avd);
> > +     rc =3D security_compute_av_raw(ctx, raw, context_class,
> > +context_contains_perm, &avd);
> >       if (rc)
> >               goto out;
> >
> > @@ -282,7 +282,7 @@ static int parse_components(context_t con, char
> > **components) {
> >
> >  /* Look up colors.
> >   */
> > -int raw_color(const security_context_t raw, char **color_str) {
> > +int raw_color(const char *raw, char **color_str) {
> >  #define CHARS_PER_COLOR 16
> >       context_t con;
> >       uint32_t i, j, mask =3D 0;
> > diff --git a/mcstrans/src/mcstrans.c b/mcstrans/src/mcstrans.c index
> > 96bdbdff..4a073ca4 100644
> > --- a/mcstrans/src/mcstrans.c
> > +++ b/mcstrans/src/mcstrans.c
> > @@ -7,8 +7,8 @@
> >
> >   int init_translations(void);
> >   void finish_context_translations(void);
> > - int trans_context(const security_context_t, security_context_t *);
> > - int untrans_context(const security_context_t, security_context_t *);
> > + int trans_context(const char *, char **); int untrans_context(const
> > + char *, char **);
> >
> >  */
> >
> > @@ -888,7 +888,7 @@ init_translations(void) {  }
> >
> >  char *
> > -extract_range(const security_context_t incon) {
> > +extract_range(const char *incon) {
> >       context_t con =3D context_new(incon);
> >       if (!con) {
> >               syslog(LOG_ERR, "extract_range context_new(%s) failed: %s=
",
> > incon, strerror(errno)); @@ -911,7 +911,7 @@ extract_range(const
> > security_context_t incon) {  }
> >
> >  char *
> > -new_context_str(const security_context_t incon, const char *range) {
> > +new_context_str(const char *incon, const char *range) {
> >       char *rcon =3D NULL;
> >       context_t con =3D context_new(incon);
> >       if (!con) {
> > @@ -1489,7 +1489,7 @@ err:
> >  }
> >
> >  int
> > -trans_context(const security_context_t incon, security_context_t *rcon=
) {
> > +trans_context(const char *incon, char **rcon) {
> >       char *trans =3D NULL;
> >       *rcon =3D NULL;
> >
> > @@ -1612,7 +1612,7 @@ trans_context(const security_context_t incon,
> > security_context_t *rcon) {  }
> >
> >  int
> > -untrans_context(const security_context_t incon, security_context_t *rc=
on) {
> > +untrans_context(const char *incon, char **rcon) {
> >       char *raw =3D NULL;
> >       *rcon =3D NULL;
> >
> > diff --git a/mcstrans/src/mcstrans.h b/mcstrans/src/mcstrans.h index
> > a2f68c18..e5cda93b 100644
> > --- a/mcstrans/src/mcstrans.h
> > +++ b/mcstrans/src/mcstrans.h
> > @@ -4,6 +4,6 @@
> >
> >  extern int init_translations(void);
> >  extern void finish_context_translations(void);
> > -extern int trans_context(const security_context_t, security_context_t =
*); -
> > extern int untrans_context(const security_context_t, security_context_t=
 *);
> > +extern int trans_context(const char *, char **); extern int
> > +untrans_context(const char *, char **);
> >
> > diff --git a/mcstrans/src/mcstransd.c b/mcstrans/src/mcstransd.c index
> > 85899493..07c052fd 100644
> > --- a/mcstrans/src/mcstransd.c
> > +++ b/mcstrans/src/mcstransd.c
> > @@ -45,12 +45,12 @@
> >
> >  extern int init_translations(void);
> >  extern void finish_context_translations(void);
> > -extern int trans_context(const security_context_t, security_context_t =
*); -
> > extern int untrans_context(const security_context_t, security_context_t=
 *);
> > +extern int trans_context(const char *, char **); extern int
> > +untrans_context(const char *, char **);
> >
> >  extern int init_colors(void);
> >  extern void finish_context_colors(void); -extern int raw_color(const
> > security_context_t, char **);
> > +extern int raw_color(const char *, char **);
> >
> >  #define SETRANSD_PATHNAME "/sbin/mcstransd"
> >
> > diff --git a/mcstrans/utils/transcon.c b/mcstrans/utils/transcon.c inde=
x
> > f4ded53e..4bf1bd56 100644
> > --- a/mcstrans/utils/transcon.c
> > +++ b/mcstrans/utils/transcon.c
> > @@ -14,7 +14,7 @@ static __attribute__((__noreturn__)) void usage(const=
 char
> > *progname)  }
> >
> >  int main(int argc, char **argv) {
> > -     security_context_t scon;
> > +     char *scon;
> >       if ( argc !=3D 2 ) usage(argv[0]);
> >       if (init_translations()=3D=3D0) {
> >               if(trans_context(argv[1],&scon) =3D=3D 0) { diff --git
> > a/mcstrans/utils/untranscon.c b/mcstrans/utils/untranscon.c index
> > 85cea294..81668746 100644
> > --- a/mcstrans/utils/untranscon.c
> > +++ b/mcstrans/utils/untranscon.c
> > @@ -13,7 +13,7 @@ static __attribute__((__noreturn__)) void usage(const=
 char
> > *progname)
> >       exit(1);
> >  }
> >  int main(int argc, char **argv) {
> > -     security_context_t scon;
> > +     char *scon;
> >       if ( argc !=3D 2 ) usage(argv[0]);
> >       if (init_translations()=3D=3D0) {
> >               if(untrans_context(argv[1],&scon) =3D=3D 0) { diff --git
> > a/policycoreutils/newrole/newrole.c b/policycoreutils/newrole/newrole.c
> > index e70051b1..36e2ba9c 100644
> > --- a/policycoreutils/newrole/newrole.c
> > +++ b/policycoreutils/newrole/newrole.c
> > @@ -643,8 +643,8 @@ static int transition_to_caller_uid()  #ifdef
> > AUDIT_LOG_PRIV
> >  /* Send audit message */
> >  static
> > -int send_audit_message(int success, security_context_t old_context,
> > -                    security_context_t new_context, const char *ttyn)
> > +int send_audit_message(int success, const char *old_context,
> > +                    const char *new_context, const char *ttyn)
> >  {
> >       char *msg =3D NULL;
> >       int rc;
> > @@ -677,9 +677,9 @@ int send_audit_message(int success, security_contex=
t_t
> > old_context,  #else  static inline
> >      int send_audit_message(int success __attribute__ ((unused)),
> > -                        security_context_t old_context
> > +                        const char *old_context
> >                          __attribute__ ((unused)),
> > -                        security_context_t new_context
> > +                        const char *new_context
> >                          __attribute__ ((unused)), const char *ttyn
> >                          __attribute__ ((unused)))
> >  {
> > @@ -695,14 +695,14 @@ static inline
> >   * This function will not fail if it can not relabel the tty when seli=
nux is
> >   * in permissive mode.
> >   */
> > -static int relabel_tty(const char *ttyn, security_context_t new_contex=
t,
> > -                    security_context_t * tty_context,
> > -                    security_context_t * new_tty_context)
> > +static int relabel_tty(const char *ttyn, const char *new_context,
> > +                    char **tty_context,
> > +                    char **new_tty_context)
> >  {
> >       int fd, rc;
> >       int enforcing =3D security_getenforce();
> > -     security_context_t tty_con =3D NULL;
> > -     security_context_t new_tty_con =3D NULL;
> > +     char *tty_con =3D NULL;
> > +     char *new_tty_con =3D NULL;
> >
> >       if (!ttyn)
> >               return 0;
> > @@ -775,11 +775,11 @@ static int relabel_tty(const char *ttyn,
> > security_context_t new_context,
> >   * Returns zero on success, non-zero otherwise
> >   */
> >  static int restore_tty_label(int fd, const char *ttyn,
> > -                          security_context_t tty_context,
> > -                          security_context_t new_tty_context)
> > +                          const char *tty_context,
> > +                          const char *new_tty_context)
> >  {
> >       int rc =3D 0;
> > -     security_context_t chk_tty_context =3D NULL;
> > +     char *chk_tty_context =3D NULL;
> >
> >       if (!ttyn)
> >               goto skip_relabel;
> > @@ -816,8 +816,8 @@ static int restore_tty_label(int fd, const char *tt=
yn,
> >   * Returns zero on success, non-zero otherwise.
> >   */
> >  static int parse_command_line_arguments(int argc, char **argv, char *t=
tyn,
> > -                                     security_context_t old_context,
> > -                                     security_context_t * new_context,
> > +                                     const char *old_context,
> > +                                     char **new_context,
> >                                       int *preserve_environment)
> >  {
> >       int flag_index;         /* flag index in argv[] */
> > @@ -827,8 +827,8 @@ static int parse_command_line_arguments(int argc, c=
har
> > **argv, char *ttyn,
> >       char *type_ptr =3D NULL;  /* stores malloc'd data from get_defaul=
t_type */
> >       char *level_s =3D NULL;   /* level spec'd by user in argv[] */
> >       char *range_ptr =3D NULL;
> > -     security_context_t new_con =3D NULL;
> > -     security_context_t tty_con =3D NULL;
> > +     char *new_con =3D NULL;
> > +     char *tty_con =3D NULL;
> >       context_t context =3D NULL;       /* manipulatable form of new_co=
ntext */
> >       const struct option long_options[] =3D {
> >               {"role", 1, 0, 'r'},
> > @@ -1021,10 +1021,10 @@ static int set_signal_handles(void)
> >
> >  int main(int argc, char *argv[])
> >  {
> > -     security_context_t new_context =3D NULL;  /* target security cont=
ext
> > */
> > -     security_context_t old_context =3D NULL;  /* original securiy con=
text
> > */
> > -     security_context_t tty_context =3D NULL;  /* current context of t=
ty
> > */
> > -     security_context_t new_tty_context =3D NULL;      /* new context =
of tty */
> > +     char *new_context =3D NULL;       /* target security context */
> > +     char *old_context =3D NULL;       /* original securiy context */
> > +     char *tty_context =3D NULL;       /* current context of tty */
> > +     char *new_tty_context =3D NULL;   /* new context of tty */
> >
> >       struct passwd pw;       /* struct derived from passwd file line *=
/
> >       char *ttyn =3D NULL;      /* tty path */
> > diff --git a/policycoreutils/run_init/run_init.c b/policycoreutils/run_=
init/run_init.c
> > index a007ce49..1c5eb68e 100644
> > --- a/policycoreutils/run_init/run_init.c
> > +++ b/policycoreutils/run_init/run_init.c
> > @@ -303,7 +303,7 @@ int authenticate_user(void)
> >   * out:              The CONTEXT associated with the context.
> >   * return:   0 on success, -1 on failure.
> >   */
> > -int get_init_context(security_context_t * context)
> > +int get_init_context(char **context)
> >  {
> >
> >       FILE *fp;
> > @@ -354,7 +354,7 @@ int main(int argc, char *argv[])
> >
> >       extern char *optarg;    /* used by getopt() for arg strings */
> >       extern int opterr;      /* controls getopt() error messages */
> > -     security_context_t new_context; /* context for the init script
> > context  */
> > +     char *new_context;      /* context for the init script context  *=
/
> >
> >  #ifdef USE_NLS
> >       setlocale(LC_ALL, "");
> > diff --git a/policycoreutils/secon/secon.c b/policycoreutils/secon/seco=
n.c index
> > 477057a6..d257a9a1 100644
> > --- a/policycoreutils/secon/secon.c
> > +++ b/policycoreutils/secon/secon.c
> > @@ -341,7 +341,7 @@ static void cmd_line(int argc, char *argv[])
> >               errx(EXIT_FAILURE, "SELinux is not enabled");  }
> >
> > -static int my_getXcon_raw(pid_t pid, security_context_t * con, const c=
har *val)
> > +static int my_getXcon_raw(pid_t pid, char  **con, const char *val)
> >  {
> >       char buf[4096];
> >       FILE *fp =3D NULL;
> > @@ -371,23 +371,23 @@ static int my_getXcon_raw(pid_t pid,
> > security_context_t * con, const char *val)
> >       return (0);
> >  }
> >
> > -static int my_getpidexeccon_raw(pid_t pid, security_context_t * con)
> > +static int my_getpidexeccon_raw(pid_t pid, char **con)
> >  {
> >       return (my_getXcon_raw(pid, con, "exec"));  } -static int
> > my_getpidfscreatecon_raw(pid_t pid, security_context_t * con)
> > +static int my_getpidfscreatecon_raw(pid_t pid, char **con)
> >  {
> >       return (my_getXcon_raw(pid, con, "fscreate"));  } -static int
> > my_getpidkeycreatecon_raw(pid_t pid, security_context_t * con)
> > +static int my_getpidkeycreatecon_raw(pid_t pid, char **con)
> >  {
> >       return (my_getXcon_raw(pid, con, "keycreate"));  }
> >
> > -static security_context_t get_scon(void)
> > +static char *get_scon(void)
> >  {
> >       static char dummy_NIL[1] =3D "";
> > -     security_context_t con =3D NULL, con_tmp;
> > +     char *con =3D NULL, *con_tmp;
> >       int ret =3D -1;
> >
> >       switch (opts->from_type) {
> > @@ -620,9 +620,10 @@ static void disp__con_val(const char *name, const =
char
> > *val,
> >       done =3D TRUE;
> >  }
> >
> > -static void disp_con(security_context_t scon_raw)
> > +static void disp_con(const char *scon_raw)
> >  {
> > -     security_context_t scon_trans, scon;
> > +     char *scon_trans;
> > +     const char *scon;
> >       context_t con =3D NULL;
> >       char *color_str =3D NULL;
> >       struct context_color_t color =3D { .valid =3D 0 }; @@ -748,7 +749=
,7 @@ static
> > void disp_con(security_context_t scon_raw)
> >
> >  int main(int argc, char *argv[])
> >  {
> > -     security_context_t scon_raw =3D NULL;
> > +     char *scon_raw =3D NULL;
> >
> >       cmd_line(argc, argv);
> >
> > diff --git a/sandbox/seunshare.c b/sandbox/seunshare.c index
> > 9707a456..d626e98d 100644
> > --- a/sandbox/seunshare.c
> > +++ b/sandbox/seunshare.c
> > @@ -431,13 +431,13 @@ static int cleanup_tmpdir(const char *tmpdir, con=
st char
> > *src,
> >   * to clean it up.
> >   */
> >  static char *create_tmpdir(const char *src, struct stat *src_st,
> > -     struct stat *out_st, struct passwd *pwd, security_context_t execc=
on)
> > +     struct stat *out_st, struct passwd *pwd, const char *execcon)
> >  {
> >       char *tmpdir =3D NULL;
> >       char *cmdbuf =3D NULL;
> >       int fd_t =3D -1, fd_s =3D -1;
> >       struct stat tmp_st;
> > -     security_context_t con =3D NULL;
> > +     char *con =3D NULL;
> >
> >       /* get selinux context */
> >       if (execcon) {
> > @@ -549,10 +549,10 @@ good:
> >  #define PROC_BASE "/proc"
> >
> >  static int
> > -killall (security_context_t execcon)
> > +killall (const char *execcon)
> >  {
> >       DIR *dir;
> > -     security_context_t scon;
> > +     char *scon;
> >       struct dirent *de;
> >       pid_t *pid_table, pid, self;
> >       int i;
> > @@ -615,7 +615,7 @@ killall (security_context_t execcon)
> >
> >  int main(int argc, char **argv) {
> >       int status =3D -1;
> > -     security_context_t execcon =3D NULL;
> > +     const char *execcon =3D NULL;
> >
> >       int clflag;             /* holds codes for command line flags */
> >       int kill_all =3D 0;
> > --
> > 2.26.0.rc2
>
> Nice, I also see you also made updates to correct const * issues with the
> Existing API like, for example, like send_audit_message().
>
> Acked-by: William Roberts <william.c.roberts@intel.com>
Merged: https://github.com/SELinuxProject/selinux/pull/212
