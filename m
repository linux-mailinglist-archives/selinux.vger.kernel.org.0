Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2F4812A47F
	for <lists+selinux@lfdr.de>; Wed, 25 Dec 2019 00:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbfLXXTX (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 24 Dec 2019 18:19:23 -0500
Received: from sonic311-31.consmr.mail.ne1.yahoo.com ([66.163.188.212]:42920
        "EHLO sonic311-31.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726246AbfLXXTX (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 24 Dec 2019 18:19:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1577229560; bh=+R0f5Pb+jzFZ/4+zq9nYc4/3+i9YVKFRUdvUCQRbbB4=; h=From:To:Cc:Subject:Date:References:From:Subject; b=qlfjAHZeoF3qCbSRCU/gtdNcpenMVWgsLb9xy8+hafGv3D0Xc/XrDbzjPyk2f6+r+dKwHtn7mHSPudSSnAE7dqHBWjUujvlVKak1pJr69gUs9d70Lghcs/ikm3bWX+CgSLb4ekse93TYQydI3vj2treZoaFTbQpCozWElz24EJa1CjgU0uRnX1JBv4E6owB94fft+XSWVDy9JzrFkk1WpHZegP9Qx50yTwDi05zgX8z36y25W7e4HeYGwfoWFDx5S6Ex3LF+Yr89Sl+VYooBjLYmejZZ2bYXxmp57vIBfAHaVq6luKQW1RUvRi+aMXrEk+8Xp+D1/efgotcVVHUaUw==
X-YMail-OSG: 7hnusrAVM1mxhUZRtBeHMfTSX04ANs304AF8n2G0akLCy4KcLe1lhPIh0R2S7PY
 ST3SMqH1PjLOrSg3QjSnFjvXIWlVxVuwqhegqoeYu8PCkRGUazojZ6TbeN_XtvPCnal4KElFlJ0o
 zZmwQLaozhZOYqQfwwP28QnBxmSWQg2Y87h3Gxpw.phlN1rOE2Zi8XrMkqjdWqtZn37tgvJ_pHBb
 upVAd1knEzgBN7.1GrxdfBGeARuPrG3OtJR5uat.GBHAbPmmrBwivcjhKZeVKxhwj3W1YT_eFUSK
 85Bp6dHF2uQN3WGydkmbsNYddftY1_X5TfzGh6xJtHMMehZwi7FlTwd4fKVVXruHlRjfT0VE9h41
 Txc4zAszLkUIOOdpw7u3kQVNtdWkbSgCSlqfhAealJT.amA1JkjgbQ4bG9zsjK95U67hqKEpUHlt
 7YSVKFIJH1FcInf8EpVYXoF0cuHK1tdyPLbWsTtt52HEBZpx1IpHljSr27FgPMI5.64gIyFSuC3z
 1hSTjoyRyVqeUsLpo083sELbyHWLeABw0alaSWpBX7SPJaMVfagvEf0r8rAP7s6tINHkS9GTtlTf
 r5ret9qWEGCXEHas_Dkv_mxX53tMmpf3ZMk0mQ1l8j5ewD9btyf56GiMSNaZWYDEsSxW5B1exOdc
 G49ou4sJ5f6Pyd3PwRTn1AluTmWYcUP1anaGfYrGc.mZZzVzzKMDcDEhNI_kN36p1SJIn6y_myyD
 d96MDhSsGcfR4ddRip7US5jDnBiJJB_W69KyuOfDPM9xLQIkUrfUVEiQc4Eu8LDSVKBEhl_EsrHq
 FY1oOYE8IOUfASGP9MMgl4QleLYpBpLX_vzXdtvbDpLCQz2FESvVFsFQ0dI5Z42rFFPYgjDUR9gO
 0QIA8YayOPdx3_rG7q5Cl3M_prlTVL9DxjIdZKVqO5n57NzjGaeYpaDjJWSvqjloWoP3P98Ry31p
 F2rpsjm_TI6QVG3FcWWYNeSg77vgaN3NpKixoo.8ca_MF58RGNZLdoA_zkdnH9TzlxOMCr_EcuE_
 aW6Dj936s2__ZiFoJFHnSkNc0E7vC7XGmRLkbV_3KLAv6rI862FXeHmygE_u0Gh5wwlDX8wdc9ob
 u1KUcaD4UgZ7tTjsQMZYHB7KT6c1iLkxhLJbqt6luM.yz38tRvSJSzzYDqYmU2JtbGgS5nFi1hAP
 ffmjATX4mMHpygrx2yuzNgqAPzxRCF4ShyMmyAXzFLT6V9gNuF3hyaoZ0iiyxEWV4TitpBtypaf2
 wHxmFMjIgfW1WV8n6tFS7FoRV_fNfTdQNLKHBl4vQifh4Kiia4gNraqD06emFaD.7rPsUjT5EzIg
 fqFUdTw3fnRA1J2G4MTfgYpq_9KOEiUQSuMan3lj1rONef9aKnKUxs.utxOqPpF5kVORGRtt.1aj
 OTqsdb523ID5rIFEl6.JmOzG4narv51pMUrKeJosdZls-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ne1.yahoo.com with HTTP; Tue, 24 Dec 2019 23:19:20 +0000
Received: by smtp407.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 0cf5d1455933ac200e57b998822e3b74;
          Tue, 24 Dec 2019 23:19:17 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH v12 00/25] LSM: Module stacking for AppArmor
Date:   Tue, 24 Dec 2019 15:18:50 -0800
Message-Id: <20191224231915.7208-1-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20191224231915.7208-1-casey.ref@schaufler-ca.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

This patchset provides the changes required for
the AppArmor security module to stack safely with any other.

v12: Rebase to 5.5-rc1
     Fixed a couple of incorrect contractions in the text.

v11: Rebase to 5.4-rc6
     Incorporate feedback from v10
     - Disambiguate reading /proc/.../attr/display by restricting
       all use of the interface to the current process.
     - Fix a merge error in AppArmor's display attribute check

v10: Ask the security modules if the display can be changed.

v9: There is no version 9

v8: Incorporate feedback from v7
    - Minor clean-up in display value management
    - refactor "compound" context creation to use a common
      append_ctx() function.

v7: Incorporate feedback from v6
    - Make setting the display a privileged operation. The
      availability of compound contexts reduces the need for
      setting the display.

v6: Incorporate feedback from v5
    - Add subj_<lsm>= and obj_<lsm>= fields to audit records
    - Add /proc/.../attr/context to get the full context in
      lsmname\0value\0... format as suggested by Simon McVittie
    - Add SO_PEERCONTEXT for getsockopt() to get the full context
      in the same format, also suggested by Simon McVittie.
    - Add /sys/kernel/security/lsm_display_default to provide
      the display default value.

v5: Incorporate feedback from v4
    - Initialize the lsmcontext in security_secid_to_secctx()
    - Clear the lsmcontext in all security_release_secctx() cases
    - Don't use the "display" on strictly internal context
      interfaces.
    - The SELinux binder hooks check for cases where the context
      "display" isn't compatible with SELinux.

v4: Incorporate feedback from v3
    - Mark new lsm_<blob>_alloc functions static
    - Replace the lsm and slot fields of the security_hook_list
      with a pointer to a LSM allocated lsm_id structure. The
      LSM identifies if it needs a slot explicitly. Use the
      lsm_id rather than make security_add_hooks return the
      slot value.
    - Validate slot values used in security.c
    - Reworked the "display" process attribute handling so that
      it works right and doesn't use goofy list processing.
    - fix display value check in dentry_init_security
    - Replace audit_log of secids with '?' instead of deleting
      the audit log

v3: Incorporate feedback from v2
    - Make lsmblob parameter and variable names more
      meaningful, changing "le" and "l" to "blob".
    - Improve consistency of constant naming.
    - Do more sanity checking during LSM initialization.
    - Be a bit clearer about what is temporary scaffolding.
    - Rather than clutter security_getpeersec_dgram with
      otherwise unnecessary checks remove the apparmor
      stub, which does nothing useful.

Patche 0001 moves management of the sock security blob from the individual
modules to the infrastructure.

Patches 0002-0012 replace system use of a "secid" with
a structure "lsmblob" containing information from the
security modules to be held and reused later. At this
point lsmblob contains an array of u32 secids, one "slot"
for each of the security modules compiled into the
kernel that used secids. A "slot" is allocated when
a security module requests one.
The infrastructure is changed to use the slot number
to pass the correct secid to or from the security module
hooks.

It is important that the lsmblob be a fixed size entity
that does not have to be allocated. Several of the places
where it is used would have performance and/or locking
issues with dynamic allocation.

Patch 0013 provides a mechanism for a process to
identify which security module's hooks should be used
when displaying or converting a security context string.
A new interface /proc/self/attr/display contains the name
of the security module to show. Reading from this file
will present the name of the module, while writing to
it will set the value. Only names of active security
modules are accepted. Internally, the name is translated
to the appropriate "slot" number for the module which
is then stored in the task security blob. Setting the
display requires that all modules using the /proc interfaces
allow the transition. The "display" of other processess
can be neither read nor written. All suggested cases
for reading the display of a different process have race
conditions.

Patch 0014 Starts the process of changing how a security
context is represented. Since it is possible for a
security context to have been generated by more than one
security module it is now necessary to note which module
created a security context so that the correct "release"
hook can be called. There are several places where the
module that created a security context cannot be inferred.

This is achieved by introducing a "lsmcontext" structure
which contains the context string, its length and the
"slot" number of the security module that created it.
The security_release_secctx() interface is changed,
replacing the (string,len) pointer pair with a lsmcontext
pointer.

Patches 0015-0017 convert the security interfaces from
(string,len) pointer pairs to a lsmcontext pointer.
The slot number identifying the creating module is
added by the infrastructure. Where the security context
is stored for extended periods the data type is changed.

The Netlabel code is converted to save lsmblob structures
instead of secids in Patches 0018-0019.

Patch 0020 adds checks to the binder hooks which verify
that if both ends of a transaction use the same "display".

Patches 0021-0022 add addition data to the audit records
to identify the LSM specific data for all active modules.

Patches 0023-0024 add new interfaces for getting the
compound security contexts.

Finally, with all interference on the AppArmor hooks
removed, Patch 0025 removes the exclusive bit from
AppArmor. An unnecessary stub hook was also removed.

The Ubuntu project is using an earlier version of
this patchset in their distribution to enable stacking
for containers.

Performance measurements to date have the change
within the "noise". The sockperf and dbench results
are on the order of 0.2% to 0.8% difference, with
better performance being as common as worse. The
benchmarks were run with AppArmor and Smack on Ubuntu.

https://github.com/cschaufler/lsm-stacking.git#stack-5.4-rc6-v11-apparmor

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 arch/alpha/include/uapi/asm/socket.h    |   1 +
 arch/mips/include/uapi/asm/socket.h     |   1 +
 arch/parisc/include/uapi/asm/socket.h   |   1 +
 arch/sparc/include/uapi/asm/socket.h    |   1 +
 drivers/android/binder.c                |  26 +-
 fs/ceph/xattr.c                         |   6 +-
 fs/nfs/nfs4proc.c                       |  22 +-
 fs/nfsd/nfs4xdr.c                       |  20 +-
 fs/proc/base.c                          |   2 +
 include/linux/audit.h                   |   1 +
 include/linux/cred.h                    |   3 +-
 include/linux/lsm_hooks.h               |  37 +-
 include/linux/security.h                | 175 ++++++++--
 include/net/af_unix.h                   |   2 +-
 include/net/netlabel.h                  |   8 +-
 include/net/scm.h                       |  15 +-
 include/uapi/asm-generic/socket.h       |   1 +
 kernel/audit.c                          |  72 +++-
 kernel/audit.h                          |   9 +-
 kernel/audit_fsnotify.c                 |   1 +
 kernel/auditfilter.c                    |  10 +-
 kernel/auditsc.c                        | 127 ++++---
 kernel/cred.c                           |  12 +-
 net/core/sock.c                         |   7 +-
 net/ipv4/cipso_ipv4.c                   |   6 +-
 net/ipv4/ip_sockglue.c                  |  12 +-
 net/netfilter/nf_conntrack_netlink.c    |  20 +-
 net/netfilter/nf_conntrack_standalone.c |  11 +-
 net/netfilter/nfnetlink_queue.c         |  26 +-
 net/netfilter/nft_meta.c                |  13 +-
 net/netfilter/xt_SECMARK.c              |   5 +-
 net/netlabel/netlabel_kapi.c            |   6 +-
 net/netlabel/netlabel_unlabeled.c       |  97 +++---
 net/netlabel/netlabel_unlabeled.h       |   2 +-
 net/netlabel/netlabel_user.c            |  13 +-
 net/netlabel/netlabel_user.h            |   6 +-
 net/unix/af_unix.c                      |   6 +-
 net/xfrm/xfrm_policy.c                  |   2 +
 net/xfrm/xfrm_state.c                   |   2 +
 security/apparmor/include/apparmor.h    |   3 +-
 security/apparmor/include/net.h         |   6 +-
 security/apparmor/lsm.c                 | 117 +++----
 security/commoncap.c                    |   7 +-
 security/integrity/ima/ima.h            |  15 +-
 security/integrity/ima/ima_api.c        |  11 +-
 security/integrity/ima/ima_appraise.c   |   6 +-
 security/integrity/ima/ima_main.c       |  42 +--
 security/integrity/ima/ima_policy.c     |  19 +-
 security/integrity/integrity_audit.c    |   1 +
 security/loadpin/loadpin.c              |   8 +-
 security/safesetid/lsm.c                |   8 +-
 security/security.c                     | 593 +++++++++++++++++++++++++++++---
 security/selinux/hooks.c                | 109 +++---
 security/selinux/include/classmap.h     |   2 +-
 security/selinux/include/objsec.h       |   5 +
 security/selinux/include/security.h     |   1 +
 security/selinux/netlabel.c             |  25 +-
 security/selinux/ss/services.c          |   4 +-
 security/smack/smack.h                  |   6 +
 security/smack/smack_lsm.c              | 124 ++++---
 security/smack/smack_netfilter.c        |   8 +-
 security/smack/smackfs.c                |  10 +-
 security/tomoyo/tomoyo.c                |   8 +-
 security/yama/yama_lsm.c                |   7 +-
 64 files changed, 1372 insertions(+), 560 deletions(-)
