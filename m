Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33C7219647
	for <lists+selinux@lfdr.de>; Fri, 10 May 2019 03:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbfEJBpT (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 9 May 2019 21:45:19 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39194 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbfEJBpT (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 9 May 2019 21:45:19 -0400
Received: by mail-oi1-f193.google.com with SMTP id x16so3409604oic.6
        for <selinux@vger.kernel.org>; Thu, 09 May 2019 18:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EDzgYWEqrejtqeEAO/TwfDDTEzMLk0wF9uT4bH5toPI=;
        b=bGeRsNhKxNihMwt0rIt9E+ykIQiqVN6kqF0tnMFAH3nMEHuTosxnbiBtIvqn8mywEF
         IQtJbBRru0ah0CGdJjmhGjkjGeo0I5yc7wMnsbBrYH+k99P1p01/17tMW+vpcr44b//N
         BngCzbVY75g31wrRCRFXzPFtVWnwXtNHcPUXJgon0fRLd+fFzPzcpoCWcA6pIamR1MKo
         +pJD/n2cRgdL8PpnpX4cXzlldtJSoJdlFOdU6Q+YN3GwfFgXugrggQzXoJNZqAJ0+jY+
         OGlv78IszwLDjZjttzAa84yTni3tcH7csGlBEXjsBjFfuAc5AogxLDB6VAETKGn5gt35
         kfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EDzgYWEqrejtqeEAO/TwfDDTEzMLk0wF9uT4bH5toPI=;
        b=MgbGyB4HjuXeOnsl99pj9RlbwGStAEYE8ItXoPzLmIZDYL3Ck9jXStRZ5/ymVU0Nec
         GEaP7X+iBNRX7xISVLhmTRvHw0MPon+PvfTzfH5AvM8Nqx6R9LKrwOb1yVz13onOgmNr
         ipz+9+/qPQLVyKOvFRns/O0g6wqKiQibeaGrcf2j+QJiD3KIUugnZc8iv1mGhiCGKhlt
         kIisSwKgdSe2hI1UCSYZAqbGMoen4PgqcHQxS393ANHupsvRFyTIiYfayadqIL+CU72e
         0VDln9R7w4Z9LeYHsivf4JhQZW70JwsphY8DhBDOjPKFJmsdiQt9SGGjNNczSc8Cdm+Q
         yhSA==
X-Gm-Message-State: APjAAAWuWC9i3JyjTNt8hbkLxHz31ghutwsuBVXWfnHjfJMsmt9WVHoR
        HYmAIZubcL1YkD1I9t/eyvWJ+AwIT8Yux8H2aAU=
X-Google-Smtp-Source: APXvYqy0fPVixKMFQBmz2NFrfQCkRINZ3T2R9C11RJqCVwQ3o5FU2sZO2XKFDKPjpDbebWpm4gyQ2po/Rr6QuAV0qX0=
X-Received: by 2002:aca:f40e:: with SMTP id s14mr2653966oih.69.1557452718066;
 Thu, 09 May 2019 18:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190509084204.26198-1-plautrba@redhat.com> <CAFftDdpQvKewRi6LZT0BfzqXeZ5at0Azk-ECi7asf6-XF2Aukw@mail.gmail.com>
In-Reply-To: <CAFftDdpQvKewRi6LZT0BfzqXeZ5at0Azk-ECi7asf6-XF2Aukw@mail.gmail.com>
From:   William Roberts <bill.c.roberts@gmail.com>
Date:   Thu, 9 May 2019 18:45:07 -0700
Message-ID: <CAFftDdqgSMZB41f6yyF-1KTgFenUxJ3zsmYb1RxxBc9hgYouLA@mail.gmail.com>
Subject: Re: [PATCH] libselinux: Eliminate use of security_compute_user()
To:     Petr Lautrbach <plautrba@redhat.com>
Cc:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, May 9, 2019 at 6:44 PM William Roberts <bill.c.roberts@gmail.com> wrote:
>
> On Thu, May 9, 2019 at 1:43 AM Petr Lautrbach <plautrba@redhat.com> wrote:
> >
> > get_ordered_context_list() code used to ask the kernel to compute the complete
> > set of reachable contexts using /sys/fs/selinux/user aka
> > security_compute_user(). This set can be so huge so that it doesn't fit into a
> > kernel page and security_compute_user() fails. Even if it doesn't fail,
> > get_ordered_context_list() throws away the vast majority of the returned
> > contexts because they don't match anything in
> > /etc/selinux/targeted/contexts/default_contexts or
> > /etc/selinux/targeted/contexts/users/
> >
> > get_ordered_context_list() is rewritten to compute set of contexts based on
> > /etc/selinux/targeted/contexts/users/ and
> > /etc/selinux/targeted/contexts/default_contexts files and to return only valid
> > contexts, using security_check_context(), from this set.
>
> Whats the best way to test this?
>
> >
> > Fixes: https://github.com/SELinuxProject/selinux/issues/28
> >
> > Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
> > ---
> >  libselinux/src/get_context_list.c | 185 ++++++++++--------------------
> >  1 file changed, 60 insertions(+), 125 deletions(-)
> >
> > diff --git a/libselinux/src/get_context_list.c b/libselinux/src/get_context_list.c
> > index 689e4658..a36c6253 100644
> > --- a/libselinux/src/get_context_list.c
> > +++ b/libselinux/src/get_context_list.c
> > @@ -114,61 +114,24 @@ int get_default_context(const char *user,
> >         return 0;
> >  }
> >
> > -static int find_partialcon(char ** list,
> > -                          unsigned int nreach, char *part)
> > -{
> > -       const char *conrole, *contype;
> > -       char *partrole, *parttype, *ptr;
> > -       context_t con;
> > -       unsigned int i;
> > -
> > -       partrole = part;
> > -       ptr = part;
> > -       while (*ptr && !isspace(*ptr) && *ptr != ':')
> > -               ptr++;
> > -       if (*ptr != ':')
> > -               return -1;
> > -       *ptr++ = 0;
> > -       parttype = ptr;
> > -       while (*ptr && !isspace(*ptr) && *ptr != ':')
> > -               ptr++;
> > -       *ptr = 0;
> > -
> > -       for (i = 0; i < nreach; i++) {
> > -               con = context_new(list[i]);
> > -               if (!con)
> > -                       return -1;
> > -               conrole = context_role_get(con);
> > -               contype = context_type_get(con);
> > -               if (!conrole || !contype) {
> > -                       context_free(con);
> > -                       return -1;
> > -               }
> > -               if (!strcmp(conrole, partrole) && !strcmp(contype, parttype)) {
> > -                       context_free(con);
> > -                       return i;
> > -               }
> > -               context_free(con);
> > -       }
> > -
> > -       return -1;
> > -}
> > -
> > -static int get_context_order(FILE * fp,
> > +static int get_context_user(FILE * fp,
> >                              char * fromcon,
> > -                            char ** reachable,
> > -                            unsigned int nreach,
> > -                            unsigned int *ordering, unsigned int *nordered)
> > +                            const char * user,
> > +                            char ***reachable,
> > +                            unsigned int *nreachable)
> >  {
> >         char *start, *end = NULL;
> >         char *line = NULL;
> >         size_t line_len = 0;
> > -       ssize_t len;
> > +       ssize_t len, ulen;
> >         int found = 0;
> > -       const char *fromrole, *fromtype;
> > +       const char *fromrole, *fromtype, *fromlevel;
> >         char *linerole, *linetype;
> > -       unsigned int i;
> > +       char **new_reachable = NULL;
> > +       char *usercon_str;
> >         context_t con;
> > +       context_t usercon;
> > +
> >         int rc;
> >
> >         errno = -EINVAL;
> > @@ -180,7 +143,8 @@ static int get_context_order(FILE * fp,
> >                 return -1;
> >         fromrole = context_role_get(con);
> >         fromtype = context_type_get(con);
> > -       if (!fromrole || !fromtype) {
> > +       fromlevel = context_range_get(con);
> > +       if (!fromrole || !fromtype || !fromlevel) {
> >                 context_free(con);
> >                 return -1;
> >         }
> > @@ -243,23 +207,52 @@ static int get_context_order(FILE * fp,
> >                 if (*end)
> >                         *end++ = 0;
> >
> > -               /* Check for a match in the reachable list. */
> > -               rc = find_partialcon(reachable, nreach, start);
> > -               if (rc < 0) {
> > -                       /* No match, skip it. */
> > -                       start = end;
> > -                       continue;
> > +               /* Check whether a new context is valid */
> > +               ulen = strlen(user) + strlen(start) + 1;
>
> is their anything guaranteeing this doesn't overflow and result in
> malloc(0) which is undefined?
> also ulen is signed, why? All uses are where a size_t is valid, I
> think it can change to a size_t.
>
> > +               usercon_str = malloc(ulen);
>
> spaces after tab, see:
> https://github.com/SELinuxProject/selinux/pull/146/files#diff-55a16252233f48b841c06ffbe22bb66dR211
>
> > +               if (!usercon_str) {
> > +                       rc = -1;
> > +                       goto out;
> >                 }
> >
> > -               /* If a match is found and the entry is not already ordered
> > -                  (e.g. due to prior match in prior config file), then set
> > -                  the ordering for it. */
> > -               i = rc;
> > -               if (ordering[i] == nreach)
> > -                       ordering[i] = (*nordered)++;
> > +               /* set range from fromcon in the new usercon */
> > +               snprintf(usercon_str, ulen - 1, "%s:%s", user, start);
> > +               if (!(usercon = context_new(usercon_str))) {
>
> You can drop the too free(usercon_str) if you rework this logic:
(sic) two not too
> usercon = context_new(usercon_str))
> free(usercon_str);
> if (!usercon) {
>     // error
>     continue;
> }
>
> > +                       fprintf(stderr,
> > +                               "%s: can't create a context from %s\n",
> > +                               __FUNCTION__, usercon_str);
> > +                       free(usercon_str);
> > +
> > +                       continue;
>
> Why is it OK to continue?
>
> > +               }
> > +               free(usercon_str);
> > +               context_range_set(usercon, fromlevel);
> > +               usercon_str = context_str(usercon);
> > +
> > +               if (security_check_context(usercon_str) == 0) {
> > +                       if (*nreachable == 0) {
> > +                               new_reachable = malloc(2 * sizeof(char *));
> > +                               if (!new_reachable) {
> > +                                       context_free(usercon);
> > +                                       rc = -1;
> > +                                       goto out;
> > +                               }
> > +                       } else {
> > +                               new_reachable = realloc(*reachable, (*nreachable + 2) * sizeof(char *));
> > +                               if (!new_reachable) {
> > +                                       context_free(usercon);
> > +                                       rc = -1;
> > +                                       goto out;
> > +                               }
> > +                       }
> > +                       new_reachable[*nreachable] = strdup(usercon_str);
>
> oom error
>
> > +                       new_reachable[*nreachable + 1] = 0;
> > +                       *reachable = new_reachable;
> > +                       *nreachable += 1;
> > +               }
> > +               context_free(usercon);
> >                 start = end;
> >         }
> > -
> >         rc = 0;
> >
> >        out:
> > @@ -313,21 +306,6 @@ static int get_failsafe_context(const char *user, char ** newcon)
> >         return 0;
> >  }
> >
> > -struct context_order {
> > -       char * con;
> > -       unsigned int order;
> > -};
> > -
> > -static int order_compare(const void *A, const void *B)
> > -{
> > -       const struct context_order *c1 = A, *c2 = B;
> > -       if (c1->order < c2->order)
> > -               return -1;
> > -       else if (c1->order > c2->order)
> > -               return 1;
> > -       return strcmp(c1->con, c2->con);
> > -}
> > -
> >  int get_ordered_context_list_with_level(const char *user,
> >                                         const char *level,
> >                                         char * fromcon,
> > @@ -395,11 +373,8 @@ int get_ordered_context_list(const char *user,
> >                              char *** list)
> >  {
> >         char **reachable = NULL;
> > -       unsigned int *ordering = NULL;
> > -       struct context_order *co = NULL;
> > -       char **ptr;
> >         int rc = 0;
> > -       unsigned int nreach = 0, nordered = 0, freefrom = 0, i;
> > +       unsigned nreachable = 0, freefrom = 0;
> >         FILE *fp;
> >         char *fname = NULL;
> >         size_t fname_len;
> > @@ -413,23 +388,6 @@ int get_ordered_context_list(const char *user,
> >                 freefrom = 1;
> >         }
> >
> > -       /* Determine the set of reachable contexts for the user. */
> > -       rc = security_compute_user(fromcon, user, &reachable);
> > -       if (rc < 0)
> > -               goto failsafe;
> > -       nreach = 0;
> > -       for (ptr = reachable; *ptr; ptr++)
> > -               nreach++;
> > -       if (!nreach)
> > -               goto failsafe;
> > -
> > -       /* Initialize ordering array. */
> > -       ordering = malloc(nreach * sizeof(unsigned int));
> > -       if (!ordering)
> > -               goto failsafe;
> > -       for (i = 0; i < nreach; i++)
> > -               ordering[i] = nreach;
> > -
> >         /* Determine the ordering to apply from the optional per-user config
> >            and from the global config. */
> >         fname_len = strlen(user_contexts_path) + strlen(user) + 2;
> > @@ -440,8 +398,8 @@ int get_ordered_context_list(const char *user,
> >         fp = fopen(fname, "re");
> >         if (fp) {
> >                 __fsetlocking(fp, FSETLOCKING_BYCALLER);
> > -               rc = get_context_order(fp, fromcon, reachable, nreach, ordering,
> > -                                      &nordered);
> > +               rc = get_context_user(fp, fromcon, user, &reachable, &nreachable);
> > +
> >                 fclose(fp);
> >                 if (rc < 0 && errno != ENOENT) {
> >                         fprintf(stderr,
> > @@ -454,8 +412,7 @@ int get_ordered_context_list(const char *user,
> >         fp = fopen(selinux_default_context_path(), "re");
> >         if (fp) {
> >                 __fsetlocking(fp, FSETLOCKING_BYCALLER);
> > -               rc = get_context_order(fp, fromcon, reachable, nreach, ordering,
> > -                                      &nordered);
> > +               rc = get_context_user(fp, fromcon, user, &reachable, &nreachable);
> >                 fclose(fp);
> >                 if (rc < 0 && errno != ENOENT) {
> >                         fprintf(stderr,
> > @@ -463,40 +420,18 @@ int get_ordered_context_list(const char *user,
> >                                 __FUNCTION__, selinux_default_context_path());
> >                         /* Fall through */
> >                 }
> > -               rc = 0;
> > +               rc = nreachable;
> >         }
> >
> > -       if (!nordered)
> > +       if (!nreachable)
> >                 goto failsafe;
> >
> > -       /* Apply the ordering. */
> > -       co = malloc(nreach * sizeof(struct context_order));
> > -       if (!co)
> > -               goto failsafe;
> > -       for (i = 0; i < nreach; i++) {
> > -               co[i].con = reachable[i];
> > -               co[i].order = ordering[i];
> > -       }
> > -       qsort(co, nreach, sizeof(struct context_order), order_compare);
> > -       for (i = 0; i < nreach; i++)
> > -               reachable[i] = co[i].con;
> > -       free(co);
> > -
> > -       /* Only report the ordered entries to the caller. */
> > -       if (nordered <= nreach) {
> > -               for (i = nordered; i < nreach; i++)
> > -                       free(reachable[i]);
> > -               reachable[nordered] = NULL;
> > -               rc = nordered;
> > -       }
> > -
> >        out:
> >         if (rc > 0)
> >                 *list = reachable;
> >         else
> >                 freeconary(reachable);
> >
> > -       free(ordering);
> >         if (freefrom)
> >                 freecon(fromcon);
> >
> > --
> > 2.21.0
> >
