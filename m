Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503FB251C51
	for <lists+selinux@lfdr.de>; Tue, 25 Aug 2020 17:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgHYPcW (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 25 Aug 2020 11:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbgHYPcT (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 25 Aug 2020 11:32:19 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419D7C061574
        for <selinux@vger.kernel.org>; Tue, 25 Aug 2020 08:32:19 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id d26so7032428ejr.1
        for <selinux@vger.kernel.org>; Tue, 25 Aug 2020 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Of+I2UWBGx3UirpCOtesmCNu7KkQdUw9i3p5cDgGTg0=;
        b=Z8ORdIDdyl1GQXV33aN7CnhWH+LEeuq7FY1d8zLWdi8EP5kSCny9eZzbgd7+u43u4A
         wD7tbAAxYM2KAf6OIkeAUHTrt1Ub4K7LnJQrkjYI/3cOwaI6R7Kib6B0acBomh68oFaC
         B6CRVAE2+fz+3LyCodrtKKp1AO20AdaRzD74iQWCBnNwd3CyMDPEuTDKYsXjMHYg0/8y
         9EeX/4ZhL+rp+qu63LTnqnhYmDlJcPbqxovqOBc0N3yvjRE+9lJpv87vuuuQlrfn87Wj
         lz09dIBPhk2n0vVLb/rnUazkPosWoUOp17oxksQbAk16IdodInWWELL2hqFeXS4B0f8K
         a5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Of+I2UWBGx3UirpCOtesmCNu7KkQdUw9i3p5cDgGTg0=;
        b=ENxXQqX6G1+yfPllXJ8Sjt1VC4xgqKgoZUp0Svxy4VWOVrpMWYyCJF3TRDLlBSlYLt
         BR8inS38eioF4mbMULrWWA+/ogf2yqL/VL2KiPDhAWetuvJ8AmPn/fR1rXc0A0lPqlLJ
         CsfhWizR0kEdF/YJDbPv7vYPQrTYJlpJNJOZVGtJzzVVmMTd3ckOdFQJW6zdcdvWXMV2
         ZlRSd2KriHFKqoMfs5q4bZsugCJqGGjDx/hIEiFgSMHBZwGJjo/gTZ3yQ5hEWFklAHQn
         efLgAOfG9nCEf9BlJkNWGN8lMVP/PrDTZe/ymRhUYgd4Ldm8+ptXM8Dn5PSWOvRr/cR8
         977A==
X-Gm-Message-State: AOAM531ynCcJTzY+GzDLG1ydiqEFwExIxCcL4kfkOkuKOTxqccD748Yf
        08rYWGMrY46U2U6CknyezMbgX2YObvs=
X-Google-Smtp-Source: ABdhPJxMRqFv50R8DsRYOYeBzKRmG4fgJ/GqqWVdFhDsh1PbZl2JCxoTRjTzKNYDqSoJSpGV4OP7ig==
X-Received: by 2002:a17:906:f1c4:: with SMTP id gx4mr11429127ejb.98.1598369534686;
        Tue, 25 Aug 2020 08:32:14 -0700 (PDT)
Received: from debianHome.localdomain (x5f74352c.dyn.telefonica.de. [95.116.53.44])
        by smtp.gmail.com with ESMTPSA id v4sm14029167eje.39.2020.08.25.08.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 08:32:14 -0700 (PDT)
From:   =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To:     selinux@vger.kernel.org
Cc:     Mike Palmiotto <mike.palmiotto@crunchydata.com>
Subject: [PATCH v2 0/2] selinux_status_ changes
Date:   Tue, 25 Aug 2020 17:32:03 +0200
Message-Id: <20200825153205.224136-1-cgzones@googlemail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200824131841.55687-1-cgzones@googlemail.com>
References: <20200824131841.55687-1-cgzones@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Dropped first patch refactoring the access to the shared structure.

Christian Göttsche (2):
  libselinux: safely access shared memory in selinux_status_updated()
  libselinux: initialize last_policyload in selinux_status_open()

 libselinux/src/sestatus.c | 55 ++++++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 18 deletions(-)

-- 
2.28.0

