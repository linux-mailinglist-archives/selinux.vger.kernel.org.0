Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4962B3F10
	for <lists+selinux@lfdr.de>; Mon, 16 Sep 2019 18:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732060AbfIPQfa (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 16 Sep 2019 12:35:30 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:40625 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbfIPQf3 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 16 Sep 2019 12:35:29 -0400
Received: by mail-io1-f54.google.com with SMTP id h144so507110iof.7
        for <selinux@vger.kernel.org>; Mon, 16 Sep 2019 09:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=S5lKmLwzAgQTUR1BK1ncmsC1psm/dHFp7epuC/dgBxo=;
        b=pdHVdhpzJ6TsUbyyw7vw55SHwnndJr/dPtiBWuepnuICElvGmc+WzFv5QvRSgATTSX
         SJyhbKoDV8zonFu2tEy0Q3mtJPQxdhg8KxB8JuRBvVB9mPvvvQfGED1+unhLQWhNjHE+
         53PKlqTsSvMWXhTSM72eb+H6zUo1osRKqXJush9ckJb/rN96tLmSGEbiZ29ueMtBrHll
         YddJTx2NP0NeEJhwaOSguSV9sWLayESF8jxfSreN8CaxUt+k7ZTEEMnDjUetKCJf6pXM
         1fKre7h/Gtvy5ds7VxcV3EtRnw+iMwqeQaWdibF33yipFNJ2AuJHIDChbv/bapVTEPq2
         JlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=S5lKmLwzAgQTUR1BK1ncmsC1psm/dHFp7epuC/dgBxo=;
        b=gy3k2I8Lrhk51kpxySwKJ0aVnsksrpGe1/ePywgIUqJKky++OKR/G7FJJRm9wB/ZHw
         OIM5TuGN6ASaNaV3Eb1utP45MtdOU8v3T/+Ji2cLgcfry9fUeUftcuXtp6+r2Fu0APWA
         a79sjkThvRYcZ9CxPT6f+NYjgqyMrjsADTbMCI1QrZJNCYIN2NxoudzFyLu+RhMMbiAX
         NTrI7F9JmK9FizIdlI4CJTNrMburr4oUk4oL9nKJmCkrc2HSOugur65Uo1SzSikuQAfF
         Tq/eN8EJZhhBu13TQpK+WU6m24Nb/aUjH4zHh/EjkT34ahLuhzlDZ0s/gmnVawJLcCh6
         1jAQ==
X-Gm-Message-State: APjAAAUi1aXyywRRYMJDrcE/5UENSsIX3e49XwqIqHnBDdxq2pEgAnTx
        JjxU98vxvxgv1nS8rE+WlRPirdm4k3vdssQBWRZVC0mC
X-Google-Smtp-Source: APXvYqyI8uFPcKQJCjj7cJdweU9Fnc/Cd4wtT8LGsOy9vfMtEToMUGbXoSbvS0l+OvnrhQ8kW8r97D442gH2/19Zwqo=
X-Received: by 2002:a6b:f80f:: with SMTP id o15mr858181ioh.174.1568651728549;
 Mon, 16 Sep 2019 09:35:28 -0700 (PDT)
MIME-Version: 1.0
From:   William Roberts <bill.c.roberts@gmail.com>
Date:   Mon, 16 Sep 2019 11:35:09 -0500
Message-ID: <CAFftDdrq1pw6X18_NMBysEq+rMxqZt5ONFFYWn=YUACny+kV1Q@mail.gmail.com>
Subject: Ill be out for a month
To:     selinux@vger.kernel.org
Cc:     Stephen Smalley <sds@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Just an FYI, ill be out the next moth or so. Until about Oct 20th. So,
obviously, I won't be helping out with any maintainer
responsibilities.

Thanks,
Bill
