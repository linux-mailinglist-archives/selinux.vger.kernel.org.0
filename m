Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 821692BB653
	for <lists+selinux@lfdr.de>; Fri, 20 Nov 2020 21:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729255AbgKTUPX (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 20 Nov 2020 15:15:23 -0500
Received: from sonic305-28.consmr.mail.ne1.yahoo.com ([66.163.185.154]:37906
        "EHLO sonic305-28.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728670AbgKTUPX (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 20 Nov 2020 15:15:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1605903321; bh=I5NB5cosafnJXrpu1Zj3FjbVb3kqYodWbcXcg9IpgaI=; h=From:To:Cc:Subject:Date:References:From:Subject; b=ueNPpQQxumsbmyrZ551aU2JI3IisVEqMx1HfyGh3+5jnXtwwDFGifRL9V8rNxApx4wMagIebY/c2+j9rN/NtO61H32FVK8xrUR+V5859jiqh8bsLoQ577HWo8499F2QTS3hq8uLh81yPoQypWxxWLd5xuSaIYDoXZj13lTAYuD6HBFP7itAGllZouME6lHmtbkJhp8Y0EQC4Pn3EEcfmhY/bnb0vOxLeL3cjAUSyqGxV7uebjA3ePY8/BzR3V2fGO1hlRkUkuNTPivYPjrfWY2jzsi9N1fEz1d4CYckhcc+27ufv8l+Nbbj3fFxo4/Rj3iX4TNFP2HQLDFYhdBh3yg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1605903321; bh=1/DX4INppZ6jMLZ2tJzdl0NhR2yeulLDJ+0Afkn0cFM=; h=From:To:Subject:Date:From:Subject; b=URu1e7OIyabo/NxEsCWxZrxNNLh98MIITs4BXQfFBfVGk614a4xGsTMgw8Pi/QzbZElyU9dwE0dLM2gkblLngiRk1bMQiJ1R+jeYJlJM0HnoN56oRMu+c3Lj5xPbXtBEG8ZJ0U7ETlQu5lpqHg7VRV/8OF1Aglt+RG8UuTd/PMU5rYB2yL5tpYxRvHwfzG3HrUyxPgnQ+9GT55m+hPAPNse6AyokZS0pNlPMsaCktToETm/z8TITu4s5v5XYfWKp4EQdpJ/WYX6aN04AqE/8MHFrW2bCft8JxGWqyL9KIdxZqbNR4ZfBvVbm+aK7h0ZcSudG2eLXxYzudFNIl2ufcg==
X-YMail-OSG: mpLXPPIVM1niWz4ZFFu.5liMhQYTIzDETDoxEEOpnuy0kMGeN3ugMs9773OOv80
 CxwwIS3gGpuE5B6fHNH_rBj8aKWg9FCkVGIzl6dtPKWQuV3V31pQir6LFe40HlZak6XyhWQIcdRd
 dWbzGrBSwyxPB.NtuyYiAeNpuJF0XFanhvEH8y2eh5EVAVX.22bOBMyqvqBgQlNHARVErNNv126n
 U.1rPYrYNzbA1.9hGWrPzSq8GvXQd2sUmgaHXe.ruKBmxWxoS50QE5tmfgGXq0_hdcMX8I.UGhYT
 cPP39N936uJK7pzpfBYXbsZCOvC11qZRPoqLNtpk0FAYjJS9vDcGrnXULcdHbelhqRVi4dBv9QJH
 TtT7fa4Kio7_m2q4V3Vh3Yl0RQTy3j5BrcXQ6OtDO2iIWrAgde2mT__agB_2otLKd3TNfwny266l
 Lp.cwpFjfre9y.NfD9T1S1HZY33R8Odyj_ZTCuk41C.sapMYXfkRX.vVnI25qB_v2MjVemhzMBOp
 MWrqmxP5ygPH06S8kXj5xblSMcJiHzdfVlrdlQkeV6JXW.ompw6U8gXPJR3Z3QNn_CTH18c99XLp
 S7P7Ja229aanP8lVrl86LZRlDgcVit0U8umQrShfxSKuo49fNAQMGv57HPZz4x5fKW7G1nQaztgh
 5yyWtVeGk5Pffjg_jbdOUlr87iWdhBXIf1peyxYLKJfjLBdaYz9HoWo.ZZot800.DsvZF_FPhx8Q
 XZfSf.6.ABt6r9XnkgRNp7b7EtskR3kuh0okKdCcJdMSN9tbwBHMqo7ZXlZV_hyvQuoKniZBdMAy
 CCwMZAJDcJ4EadWyRivJMc2oHg6OHjoX9g1mRjBCBreNAnhjZW_0Fh_ZHi7ZbRjtpnuAoC9nTNYq
 QHfsYuSEeieqeThA6x3edkYNGjIRHol6KTOtIrr0zhv6zREm2Nkh7.iO4H_leJT4zKiY16D4YE4_
 xnzMMjIbvLxMGifRBgEUwSuJW0nV4KPbaXE0kvGK8Zrc30JpEoGIMaRZVyzC9c1ZRut_r4sO0RFc
 6xCcUmti8WKaRRzGHE_OKxgHfMUwYfqZqiH9SDkMuexV0QRdTZQsK_NlSBbJgCnh.nS3Tw0dhcOy
 JFi4cSe.XtKk9MXS7XCwQl1G6U0jewoD3KWu25WSoIiQGV0CXooE6lhiNbsvSNFaDYQR13ULI5Hm
 eZ1kkTJeI.zf_Q5o.95IC0j11rLS9_vWI9EdixuPgsAgfUumjozz0Seprbe6Kf0TloEVXwEI8OCu
 aAyT7c5yLOEiIzEnblzHWrciN.nRbeweuMpRm2f0m9I8tUclgz.aOzp8JDK2lpPJ.nH6RAsXRCOC
 .GWokRZkeuoHToJhLCgHnakdbn5USrSNMroXfk.BETgjE4dWxm6GK45bZEVTaj4Cg.jlb8cEjvgc
 K9eIc6jdqq4pymdKBXDVQiTOYCSx9oPItnfAi_eHm3eewJAzSkRd5Woon5md.46GohIphySvLiPG
 hJdhYwzHjwLCRIyvRyz.zhvkljp2qm3HTR4apR7rsFrqgsQhe9utAYtHaKbbt6m0BD1SAxMp__C_
 tECHS4Uh5NMxScgp.rGq8nLkl7rYabgjHkZ5uTBdLDnVAKarVnQMTfKyiJlamH_2v_XriQAFPQrF
 lin7Cw1dbcKnvZ7aafs1REPK.br27SWvQEfSaXNEeLWyzdcY3ime1_Ey9Modn0WGsZ25tvUk8Wa4
 oD5IZ9IodPnBqU.LwUH.Hisu0G9Q0cvNbSHKDqj.NrcM3K6z8GX5lCbiDNHN9.QdlIy8_yFyzAg9
 LaFjUGQu5aJq75tEpSLM2bUvylC8L56f0lq4KushNYiKaO7Q668r4MgWL6kgjU2M.G0hHBaqNFDY
 YPXSweB3qiCGdK7HuHPBVAckTy5nik5_VV0Ag6KrlvdLY8yPni2hyzvdewMGtSZft2EG49g0WjiI
 OFHganEX.uWVTbopRKhdWAhWBweUcmBy9PA.pR8gWvAfKWW3p606kVz0RtC5tbOSK1Sa7OZEaoQF
 lOv7KVAiq1DhszriIHMLeI7L7TvsSCNsRKCD3Q8dge6kN4SIgU1j2eJAp8P3Ie9w_ZskkE0IA6HA
 XhdfaDvO4Xzu5e5_cVEyI80v1XgfwHCze6fUDVr.pCAqGda2s269PIerHpem1FD63nzGWX.zUgP2
 VE9PoVIAAtk8ANGVjxpgzJRt7doXFJxxNyPnO3F4RwMz1pS4IpOicxiYY23GUFE24jZJQx86Hms1
 LmUUFQ04UhfE5dyhJPsyJSZHpnZqy_e53gE2ogyrbPkEpuFE9LTy6IzvHwLZkZ_5.zuFfONeJQqM
 DDizlFpTsXWLfYy7U5YNQ8KEidbz_IWFsaSjpgMmWg5DrjoUt6pudOxcoIFWWw_jRJfGN.VRGn3w
 6SNofxEuWNZWGrR_CjbhgP2wo5b1Xx1dXf5pwRIIrKFI7xLv0NPCDNBUgpBHljCHMokG2wPx1qx6
 hGO15eog2tl3LM5StaMQyAuUWmZQPLwguAiVisq4pAwW9Yuc87e.eSLW9LR7aMNEfbsCYiCt6c45
 gWFA9SvZLpR0LLnC.OVZgS4eTEXdJX7.jT.LgUKw0fdDXS4dgCZxRd854uK3pQlMeFHLsLh85tMf
 uxnNYhQ46gufvhh4xo9ki6aRi9vr5DBLAIupXvNrhZVaDEAA0xRpiric54jc7tYxVkpcSfH4AqZ7
 H8MtQRKZ5b.mKCKNPsvYbHgmD2L.lRmLpYaIZA0r4QoLAzBDIUyGLpUxu4WpAcuMpsIaioPKsSUo
 _dZEmGiDv6cNymWlZgHK1pccKUJzDKXiGi1zsn63NKB3CzeUzsjMYUJ31JXYuo.avBdyTNwEZ4Em
 D8RvqiFoudx1hb1r6e1C.EmsJK00NlxGq.eioTJSZsIkML_KRHNRZ2LLfYlUk3TpHidEVyf7WVUJ
 hSrmvvwQirwpDalWD0KBmGIvoYQaFOLPQDwFC3i36shzvldWKBJePWabeBDkltQkYpFEce6G..NP
 mX6nRUR_rGunvwTHKb4CUyQZX1yufPF1tvGT7JPw8pfOf3Kzzv9RsbhHp63Pokyrw4nkdT.o9n62
 2b5AAdWjY5wMmnc3Kn._tiHVth1bOw3xgPBihYBdK0XU6tVCUb4rhimgXtg1g61ODemXPARHlDEG
 k1k2zNOZFxBnPVCaXAQdQwE3g9IxNXN8bWlt00doZdj.ThIZGOY28sDwpmf_IFZy3Xni6dcffeJ7
 mHv8cuyomUSHgPzUyrlxA__sXYNa4xLcdDV0cdkBHv20M_lodFRR80IKL1MiTUV4ACsQW6mb0xWU
 aq3MMTbZE5K0iIBTGXC5wzsdaIQAsD0_HqObTBuvudznYvCRZErNDY5Nx0fyp
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ne1.yahoo.com with HTTP; Fri, 20 Nov 2020 20:15:21 +0000
Received: by smtp420.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID 102d5b72bd38199bb2cb0644f6629cab;
          Fri, 20 Nov 2020 20:15:15 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, linux-audit@redhat.com,
        keescook@chromium.org, john.johansen@canonical.com,
        penguin-kernel@i-love.sakura.ne.jp, paul@paul-moore.com,
        sds@tycho.nsa.gov, linux-kernel@vger.kernel.org
Subject: [PATCH v22 00/23] LSM: Module stacking for AppArmor
Date:   Fri, 20 Nov 2020 12:14:44 -0800
Message-Id: <20201120201507.11993-1-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20201120201507.11993-1-casey.ref@schaufler-ca.com>
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

This patchset provides the changes required for
the AppArmor security module to stack safely with any other.

v23: Rebase to 5.10-rc4
     Incorporate feedback from v22
     - Change /proc/*/attr/display to /proc/*/attr/interface_lsm to
       make the purpose clearer. (patch 0012)
     - Include ABI documentation. (patch 0012, 0022)
     - Introduce LSM documentation updates with the patches where
       the interfaces are added rather than at the end. (patch 0012, 0022)
     Include more maintainers and mail lists in To: and Cc: directives.
v22: Rebase to 5.10-rc1
v21: Rebase to 5.9-rc4
     Incorporate feedback from v20
     - Further revert UDS SO_PEERSEC to use scaffolding around
       the interfaces that use lsmblobs and store only a single
       secid. The possibility of multiple security modules
       requiring data here is still a future problem.
     - Incorporate Richard Guy Briggs' non-syscall auxiliary
       records patch (patch 0019-0021) in place of my "supplimental"
       records implementation. [I'm not sure I've given proper
       attestation. I will correct as appropriate]
v20: Rebase to 5.9-rc1
     Change the BPF security module to use the lsmblob data. (patch 0002)
     Repair length logic in subject label processing (patch 0015)
     Handle -EINVAL from the empty BPF setprocattr hook (patch 0020)
     Correct length processing in append_ctx() (patch 0022)
v19: Rebase to 5.8-rc6
     Incorporate feedback from v18
     - Revert UDS SO_PEERSEC implementation to use lsmblobs
       directly, rather than allocating as needed. The correct
       treatment of out-of-memory conditions in the later case
       is difficult to define. (patch 0005)
     - Use a size_t in append_ctx() (patch 0021)
     - Fix a memory leak when creating compound contexts. (patch 0021)
     Fix build error when CONFIG_SECURITY isn't set (patch 0013)
     Fix build error when CONFIG_SECURITY isn't set (patch 0020)
     Fix build error when CONFIG_SECURITY isn't set (patch 0021)

v18: Rebase to 5.8-rc3
     Incorporate feedback from v17
     - Null pointer checking in UDS (patch 0005)
     Match changes in IMA code (patch 0012)
     Fix the behavior of LSM context supplimental audit
     records so that there's always exactly one when it's
     appropriate for there to be one. This is a substantial
     change that requires extention of the audit_context beyond
     syscall events. (patch 0020)

v17: Rebase to 5.7-rc4

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

Patches 0002-0011 replace system use of a "secid" with
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

Patch 0012 provides a mechanism for a process to
identify which security module's hooks should be used
when displaying or converting a security context string.
A new interface /proc/self/attr/interface_lsm contains the name
of the security module to show. Reading from this file
will present the name of the module, while writing to
it will set the value. Only names of active security
modules are accepted. Internally, the name is translated
to the appropriate "slot" number for the module which
is then stored in the task security blob. Setting the
display requires that all modules using the /proc interfaces
allow the transition. The interface LSM of other processess
can be neither read nor written. All suggested cases
for reading the interface LSM of a different process have race
conditions.

Patch 0013 Starts the process of changing how a security
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

Patches 0014-0016 convert the security interfaces from
(string,len) pointer pairs to a lsmcontext pointer.
The slot number identifying the creating module is
added by the infrastructure. Where the security context
is stored for extended periods the data type is changed.

The Netlabel code is converted to save lsmblob structures
instead of secids in Patch 0017. This is not strictly
necessary as there can only be one security module that
uses Netlabel at this point. Using a lsmblob is much
cleaner, as the interfaces that use the data have all
been converted.

Patch 0018 adds checks to the binder hooks which verify
that both ends of a transaction use the same interface LSM.

Patches 0019-0021 add addition audit records for subject
and object LSM data when there are multiple security modules
with such data. The AUDIT_MAC_TASK_CONTEXTS record is
used in conjuction with a "subj=?" field to identify the
subject data. The AUDIT_MAC_OBJ_CONTEXTS record is used in
conjuction with a "obj=?" field to identify the object data.
The AUDIT_MAC_TASK_CONTEXTS record identifies the security
module with the data: "subj_selinux=xyz_t subj_apparmor=abc".
The AUDIT_MAC_OBJ_CONTEXTS record identifies the security
module with the data: "obj_selinux=xyz_t obj_apparmor=abc".
While AUDIT_MAC_TASK_CONTEXTS records will always contain
an entry for each possible security modules, AUDIT_MAC_OBJ_CONTEXTS
records will only contain entries for security modules for
which the object in question has data.

An example of the MAC_TASK_CONTEXTS (1420) record is:

    type=UNKNOWN[1420]
    msg=audit(1600880931.832:113)
    subj_apparmor==unconfined
    subj_smack=_

An example of the MAC_OBJ_CONTEXTS (1421) record is:

    type=UNKNOWN[1421] 
    msg=audit(1601152467.009:1050):
    obj_selinux=unconfined_u:object_r:user_home_t:s0

Patch 0022 adds a new interface for getting the
compound security contexts, /proc/self/attr/context.
An example of the content of this file is:

    selinux\0one_u:one_r:one_t:s0-s0:c0.c1023\0apparmor\0unconfined\0

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

https://github.com/cschaufler/lsm-stacking.git#stack-5.10-rc4-v23

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
