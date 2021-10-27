Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6799543D799
	for <lists+selinux@lfdr.de>; Thu, 28 Oct 2021 01:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229474AbhJ0XjY (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 27 Oct 2021 19:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhJ0XjX (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 27 Oct 2021 19:39:23 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D107AC061570
        for <selinux@vger.kernel.org>; Wed, 27 Oct 2021 16:36:57 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id s23-20020a056830125700b00553e2ca2dccso1141458otp.3
        for <selinux@vger.kernel.org>; Wed, 27 Oct 2021 16:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=VyoOlx1f4bY9qJ0WEn854eIaH9saJD/psl6FGa9mBmM=;
        b=K7hlO4boWaeYjBtjbM51c4Qe7Evd+u/1f4otURj6d3mPKxok2BjH7a24IPqjhmeTja
         VB4xdXVEhzX9mYYQLnFJyuD+fWUOZMc2lQUFuzyW0LKs4Ozvs+FI5f8kUwn3RCh/QstE
         /KuDlkIH5iXmvwGLRS1ZAVz1bZk+UNb5E3PuyCvjnebuvkU4+KOS5TFmx4cN+P086CAL
         wjqH24TzqLNTvQPeYIx4W4vR2O9fREDqWaWZVnKfZP8nqyZl9fj19MUXBzoWWJTZhC/J
         4rLu4FTTdxWoPa7darh1eNu98/0t1R8AjXB6LKvdaLLkcdO/3HedVSbXrK5kWuSyS4aS
         T0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=VyoOlx1f4bY9qJ0WEn854eIaH9saJD/psl6FGa9mBmM=;
        b=XcN6rYo5siPVthVYznpPKQYZfTm7CQ7uNU7zIJVWj6+afpw4vDoehWMye/OqTTmkI1
         qbWyf5Ehs0D8i1kTou2yOGvSh2kf1h8ThsC6gRTxko9/mwnlOEmni69dF5JQNxvu60W8
         VW3NcBWlrILdO1F1wuTQQF1UalpHRNsC9Aa2kC9qPbaISMu1KtR+Kq5i5EZ+U7oNtixm
         qE4/D69i6fk7ZKASRrGJf3vG/4dMZr6aMkmde925rTc/yKH72WTQw+rloYzJ2OcxCs7G
         8MNEXYQScFD+e7qVIVSx5Dso5cvZC3RgcJLPh2UMsZREmolNJoaIZVhIOapE5UQl/YYf
         djXQ==
X-Gm-Message-State: AOAM533ZSXo2MiZ+Vn6t8xHvJ0zNbfYgaOG1IhUT71AHHXufDgcxymJn
        CIa/kmbyiBCIz8djPKXvK8kEIe8OrxCeUY2nDjQ=
X-Google-Smtp-Source: ABdhPJwFy35FZ6ng03wtqAuUJ19rYNwX9IJD0WRu81oaSWhhG7s8rk5Mopql8tuUGEURlWJ4y37URNc7UmOagPP6a8I=
X-Received: by 2002:a05:6830:90e:: with SMTP id v14mr702548ott.14.1635377816968;
 Wed, 27 Oct 2021 16:36:56 -0700 (PDT)
MIME-Version: 1.0
Sender: ericgloriapaul@gmail.com
Received: by 2002:a9d:5184:0:0:0:0:0 with HTTP; Wed, 27 Oct 2021 16:36:56
 -0700 (PDT)
From:   DINA MCKENNA <dinamckennahowley@gmail.com>
Date:   Wed, 27 Oct 2021 23:36:56 +0000
X-Google-Sender-Auth: -DqzJgkZRyqGKzAensw9aQkLgYw
Message-ID: <CAApFGfRVbr=XtvXS+asEJ==fYFiWjiNgG-BQqtCtBbO3TT4POQ@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hello my dear ,

 I sent this mail praying it will get to you in a good condition of
health, since I myself are in a very critical health condition in
which I sleep every night without knowing if I may be alive to see the
next day. I bring peace and love to you. It is by the grace of God, I
had no choice than to do what is lawful and right in the sight of God
for eternal life and in the sight of man, for witness of God=E2=80=99s merc=
y
and glory upon my life. I am Mrs. Dina Mckenna Howley., a widow. I am
suffering from a long time brain tumor, It has defiled all forms of
medical treatment, and right now I have about a few months to leave,
according to medical experts. The situation has gotten complicated
recently with my inability to hear proper, am communicating with you
with the help of the chief nurse herein the hospital, from all
indication my conditions is really deteriorating and it is quite
obvious that, according to my doctors they have advised me that I may
not live too long, Because this illness has gotten to a very bad
stage. I plead that you will not expose or betray this trust and
confidence that I am about to repose on you for the mutual benefit of
the orphans and the less privilege. I have some funds I inherited from
my late husband, the sum of ($ 11,000,000.00, Eleven Million Dollars).
Having known my condition, I decided to donate this fund to you
believing that you will utilize it the way i am going to instruct
herein. I need you to assist me and reclaim this money and use it for
Charity works therein your country for orphanages and gives justice
and help to the poor, needy and widows says The Lord." Jeremiah
22:15-16.=E2=80=9C and also build schools for less privilege that will be
named after my late husband if possible and to promote the word of God
and the effort that the house of God is maintained. I do not want a
situation where this money will be used in an ungodly manner. That's
why I'm taking this decision. I'm not afraid of death, so I know where
I'm going. I accept this decision because I do not have any child who
will inherit this money after I die. Please I want your sincerely and
urgent answer to know if you will be able to execute this project for
the glory of God, and I will give you more information on how the fund
will be transferred to your bank account. May the grace, peace, love
and the truth in the Word of God be with you and all those that you
love and care for.

I'm waiting for your immediate reply..

May God Bless you,
Mrs. Dina Mckenna..
