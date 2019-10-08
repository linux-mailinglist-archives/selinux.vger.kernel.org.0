Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2423FCF308
	for <lists+selinux@lfdr.de>; Tue,  8 Oct 2019 08:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730167AbfJHGy1 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 8 Oct 2019 02:54:27 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42892 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730131AbfJHGy1 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 8 Oct 2019 02:54:27 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 41CAC4075833
        for <selinux@vger.kernel.org>; Tue,  8 Oct 2019 06:45:06 +0000 (UTC)
Received: from slave.localdomain.com (unknown [10.64.193.217])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 78B16178BA;
        Tue,  8 Oct 2019 06:45:05 +0000 (UTC)
From:   Masatake YAMATO <yamato@redhat.com>
To:     selinux@vger.kernel.org
Cc:     yamato@redhat.com
Subject: [PATCH 0/5] dispol: add batch execution mode
Date:   Tue,  8 Oct 2019 15:44:54 +0900
Message-Id: <20191008064500.8651-1-yamato@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Tue, 08 Oct 2019 06:45:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Tue, 08 Oct 2019 06:45:06 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'yamato@redhat.com' RCPT:''
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

dispol command requires interaction, and is not suitable for using
in a script. This patch set introduces -b that is for running
dispol in non-interactively.

An example:

    $ ./dispol -b 1 /sys/fs/selinux/policy
    allow deltacloudd_log_t tmp_t : filesystem { associate };
    allow kern_unconfined sysctl_type : lnk_file { ioctl read ...
    ...

Masatake YAMATO (5):
  dispol: extend usage() to take exit status
  dispol: add an option for printing the command usage
  dispol: introduce a local variable representing the input file
  dispol: introduce -b option to run commands in batch
  dispol: add the list of commands for batch mode to help message

 checkpolicy/test/dispol.c | 96 ++++++++++++++++++++++++++++-----------
 1 file changed, 69 insertions(+), 27 deletions(-)

-- 
2.21.0

