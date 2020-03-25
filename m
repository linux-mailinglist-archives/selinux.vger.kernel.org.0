Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25607192B8D
	for <lists+selinux@lfdr.de>; Wed, 25 Mar 2020 15:54:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbgCYOys (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 25 Mar 2020 10:54:48 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40835 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726969AbgCYOys (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 25 Mar 2020 10:54:48 -0400
Received: by mail-io1-f68.google.com with SMTP id k9so2500630iov.7
        for <selinux@vger.kernel.org>; Wed, 25 Mar 2020 07:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WoDt/m7VYpf/pwibknDTO4fhqbPbJmiwXq50ehIFBm8=;
        b=V8Aa/y0Ra3i1TgcRIYB4RVcJPsSo5PwT0Q91MB8tzn6/CGRE+rmtZww70Zb+MxDXp2
         x2fp7eGL1IScREMVmYm4vbg2tc08XY+7aEXdDvGRGpyEKW3qCXzvxwc8sVkEs6KdMG9N
         KYXDYNzND5pRhkmcLHXvpEM8etQ3ShExhEco3vxmo8cEZAmd9GKVRAtnHKL5xsZkTovO
         vXrGlrx5izOBJH2+kTcxnmBTUEM2OJ/bLsDA31OlG1bOCtGFVNxGfisMPcHuVTWxNDt0
         UPa8oaF0RENXArUhG9HEH7nXhTIqzCU7DL43UJctAANCuMuHmn4WAJHPpjpJhwKwNIJL
         JPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WoDt/m7VYpf/pwibknDTO4fhqbPbJmiwXq50ehIFBm8=;
        b=POUbGpcr+vW2HgpRq9ZfqRPybheEQ7vbHo3leDuslG34Mo6MWyPr+X16MuYGmN01vz
         Wx0A1not5VR2st8jPfY1L2EiDuTwnTrZJvHieHdY3BjAQTODcyzAfo4AsRhrJ0A2YC7F
         ey6IVW8EH0w3Fymo2caf0uvsz0C5nvycAwb3sNgtdpDQk6bLpGbkqgZR/7EM8BX4nI1q
         QjKvI8rlD7D9FXSSe2VkvYnPeoc/6/YAHIJdg52qTRiLrLjqWGI4cO2RDUvK4rgTdlM5
         o6RbpaE6wqQclK6EPAetMM9CV/sxsBrIBINzqeBWfxKhQbaDwCK3ekQOvHu/0CXQ2L+v
         0g/Q==
X-Gm-Message-State: ANhLgQ0IbKa4ondhFmxk603kDmdSqgHLkuhZW9etuDNSvhGtlW1CQBma
        wkoHdmZ6UQThEVm+pc+sg7HZIXbxgC+b0qgLk70=
X-Google-Smtp-Source: ADFU+vtwxtjlEuSdMJOWm1MaRaT8BrBTA35JqBl1WQf5Zig0j8al6ixnOFREdQSovJkRqXpJD9sekVnGa0SfI1Vfadg=
X-Received: by 2002:a05:6638:ec7:: with SMTP id q7mr3182082jas.77.1585148087599;
 Wed, 25 Mar 2020 07:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200323182633.12384-1-cgzones@googlemail.com> <476DC76E7D1DF2438D32BFADF679FC5649EB1BAF@ORSMSX101.amr.corp.intel.com>
In-Reply-To: <476DC76E7D1DF2438D32BFADF679FC5649EB1BAF@ORSMSX101.amr.corp.intel.com>
From:   William Roberts <bill.c.roberts@gmail.com>
Date:   Wed, 25 Mar 2020 09:54:36 -0500
Message-ID: <CAFftDdrRGWOF2hyyBwGX-rmvJGcJD5HXNmHNEHofT7iib3fzwg@mail.gmail.com>
Subject: Re: [PATCH] checkpolicy: add missing forward declaration
To:     "Roberts, William C" <william.c.roberts@intel.com>
Cc:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Mar 23, 2020 at 2:03 PM Roberts, William C
<william.c.roberts@intel.com> wrote:
>
> > -----Original Message-----
> > From: selinux-owner@vger.kernel.org [mailto:selinux-owner@vger.kernel.o=
rg]
> > On Behalf Of Christian G=C3=B6ttsche
> > Sent: Monday, March 23, 2020 1:27 PM
> > To: selinux@vger.kernel.org
> > Subject: [PATCH] checkpolicy: add missing forward declaration
> >
> > policy_scan.l:294:3: warning: implicit declaration of function 'yyerror=
' is
> >
> >       invalid in C99 [-Wimplicit-function-declaration]
> >
> > { yyerror("unrecognized character");}
> >
> >   ^
> >
> > policy_scan.l:294:3: warning: this function declaration is not a protot=
ype
> >
> >       [-Wstrict-prototypes]
> >
> > Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> > ---
> >  checkpolicy/policy_scan.l | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/checkpolicy/policy_scan.l b/checkpolicy/policy_scan.l inde=
x
> > 094645d1..4067268b 100644
> > --- a/checkpolicy/policy_scan.l
> > +++ b/checkpolicy/policy_scan.l
> > @@ -37,6 +37,7 @@ typedef int (* require_func_t)(void);  static char
> > linebuf[2][255];  static unsigned int lno =3D 0;  int werror =3D 0;
> > +int yyerror(const char *msg);
> >  int yywarn(const char *msg);
> >
> >  void set_source_file(const char *name);
> > --
> > 2.26.0.rc2
>
> Acked-by: William Roberts <william.c.roberts@intel.com>
Merged: https://github.com/SELinuxProject/selinux/pull/212
