Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAD33242AF3
	for <lists+selinux@lfdr.de>; Wed, 12 Aug 2020 16:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgHLOJS (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 12 Aug 2020 10:09:18 -0400
Received: from linux.microsoft.com ([13.77.154.182]:40608 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726468AbgHLOJQ (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 12 Aug 2020 10:09:16 -0400
Received: from localhost.localdomain (c-73-172-233-15.hsd1.md.comcast.net [73.172.233.15])
        by linux.microsoft.com (Postfix) with ESMTPSA id 9FA8320B4908;
        Wed, 12 Aug 2020 07:09:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9FA8320B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1597241356;
        bh=CIDSHeUKil5FvKkVkOv66th7fRiEgmhEN6Z0fLSFo3k=;
        h=From:To:Cc:Subject:Date:From;
        b=OFaNAq5umx8ukRlx+lYu72cOtIx+W8yyrnpRUXFyFsd2fjkfDYFMMYhoW5s8QXP3J
         3Cs5N+PjjD7fJ/tNSKMtcpzuPx0jMaqOgvQlnCKvY/GMk4KxmDBHlh39SfVaz3HDIH
         qmRh5QlnumlZ6NqfHbOdpvtihPDyO9tAv3aty3e4=
From:   Daniel Burgener <dburgener@linux.microsoft.com>
To:     selinux@vger.kernel.org
Cc:     stephen.smalley.work@gmail.com, omosnace@redhat.com,
        paul@paul-moore.com
Subject: [PATCH 0/4] Update SELinuxfs out of tree and then swapover
Date:   Wed, 12 Aug 2020 10:09:03 -0400
Message-Id: <20200812140907.1102299-1-dburgener@linux.microsoft.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

In the current implementation, on policy load /sys/fs/selinux is updated
by deleting the previous contents of
/sys/fs/selinux/{class,booleans,policy_capabilities} and then recreating
them.  This means that there is a period of time when the contents of
these directories do not exist which can cause race conditions as
userspace relies on them for information about the policy.  In addition,
it means that error recovery in the event of failure is challenging.

This patch series follows the design outlined by Al Viro in a previous
e-mail to the list[1].  This approach is to first create the new
directory structures out of tree, then to perform the swapover, and
finally to delete the old directories.  Not handled in this series is
error recovery in the event of failure.

Error recovery in the selinuxfs recreation is unhandled in the current
code, so this series will not cause any regression in this regard.
Handling directory recreation in this manner is a prerequisite to make
proper error handling possible.

In order to demonstrate the race condition that this series fixes, you
can use the following commands:

while true; do cat /sys/fs/selinux/class/service/perms/status
>/dev/null; done &
while true; do load_policy; done;

In the existing code, this will display errors fairly often as the class
lookup fails.  (In normal operation from systemd, this would result in a
permission check which would be allowed or denied based on policy settings
around unknown object classes.) After applying this patch series you
should expect to no longer see such error messages.

This series is relative to https://patchwork.kernel.org/patch/11705743/,
Stephen Smalley's series to split policy loading into a prep and commit.

[1] https://lore.kernel.org/selinux/20181002155810.GP32577@ZenIV.linux.org.uk/

Daniel Burgener (4):
  selinux: Create function for selinuxfs directory cleanup
  selinux: Refactor selinuxfs directory populating functions
  selinux: Standardize string literal usage for selinuxfs directory
    names
  selinux: Create new booleans, class and policycap dirs out of tree

 security/selinux/selinuxfs.c | 200 +++++++++++++++++++++++++++--------
 1 file changed, 158 insertions(+), 42 deletions(-)

-- 
2.25.4

