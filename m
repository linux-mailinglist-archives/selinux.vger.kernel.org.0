Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE3CE1A0328
	for <lists+selinux@lfdr.de>; Tue,  7 Apr 2020 02:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgDGAHP (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 6 Apr 2020 20:07:15 -0400
Received: from sonic306-28.consmr.mail.ne1.yahoo.com ([66.163.189.90]:43257
        "EHLO sonic306-28.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727849AbgDGACE (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 6 Apr 2020 20:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1586217722; bh=07RxbwAYxdKzaEWFrRtckoqoMx7n8almVlTczK2aHcA=; h=From:To:Cc:Subject:Date:References:From:Subject; b=eBspALgq4XjxiIg2ylMZEK7u9b+k8d3fHR2BOOF9X2eEGyBkGFR/zSSq+5jO9JI3U+WM26os58q0ZOVwKMD/YsLBG/J2Ic984v9ioaZqrmcDj7JVQloqPkT1CfMsdrwgoc0y5HGY45WrBpzdiqRueg3mcyJFs5OHoyQE1TZhrnZDGJYD017j+B0jjd4B+Tas7EhrsVCPUE3DAZfI5MEH29O8NGSchhyWCgI92oZ45l5c1of6Gz0w9D3Xyzi38+uUuKCh6XByQfrXSwKS1ntpT/TWPuG3jqg8E0gfutE8Luf2Tf81C6nwj+ok/9Z195wPWm9RGVX2xqH+XhiZBGHyGQ==
X-YMail-OSG: IxJe6lIVM1ks0tEiLLmYbqNAav2dL.2s5CHzZwDp7QjstyoDVLpzGKqh_p8hDx5
 r_vMQd.c0ZBPpF5WWIbiQanTXin8L_hgTtV3pe2L6d2qnX_42M2jVuqzsB32aij1Ks0Va8wx6yh.
 xxaEMVcsKlQKO0JjIyc_G_yvX6zFFnFtOc4p.QyvKDR_P2ik738QY2RApYoG8rcS9jPdjJ9jfAqR
 bU3rSYOzrh1vqWgD_dW0rD7tckFJnOtXLQkgCnAtujp2P0W6LHbDDA5VwwU00BIlYj1v.BGDYz8o
 HyIH_0GHWpeOqShH6Kt8v5bBE9giwAL87ks7DVD.Cs6JOGVC3G5l4ty4CtQg5hyvFs4Xd73uXLZH
 8VvrYjbdPzS9zwVOBjUIVpbRoQMnBiZpbHyIq4v3jWOmTsPCrXChXLYu4Lxt62IySBb7VNrDaA3g
 o_IgWSmWMfhxgOOfNFm5b8FgsagYwSq1AWPC_P5T7V.Cbj8LUIQOg8sh2N1p1JlLtDnQlCx2SAIF
 l3NsIX8CG7yk3T2C7Dt5dPkrYO28y4_yfhN_n1its4LGjRumGg4PuPt5orHAuYn1Mjvmzg0YaNZt
 g8lq2Sse_8Ypv7Q7KchY8vxo7pQWfTl1VZAs32TYQqSsDQ1Lr0sr6Ux2BEDs8jDIxRkoFX9vcUd.
 uFcwGQAzGZagEvQOS3Nju56iYUh98jJ08UKXeDpNcb6otz8KGqFZ0ihk6HLok6hF_ux7QZBjTPvb
 JHPDfmvFGMSvtFGCaabPgxav_9axXkPuW4eMi0IBVDb1dzvwwhfB0MSoyIxPab7RbrParwgOBUMy
 g3RXvpuS5xzQYXWGAJRdtMG9HD81G_tc5aPCJIKvEZ1_3fJDxg1BNUaAJ0QJX.bOh471GtVABIHm
 pjRzcnDJWNv2HWemuJaDRoZ30AUF.Dk1vsrgYBxY6ZLUg6sEjFpvxkzG7wNXFcKHurCRMoky7XJf
 xPejEBtYDV4QvxW_MqAbY.3xOtSKVp4bew3dgnfaCl6KkyHOweqEqdIXaQiGCNod.iVd2ENQWeeW
 ZWMouVl6kB.iAK9Zi4RTf5wWgJWCsjMxspjHwoIVynei6dEjw0TRanDFWCz4aGPK77F64xfwhbcs
 pig5lwDbR6kmh2tvsxzbPZygIm5nz0CU6PiAqHDq8RGbO2YOI890y86G1wNfv71Gujq7A4rYdRvW
 rPkfVfnNi5CR54PsJn9CF45yinIEN7w5xOQdHGlQrU59FzsePA7gZcX7WjHQUGRcYHWa7ryhuiue
 9hTQ.epp0.zi_l8KvcgQTyD7TlCXCFlTbrHWBQ8MFC5f2TN_a2pjM0sf5a.K2dN13UD.QrT6.VdN
 .CudwUnhWW4PVTcWQ_CFWbcaaYFTbpG15FpuvuqPN0iWhZXll_z48rmACQattdwZGCfBgs7HpmGd
 66wV8VKU_x60grV3VJYu4Flb4eFqlArOpL64IwHkG2qbpjO2ISuJfVoZBRyd_URyYSIFuwIEcAA-
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ne1.yahoo.com with HTTP; Tue, 7 Apr 2020 00:02:02 +0000
Received: by smtp410.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 8597051e2b8cfeb3b5bf16ded1858b53;
          Tue, 07 Apr 2020 00:02:01 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov, linux-audit@redhat.com
Subject: [PATCH v16 00/23] LSM: Module stacking for AppArmor
Date:   Mon,  6 Apr 2020 17:01:36 -0700
Message-Id: <20200407000159.43602-1-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20200407000159.43602-1-casey.ref@schaufler-ca.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

This patchset provides the changes required for
the AppArmor security module to stack safely with any other.

v16: Rebase to 5.6
     Incorporate feedback from v15 - Thanks Stephen, Mimi and Paul
     - Generally improve commit messages WRT scaffolding
     - Comment ima_lsm_isset() (patch 0002)
     - Some question may remain on IMA warning (patch 0002)
     - Mark lsm_slot as __lsm_ro_after_init not __init_data (patch 0002)
     - Change name of lsmblob variable in ima_match_rules() (patch 0003)
     - Instead of putting a struct lsmblob into the unix_skb_parms
       structure put a pointer to an allocated instance. There is
       currently only space for 5 u32's in unix_skb_parms and it is
       likely to get even tighter. Fortunately, the lifecycle
       management of the allocated lsmblob is simple. (patch 0005)
     - Dropped Acks due to the above change (patch 0005)
     - Improved commentary on secmark labeling scaffolding. (patch 0006)
     - Reduced secmark related labeling scaffolding. (patch 0006)
     - Replace use of the zeroth entry of an lsmblob in scaffolding
       with a function lsmblob_value() to hopefully make it less
       obscure. (patch 0006)
     - Convert security_secmark_relabel_packet to use lsmblob as
       this reduces much of the most contentious scaffolding. (patch 0006)
     - Dropped Acks due to the above change (patch 0006)
     - Added BUILD_BUG_ON() for CIPSO tag 6. (patch 0018)
     - Reworked audit subject information. Instead of adding fields in
       the middle of existing records add a new record to the event. When
       a separate record is required use subj="?". (patch 0020)
     - Dropped Acks due to the above change (patch 0020)
     - Reworked audit object information. Instead of adding fields in
       the middle of existing records add a new record to the event. When
       a separate record is required use obj="?". (patch 0021)
     - Dropped Acks due to the above change (patch 0021)
     - Enhanced documentation (patch 0022)
     - Removed unnecessary error code check in security_getprocattr()
       (patch 0021)

v15: Rebase to 5.6-rc1
     - Revise IMA data use (patch 0002)
     Incorporate feedback from v14
     - Fix lockdown module registration naming (patch 0002)
     - Revise how /proc/self/attr/context is gathered. (patch 0022)
     - Revise access modes on /proc/self/attr/context. (patch 0022)
     - Revise documentation on LSM external interfaces. (patch 0022)

v14: Rebase to 5.5-rc5
     Incorporate feedback from v13
     - Use an array of audit rules (patch 0002)
     - Significant change, removed Acks (patch 0002)
     - Remove unneeded include (patch 0013)
     - Use context.len correctly (patch 0015)
     - Reorder code to be more sensible (patch 0016)
     - Drop SO_PEERCONTEXT as it's not needed yet (patch 0023)

v13: Rebase to 5.5-rc2
     Incorporate feedback from v12
     - Print lsmblob size with %z (Patch 0002)
     - Convert lockdown LSM initialization. (Patch 0002)
     - Restore error check in nft_secmark_compute_secid (Patch 0006)
     - Correct blob scaffolding in ima_must_appraise() (Patch 0009)
     - Make security_setprocattr() clearer (Patch 0013)
     - Use lsm_task_display more widely (Patch 0013)
     - Use passed size in lsmcontext_init() (Patch 0014)
     - Don't add a smack_release_secctx() hook (Patch 0014)
     - Don't print warning in security_release_secctx() (Patch 0014)
     - Don't duplicate the label in nfs4_label_init_security() (Patch 0016)
     - Remove reviewed-by as code has significant change (Patch 0016)
     - Send the entire lsmblob for Tag 6 (Patch 0019)
     - Fix description of socket_getpeersec_stream parameters (Patch 0023)
     - Retain LSMBLOB_FIRST. What was I thinking? (Patch 0023)
     - Add compound context to LSM documentation (Patch 0023)

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

Patch 0001 moves management of the sock security blob
from the individual modules to the infrastructure.

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
instead of secids in Patch 0018.

Patch 0019 adds checks to the binder hooks which verify
that if both ends of a transaction use the same "display".

Patches 0020-0021 add addition audit records
to identify the LSM specific data for all active modules.

Patch 0022 adds a new interfaces for getting the
compound security contexts.

Finally, with all interference on the AppArmor hooks
removed, Patch 0023 removes the exclusive bit from
AppArmor. An unnecessary stub hook was also removed.

The Ubuntu project is using an earlier version of
this patchset in their distribution to enable stacking
for containers.

Performance measurements to date have the change
within the "noise". The sockperf and dbench results
are on the order of 0.2% to 0.8% difference, with
better performance being as common as worse. The
benchmarks were run with AppArmor and Smack on Ubuntu.

https://github.com/cschaufler/lsm-stacking.git#stack-5.6-v16

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
