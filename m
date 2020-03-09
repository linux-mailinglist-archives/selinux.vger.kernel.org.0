Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1BD817E38A
	for <lists+selinux@lfdr.de>; Mon,  9 Mar 2020 16:25:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgCIPZr (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 9 Mar 2020 11:25:47 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:36899 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgCIPZr (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 9 Mar 2020 11:25:47 -0400
Received: by mail-pg1-f181.google.com with SMTP id z12so4848894pgl.4
        for <selinux@vger.kernel.org>; Mon, 09 Mar 2020 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=kyuHHcbUt1hCc4zC5GeCe0jAhpsOyjAJYpff0Vaf0t0=;
        b=jTdHsw7S5l2IDeJhaAFpK5cNARYP8JkUv2367n2C2y40U/2PXc8LzTf7YymmTbhX42
         iQGqmDo2UAvJe/GofFpOG3xYDv0ppmoSDgsmsY9HDh5cQIsq5yVS6wAQuXWCs3uNFmep
         vtkohGrebkJnCdOm3wLIJBujB31qP4T7vKQTfhTFluAJR+ozp/w8QcljPCCGJRI6dy+d
         onpqWzFNw2ROGRo80t5YcI6AePMoHJXbTO8PnCBB38kFKIM73ObzXqiCiRpfoFibXBh/
         MpL9jxUMmjr/qIfNhWlZh0t4mrdSULk3ytOXEmrIFGQ1Qtrwtz/4vBi0AsvEhyww9Z+s
         fkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kyuHHcbUt1hCc4zC5GeCe0jAhpsOyjAJYpff0Vaf0t0=;
        b=dOg5pFjIsTPaqHtFx9pwCNfOo9qkrrdfyJY7Oq+thcDLmUEFt5V9mcw7OJMkYQLNPF
         Id/6obdO7AhZ7YGT9chnkPHyHY+asvMCHOm0P6kQPxrM+Vds50GeUX6sC9yPnRq0Y0Af
         Kxd2ss4pUVy5IceU4SqJeDHfmSTJWgFo7YhhYnJca2rpQKAsCjxjkfS83GOYCOONdmqQ
         Ph83BqPRkp18ikfKFTgjUtjYeiVoxPIjd+XercFw4BaX3WS/WEhi3WNC3GnSLA6BA5Yi
         QQ8VQtsv9HbmUm2lRdEvKRYVPUiGlW+FUvDPui2Be3LWCTJLMcCkTP/AYeKdcErDubsd
         CLFg==
X-Gm-Message-State: ANhLgQ3DZGjMj8wZYQFZgZzm1z4WbEGvGgItxiki21NfqPYw0Wy3KQbO
        19TEO9RFUbkroM564+PXNIo=
X-Google-Smtp-Source: ADFU+vv+8Lb5+QJ5kqMR39W1mizRl3sB4HqBvBqkRwyLbDGkWEFuea7Aq1DgQ1WwIwFvbGT3twHVlw==
X-Received: by 2002:aa7:914b:: with SMTP id 11mr17727187pfi.69.1583767545638;
        Mon, 09 Mar 2020 08:25:45 -0700 (PDT)
Received: from localhost.localdomain ([192.55.54.42])
        by smtp.gmail.com with ESMTPSA id f4sm9800725pfn.116.2020.03.09.08.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 08:25:44 -0700 (PDT)
From:   bill.c.roberts@gmail.com
X-Google-Original-From: william.c.roberts@intel.com
To:     nicolas.iooss@m4x.org, selinux@vger.kernel.org
Cc:     bill.c.roberts@gmail.com, drepper@redhat.com, omosnace@redhat.com,
        plautrba@redhat.com, stephen.smalley.work@gmail.com,
        william.c.roberts@intel.com
Subject: libsepol drop dso.h
Date:   Mon,  9 Mar 2020 10:25:37 -0500
Message-Id: <20200309152539.8581-1-william.c.roberts@intel.com>
X-Mailer: git-send-email 2.17.1
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Following up with the dso.h drop, this follows in the same footsteps
using -fno-semantic-interposition and a linker map script. Libsepol
already had a linker map, so nothing to do there, I just had to add
the -fno-semantic-interposition. Also, in keeping with similair
behavior to libselinux, I set the option on the overridable CFLAGS.

[PATCH 1/2] libsepol/dso: drop hidden_proto and hidden_def
[PATCH 2/2] libsepol/Makefile: add -fno-semantic-interposition

