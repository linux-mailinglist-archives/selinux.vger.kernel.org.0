Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5DAF2DDB
	for <lists+selinux@lfdr.de>; Thu,  7 Nov 2019 13:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfKGMB4 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 7 Nov 2019 07:01:56 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40853 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfKGMB4 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 7 Nov 2019 07:01:56 -0500
Received: by mail-lf1-f65.google.com with SMTP id f4so1390398lfk.7
        for <selinux@vger.kernel.org>; Thu, 07 Nov 2019 04:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xLWLg4AMHRTBaTwok08/sL/90UFY7qeJGvCbH9vvptw=;
        b=Nh/smNnz6grwlcOulPM1/Rpo+EzFufAHsSTxrj5N7FSt6iMnIK1E4ju/RzsrAAXBhE
         BENoUTbJVcbMXNlUpTwbm1qjCw0vr81NTamKE9SM0RVGLbPAs/o1L2N+oOKg5I0rUlcE
         G3A2qvOxEVCWU/oE9DHYx9b06bzzOUo2Nct5VO+ROKSrcezudNgSUvl9NkJNuEvFrqJg
         en7vc7YBe2sHV78AAxM831hoaLvfpObdfBUiUaW6ufJtVPNGPWkr3c9aqD4JFTnBv/7Y
         vzJMjx0P2bd8lJTP1SeQB0nUhgaDBRv7+t2Kad+p2Z4Z7GLOmbjK+x5HTjZMrBiP/IGq
         FR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xLWLg4AMHRTBaTwok08/sL/90UFY7qeJGvCbH9vvptw=;
        b=d3GKt0jJYhfl55417xMeE5e97BWvg5IjmLldiBVb2+EPCT+FnLjcNNg1LVDrkvGqsY
         QyOFSpOyzax+yVLklEYlXJnzkq/XcqRdEhuTPf0OV8dOXz/75QWYIhabmfM8DF8Id0Bb
         CT44ZoJm1d76um7GkKv4vjOXdy3ILdRAztxlR/pZauqGZnyVXHwecUUMdDi7KyahCN+s
         I6e2isVQ+cn82LTbS5RL5G95bia9CdYrbHOLtudNYCtzxLW3RRuwsFl3y67avCaH3uhU
         Yaty6CxHl9zrwPzz2wFrTjhiau35tdhzU9/Amfd3nxLS2l7/RZjDH1nr8ACmuRRSszEY
         Le2Q==
X-Gm-Message-State: APjAAAWGW7sEzg8XJi/8A+1QOmlhodInmtuikolCi2ipIRMShDFY3maG
        xRhGBgHE9R36zGA8fdRKyFM0aAFJ61N/Xe95R/KlNgIU/uI=
X-Google-Smtp-Source: APXvYqzoby0lflCQ3X6zA8Bj14FprP3v6xRJIMevpLSQBu1DdS32h8Zrjs+frNMK6iT6mtBZ+4oCs/1VCzAoY+DC6X4=
X-Received: by 2002:ac2:4243:: with SMTP id m3mr2175145lfl.24.1573128112321;
 Thu, 07 Nov 2019 04:01:52 -0800 (PST)
MIME-Version: 1.0
References: <20191107101743.203699-1-jeffv@google.com>
In-Reply-To: <20191107101743.203699-1-jeffv@google.com>
From:   Jeffrey Vander Stoep <jeffv@google.com>
Date:   Thu, 7 Nov 2019 13:01:40 +0100
Message-ID: <CABXk95A1aKrcSLmHxyoH+mdXoZTc83BRV8SOOwQbrnCw4gfAwg@mail.gmail.com>
Subject: Re: [PATCH v5] selinux: sidtab: reverse lookup hash table
To:     SElinux list <selinux@vger.kernel.org>
Cc:     Ondrej Mosnacek <omosnace@redhat.com>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>, will@kernel.org,
        Jovana Knezevic <jovanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Note this should be v4, not v5.

Paul, please let me know if you'd prefer my change applied on top of Ondrej's
 "selinux: cache the SID -> context string translation" patch.
