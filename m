Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA73269535
	for <lists+selinux@lfdr.de>; Mon, 14 Sep 2020 20:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgINSxc (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 14 Sep 2020 14:53:32 -0400
Received: from agnus.defensec.nl ([80.100.19.56]:45042 "EHLO agnus.defensec.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbgINSxb (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 14 Sep 2020 14:53:31 -0400
Received: from brutus (brutus.lan [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id BBDC22A0D7E
        for <selinux@vger.kernel.org>; Mon, 14 Sep 2020 20:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl BBDC22A0D7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1600109608;
        bh=rb171IFkw/ryGVLd0FTPA1jTSr5owPcIN7pYP3m+Hc4=;
        h=From:To:Subject:Date:From;
        b=iKL/HccSHHnxyLDCoHWzm2vwDnXwzD/J4G32EyRF8puDcSpkpdFrP53ZXALF8fvTN
         WOzjGoxVTrNC4Vw0NajllImzBAESmB0VU5PJkn0Y9EUjKdaVNfVYD7juIF38z4cci6
         EvZYSb1BstHyBlfw3X+FWuCF9KeT+i9DpE6BHdDc=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     selinux@vger.kernel.org
Subject: secilc compiles invalid policy
Date:   Mon, 14 Sep 2020 20:53:24 +0200
Message-ID: <ypjlv9ggi40r.fsf@defensec.nl>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


Reproducer:

git clone git://git.defensec.nl/dssp-openwrt
cd dssp-openwrt
# verify that it builds properly
make
# now break it
echo '(blockinherit .file.auth.obj_base_template)(filecon "/test" file authfile_file_context)' > mod/test.cil
make

# built succeeds but resulting policy is invalid
setfiles -c policy.32 file_contexts
libsepol.context_from_record: type file.auth.obj_base_template.authfile is not defined
libsepol.context_from_record: could not create context structure
libsepol.context_from_string: could not create context structure
libsepol.sepol_context_to_sid: could not convert
u:r:file.auth.obj_base_template.authfile to sid
invalid context u:r:file.auth.obj_base_template.authfile
make: *** [Makefile:22: check.32] Error 255

-- 
gpg --locate-keys dominick.grift@defensec.nl
Key fingerprint = FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
https://sks-keyservers.net/pks/lookup?op=get&search=0xDA7E521F10F64098
Dominick Grift
