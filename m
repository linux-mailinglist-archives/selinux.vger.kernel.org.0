Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF0546987A
	for <lists+selinux@lfdr.de>; Mon,  6 Dec 2021 15:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343809AbhLFOV5 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 6 Dec 2021 09:21:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244729AbhLFOV5 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 6 Dec 2021 09:21:57 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17AA2C061746
        for <selinux@vger.kernel.org>; Mon,  6 Dec 2021 06:18:29 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id l8so10882209qtk.6
        for <selinux@vger.kernel.org>; Mon, 06 Dec 2021 06:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=xXJ/lCVXbEaKcrvSczjQ9tYZYtaOAF0IlSIxDtUlJeo=;
        b=ZWsUfC5eg7iqeS7LbeZD3aI91BeIz0rJhmBOuAztHakQXTQ6LXxvXxsAma8ZCkPCHS
         hu0mVmzgslQQRv7CoUpdELUY7JdhgWywjRV2jmvN0McXzSsH1nOVpRvxkq02+XZ2uW1R
         H4UPDNNC13m+kZAVVVyITjTJrLoSsW3frhYu3lbpi4xIscFUgCVL4NLcmRthFxX6ihEg
         YqBPcbazRkToY+9WuuNEhpeIEUIruT5wPAzfCpPpyxfWaEq5Aw40CcIKCJGJFiyY3HWt
         Geq4fK7rb4COjIjuDnpjsSn6ntT3cd/c2KlhmJ5VgfRkH5Os9OSp27iN/isjVFBRFLho
         li6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=xXJ/lCVXbEaKcrvSczjQ9tYZYtaOAF0IlSIxDtUlJeo=;
        b=N1TArXK32i6b4Zi+lPbg8Abe8SwCOEyDK8Xh/72ADBxTEgd31ctTiMrhAuHi4hxpE3
         8apMO18QeghKuyp4Hpv6DzKfDRUCcJe3CjkUyBchZldyfLmCzZVfkgPp415bSeXw1hHb
         XD1Y+eD16T1wlggdniotuEsOa385YxVvsF7SOi0dpLrLLOTTZ4KtLuAugngci4NU63eU
         XJoo6k72NC+jeGSsWzjj91RqzhjltyzHCZvIrDJLC0WclGNafuZ1qVXHLFdIpZBBf3jb
         qddul7XkhYCbv9azek6Verz9jTjlNe+Kg0zdfczFH2D2bcgXEMNvRkVMVq/7pvfh60s4
         c/mA==
X-Gm-Message-State: AOAM531yDdE1Lj8Ttdb9FTe2z9XWQk8K70EFndhXId+c+T39fknZG06Z
        LPBjmYfb0+cWkIr5eNgB8ZDTmceexZMkDCDW2UrSmQT75N+jkQ==
X-Google-Smtp-Source: ABdhPJy8yu0XMljT9OBuCow2p5HuJCjiSd7CppwOzYQaaRzYnQXE2dhTtYVlw1zTo5lYzysf3j4QrG8jaB6W92Zqm6g=
X-Received: by 2002:a02:a489:: with SMTP id d9mr40871365jam.47.1638799923767;
 Mon, 06 Dec 2021 06:12:03 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6638:144f:0:0:0:0 with HTTP; Mon, 6 Dec 2021 06:12:03
 -0800 (PST)
Reply-To: anawilliam152@citromail.hu
From:   "Anna S. William" <susanwilliam857687@gmail.com>
Date:   Mon, 6 Dec 2021 14:12:03 +0000
Message-ID: <CAAC8a88CHqqy+E=t+9+-XQ83xxQWCiXSwGZdyzt=diQbp5ubDg@mail.gmail.com>
Subject: Guten Morgen,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Guten Morgen,

Ich wei=C3=9F, dass Sie =C3=BCberrascht sein werden, diese Mail von mir zu
erhalten heute. Ich bin Anna S. William und arbeite mit der Royal Bank
of Scotland. Dieser Brief ist sehr privilegiert und erfordert Ihre
sofortige Aufmerksamkeit weil wir einen unserer Kunden verloren haben,
der zuf=C3=A4llig aus Ihrem Land kommt hat auch den gleichen Nachnamen wie
Sie und er hatte eine Festgeldanlage
im Wert von 4,7 Millionen US-Dollar bei unserer Bank vor seinem Tod.

Aufgrund Ihrer Nationalit=C3=A4t bei unserem verstorbenen Kunden
Zimmervermietung m=C3=B6chte ich Sie der Bank als Beg=C3=BCnstigten des
Erbschaftsfonds vorstellen und wir beide teilen das Geld zu 50% 50%
auf, sobald das Geld auf Ihr Konto =C3=BCberwiesen ist.

Ich freue mich auf Ihre sofortige Antwort.

Mit freundlichen Gr=C3=BC=C3=9Fen,

Anna S.William.
