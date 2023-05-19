Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DAAD7096D2
	for <lists+selinux@lfdr.de>; Fri, 19 May 2023 13:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231698AbjESLyJ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 19 May 2023 07:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231710AbjESLyC (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 19 May 2023 07:54:02 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C43801B0
        for <selinux@vger.kernel.org>; Fri, 19 May 2023 04:53:59 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-64d2b42a8f9so940647b3a.3
        for <selinux@vger.kernel.org>; Fri, 19 May 2023 04:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684497239; x=1687089239;
        h=to:subject:message-id:date:from:references:in-reply-to:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YJNTYHB1yZmgnFkp+xXn9XSLABSa1kCZVD8URvEiNZE=;
        b=DwfHUALYc14mtlp5cQqlsIxQ+FMYlvMEi2Fo7wIwDswbB/vaEgxHej2APK4c3eve9L
         ggweuWQ7h3U0Ki6VTIvDdkgoYU0hGM/HnbAmTR0chjfe8lSxr1SS6c6YPLjg5WDxexmE
         OyP85ma0raJ5isRqIU5CAITZb25hvug4sSwSrsKgrkc1RenAxcgRjwIfcsdIrlWYJLu6
         FiZ3TiIo3+vskNENPVNMkQCWn2iYnsTaxDpzys1ATs8TfJXhDqK/89D143ZnXic50NId
         QKUkKm7Kqu+1mDhln6dQbQpcC6Ve1JiP3i16CnAQO5AQZGgRrybv4u57xfGD/ZR0p3Rj
         b/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684497239; x=1687089239;
        h=to:subject:message-id:date:from:references:in-reply-to:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJNTYHB1yZmgnFkp+xXn9XSLABSa1kCZVD8URvEiNZE=;
        b=O3zK+TkKJLM2jDmr44Jz4w58mO7cnvbengjvGRWykxNv3Fi7zoN+4iwn2QBR9KPF6R
         TWSsSSuZyqEJtfGjyJY19x2yp7/pKf/XWZiqd9pz8qmO/SMuWuhDgOahBrEJ9UTCZF7w
         kwNOk1Ek76Di3inXeATo/tM5On9aa9YT1gQMMe3ahVibGlUS7y5QXg1pw7/v6121TwwU
         LgLAPXGVeqpwj8QD4lHBXOfuKYJgk8BBQp7ljcM0LQw5EShIaoSZQU44PZNwuOtH6XXd
         E+xvFC7pcZjfcINLOic1r0KmgILhXnndtI7Sxd9U9yS1gJhtDd5CUcgsJZpuxJKzFGEv
         sjiQ==
X-Gm-Message-State: AC+VfDz85JggC8V12E+ZtKdecUUHyg7U8DP0oF/sEfpgi8CPp4uw2W4t
        O4Im8O6VDvSNBi9OCAwsmfVWM20nnp8VdMxskXg=
X-Google-Smtp-Source: ACHHUZ7xuAnuC9/R/hauRxZe3pEn/eWjqAP6FIzpmUXZ+CSXBW5wV1Z+8vaU9cODy+Fo6AqH0Xx3p4inNRbJQcdRhto=
X-Received: by 2002:a17:903:1206:b0:1ab:74c:bdf2 with SMTP id
 l6-20020a170903120600b001ab074cbdf2mr2877368plh.28.1684497238360; Fri, 19 May
 2023 04:53:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:6d1c:b0:4b5:a864:58da with HTTP; Fri, 19 May 2023
 04:53:57 -0700 (PDT)
Reply-To: royalmaylux1@gmx.com
In-Reply-To: <CAAsVTHorJvYWoGHsg2_VTAvt6ZpKO9kscCaNo0dRVvPX_YoVuw@mail.gmail.com>
References: <CAAsVTHqdUjMV_dQD270TaAmCNQ09g9T2XFGbM9-e6ManaXbsRQ@mail.gmail.com>
 <CAAsVTHrGsxA+j4WirKjigbS=boD8bDW_26t92Nc02nhZqb4Gxw@mail.gmail.com>
 <CAAsVTHrLrH0prao8=kMqiwx1WFrRSd2b8xZw6Fi__k40Y1MOnQ@mail.gmail.com>
 <CAAsVTHrN15gSZPM3Aw=XU-su8AgKTiikQ-NprN5VDGaaQ2mfOQ@mail.gmail.com>
 <CAAsVTHpfRRGJ=nP5wWDr=G_JH61PP8B9wLB4DNU=x76Osuazqw@mail.gmail.com>
 <CAAsVTHrf+GWUhU7yVy0d8hEOiKg-7FqUzxwXoa9HqHicYvD54w@mail.gmail.com>
 <CAAsVTHo3Sz-P30HROJD29NT9wFFDCa+-QAeUTVO_iyS-UVhfNQ@mail.gmail.com>
 <CAAsVTHqdKSbV9yRG0nvVUeX7KA8hdLhF-EUW33kZy-y4mOB7PA@mail.gmail.com>
 <CAAsVTHoOS3ta3t53hCqFmkf=uEU263MXJis9vcqChbhVCW87=Q@mail.gmail.com>
 <CAAsVTHoNhVNx5fm3gCLL2y+14gO5nyzGYdCUTgaCsRFUrtu9bw@mail.gmail.com>
 <CAAsVTHoqmhwez_z=tLQarxJnSEfHV8jWtPR4JbERgJKU0K8mBw@mail.gmail.com>
 <CAAsVTHp8eF=CBNTMP8PdTQmKUiF0ippF0VvCe_LRC7MYcbo1+g@mail.gmail.com>
 <CAAsVTHpSBcCoSmCos40V2e8ssBp24GtrvJ_A-d_WNbd-8j8wnA@mail.gmail.com>
 <CAAsVTHppV+V0S0FvQO-42=SEWn1M3UoghXqVb7HZLBr5==zQyg@mail.gmail.com>
 <CAAsVTHqE6i0v14Vw7ev36adRR+Yprk8pxtmsZhre7DF-Osn-Pg@mail.gmail.com>
 <CAAsVTHpTVcHUjMVJDzWQ9zFRuNnb-_2f6YsF9z1eqj_i4RLUZA@mail.gmail.com>
 <CAAsVTHp6SmL49o3BqRHk=GHNMhwCHu3w5D=N+grTZe1UZSOmTA@mail.gmail.com>
 <CAAsVTHpzZ1gn+pQvBXzGB+i+Wxatz+_KwxMve47TwJOjhFNLyQ@mail.gmail.com>
 <CAAsVTHrPCWJBeyLOCGyTpmFL3Jq5h_dUnroCBq7Dq9NL0dLsYQ@mail.gmail.com>
 <CAAsVTHo0Y==_w7AcFNoCj0oBGN4af=Vb2Lf4_f60O6LXtifM8A@mail.gmail.com>
 <CAAsVTHoTSdmzfvkb0WyN6oGRHfubH60Fs5-9gE7St91_NVrs6g@mail.gmail.com>
 <CAAsVTHrn-nUP3PUb1h_247Ok638jUopTfO9N9HzVsEF2h7kH8g@mail.gmail.com>
 <CAAsVTHo8NBfj6mN4z5vtU3vP+6v2YWHiGQZ0KgmB854g=8pRPA@mail.gmail.com>
 <CAAsVTHrafOjSH0Tdk6FdK=7JS1SNKzTGdxmx0W5BRoErGh+A+g@mail.gmail.com>
 <CAAsVTHpThhrC73m93tTkxjn2+SVazN1ko7OQFz=xf0zNTkHHOw@mail.gmail.com> <CAAsVTHorJvYWoGHsg2_VTAvt6ZpKO9kscCaNo0dRVvPX_YoVuw@mail.gmail.com>
From:   Royal Maylux <royalmaylux1@gmail.com>
Date:   Fri, 19 May 2023 13:53:57 +0200
Message-ID: <CAAsVTHo9ZMG0eeA4sEw-M--qQUjtuuDp38QY77SfqMfxay2esQ@mail.gmail.com>
Subject: Do you receive the email
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Do you receive the email I sent you  few days ago, I'm waiting for your reply?
