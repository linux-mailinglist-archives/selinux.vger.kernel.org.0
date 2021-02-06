Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6FF4311E02
	for <lists+selinux@lfdr.de>; Sat,  6 Feb 2021 15:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhBFOwn (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 6 Feb 2021 09:52:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhBFOwn (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 6 Feb 2021 09:52:43 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46507C061788
        for <selinux@vger.kernel.org>; Sat,  6 Feb 2021 06:51:46 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id df22so12949353edb.1
        for <selinux@vger.kernel.org>; Sat, 06 Feb 2021 06:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=UdnYwgsYgbWrk7CWag9gbtE38dVGGi+MCCJXspDVDGXqDV9JuoDA3EvkM+vDROs1Rq
         JAYG1zMedVfivxPBtH+ibRD/Zrzwfczgkq/zmywRTElw12SzQX4dN8WV7mtkFPl8h0bt
         R46eDcsf9PXEC6YCF43sYch+9iOZRciGae9NNYOIijlpCrj10iUSULxYR8EnK7lNR+BP
         OO8798sAf7YDBzd4WtECuTJHSdW+KjHOLLSSnp1Xn9xj04iyYAJVUM/agL82v6FT/z+e
         NIKXydggQFkMYLQrJCxSEwhrtVxFxkH3pwRH0wjR+YbNuTBEWxKkARcSHJ3erGkg+R2o
         Qslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=LtghGG3OHg5A6vs0Yq2btobri5QCnsa8mOAvJFLQSVnClf8UVjDVTCzazWQ0Tl4Of8
         6zOOWwvqmwPLMG9hD94X+bQmzSEYvCqQrYxmW6YUD62HYTDiNE36JYbeMuGU9mEzE5QH
         aXE8lmYVXX1i383PChPa4MiUuw2qgKzLBq3Dcha1uMMCgB9a3hYOvUYbBulcN6t/3oNs
         1F2K5Q4yHQjn5bRUuykQ7DqOPVJJF+fN1sYQDW7y9kkhUbctRsB+cmTpFhRRbODVV0di
         w0FajXvZJZstm48WFbi/UgeNv1hPf+eDEH0AmfvWy7w+HKTFuuLmQWE3pCEqRxiYQnw4
         2g8A==
X-Gm-Message-State: AOAM533lk8p2WQYau0ZQLtOnnx7xcjP81sClEcgy2Y4N1nqFueftXWH2
        jpUh6s3vcD30VxHcrdJ7hA4Vv9s2bVH1MTqJmDw=
X-Google-Smtp-Source: ABdhPJwa+RU/chnnupN9r4QoQwtOjZIlbUU59mdk8sDPXGiwzByMOZvr9JdWMByaJntG1FK+BupAmvQoQ88rS/1ppTU=
X-Received: by 2002:a05:6402:3508:: with SMTP id b8mr8809166edd.341.1612623105084;
 Sat, 06 Feb 2021 06:51:45 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:25d0:0:0:0:0 with HTTP; Sat, 6 Feb 2021 06:51:44
 -0800 (PST)
Reply-To: lawyer.nba@gmail.com
From:   Barrister Daven Bango <stephennbada9@gmail.com>
Date:   Sat, 6 Feb 2021 15:51:44 +0100
Message-ID: <CAGSHw-Bb=ncYxShq11n1nYFMdqzvrSCcAmw4nk3VC_HBsJ9rmg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

--=20
Korisnik fonda =C4=8Destitanja, Va=C5=A1a sredstva za naknadu od 850.000,00
ameri=C4=8Dkih dolara odobrila je Me=C4=91unarodna monetarna organizacija (=
MMF)
u suradnji s (FBI) nakon mnogo istraga. =C4=8Cekamo da se obratimo za
dodatne informacije

Advokat: Daven Bango
Telefon: +22891667276
(URED MMF-a LOME TOGO)
