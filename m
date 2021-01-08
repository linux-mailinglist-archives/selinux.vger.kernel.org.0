Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 108732EF296
	for <lists+selinux@lfdr.de>; Fri,  8 Jan 2021 13:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbhAHMfz (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 8 Jan 2021 07:35:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbhAHMfz (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 8 Jan 2021 07:35:55 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81989C0612F5
        for <selinux@vger.kernel.org>; Fri,  8 Jan 2021 04:35:14 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id h205so22560001lfd.5
        for <selinux@vger.kernel.org>; Fri, 08 Jan 2021 04:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=ik6B+6lkNc+iFrIPLOlH6nyfA0JsJ4cRGzVhof+Ll8w=;
        b=ht72jnqziCz6YTSdOk+2+MIO6kBfwjWj3xIweyH1sy2x79BNdpifj4Z4vM1MhSJKna
         UfFeNxelDd5Xqa58ZNffUnmnG6sHLElfRLg4Z+RPDV+AHp4pN9F7L10TRlrHFujfw1aO
         G49KFhAIMf4qWlCWSfngqrVcbhGwv3nTwxhLNxx5EsdUfNoUu+OV+00yPsmitbHdj3eH
         e4xfcvY347F1a3M/ffMM8Bu1K37DesOByOTOvlR4OzJ777jytZbnwOZc2UDMYUFrf7Zq
         FEvVMY6GhIOKUgAb+bZZpn+5BkwTOpRw9KDCYJiuCeMbavotYWFN2AgSc/qCznEvlnvu
         ShPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:content-transfer-encoding;
        bh=ik6B+6lkNc+iFrIPLOlH6nyfA0JsJ4cRGzVhof+Ll8w=;
        b=IxPvNPH5G2mbnMscJQp8LInDVvxpn28U1cE1bhtlYpztDb13lY6u/a0cQzR8Z4OZRD
         Tp6YPfvxtH7XPPuL6braQ6Tu8B9KAZpI0bwIqgqkB4Ceo8j8HxaKgrpjtIEeczU1YzD/
         jLcgNhxpLr3oEbOB9yM6fSTb9N9cTaMVd+yiVqzX5tpxzCycgJKBQ4PkuRV7jTDlDQc7
         4gNBQfSoSaxJyBiYaSMFH83pixUnFtSUX9aEeclMsVX6DW1zM0kpbwMvQgC4GfjdwOgb
         jCDj/F3PUXYEyu+LLRitpg6rS6lF/tPhBXzFwlCxW34hwVfIosbcGqaYGMWobg/3p3W+
         Vc5A==
X-Gm-Message-State: AOAM5311L4/J9RNUkOA2ZzOoH7U+umH7w8u2nrlGNH1bcqOhz0XUufRq
        nTrALVeT4ktEBZFOC57WZt6/j3beZC0Lhu2ials=
X-Google-Smtp-Source: ABdhPJzMVQ2seusTniSJWVqpO9AzSf9lT2HpeW7zBJ5fgpg4IT/uHdNu0WAyvUaGD89RL3ifT8dURU6VYz3MzEB/Q3k=
X-Received: by 2002:a2e:8e62:: with SMTP id t2mr1506251ljk.463.1610109313070;
 Fri, 08 Jan 2021 04:35:13 -0800 (PST)
MIME-Version: 1.0
Sender: messanhdekpo@gmail.com
Received: by 2002:ab3:4a0c:0:0:0:0:0 with HTTP; Fri, 8 Jan 2021 04:35:12 -0800 (PST)
In-Reply-To: <CAGayJq1i3hL7Z2DXSxH7_ZPLfOkLsBCrk_2STC5QEvWWuzRx7w@mail.gmail.com>
References: <CAGayJq1i3hL7Z2DXSxH7_ZPLfOkLsBCrk_2STC5QEvWWuzRx7w@mail.gmail.com>
From:   camille <camillejackson021@gmail.com>
Date:   Fri, 8 Jan 2021 12:35:12 +0000
X-Google-Sender-Auth: UZMXzI1mWnnHezrNV_agR8ziBr4
Message-ID: <CAGayJq0Nv3=fK77CkD7309VKrJU8QeAXfpSuQDz_vNY=mUei+g@mail.gmail.com>
Subject: =?UTF-8?B?0JfQtNGA0LDQstGB0YLQstGD0LnRgtC1LA==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

0J/RgNC40LLQtdGC0YHRgtCy0YPRjiDRgtC10LHRjywg0LzQvtC5INC00YDRg9CzLCDQvdCw0LTQ
tdGO0YHRjCwg0YLRiyDQsiDQv9C+0YDRj9C00LrQtSwg0L/QvtC20LDQu9GD0LnRgdGC0LAsINC+
0YLQstC10YLRjCDQvNC90LUNCtCx0LvQsNCz0L7QtNCw0YDRjywNCg==
