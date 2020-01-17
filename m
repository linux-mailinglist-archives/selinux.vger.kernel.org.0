Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 601101410B7
	for <lists+selinux@lfdr.de>; Fri, 17 Jan 2020 19:24:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgAQSYI (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 17 Jan 2020 13:24:08 -0500
Received: from dgrift.xs4all.space ([80.100.19.56]:59626 "EHLO
        agnus.defensec.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726970AbgAQSYI (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 17 Jan 2020 13:24:08 -0500
Received: from brutus.lan (brutus.lan [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id 2D7411320022
        for <selinux@vger.kernel.org>; Fri, 17 Jan 2020 19:24:06 +0100 (CET)
Date:   Fri, 17 Jan 2020 19:24:05 +0100
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     selinux@vger.kernel.org
Subject: Re: any reason why a class mapping is not able to solve permissionx?
Message-ID: <20200117182405.GA182181@brutus.lan>
References: <20200117173448.GA166208@brutus.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200117173448.GA166208@brutus.lan>
User-Agent: Every email client sucks, this one just sucks less.
X-PGP-Key: https://sks-keyservers.net/pks/lookup?op=get&search=0x3B6C5F1D2C7B6B02
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Jan 17, 2020 at 06:34:48PM +0100, Dominick Grift wrote:
> For example this:
> 
> (permissionx alg_socket_ioctl_except_SIOCGIFHWADDR (ioctl alg_socket (and (all) (not (0x8927)))))
> (classmap all_sockets (ioctl_except_SIOCGIFHWADDR))
> (classmapping all_sockets ioctl_except_SIOCGIFHWADDR alg_socket_ioctl_except_SIOCGIFHWADDR)
> 
> (allowx a self (all_sockets (ioctl_except_SIOCGIFHWADDR))) 
> 
> Say's:
> 
> <snip>
> Building AST from Parse Tree
> Destroying Parse Tree
> Resolving AST
> Failed to resolve classmapping statement at policy/base/class_maps.cil:994
> Problem at policy/base/class_maps.cil:994
> Pass 14 of resolution failed
> Failed to resolve ast
> Failed to compile cildb: -2
> make: *** [Makefile:30: policy.32] Error 254
> 
> Am i doing something wrong or is this unsupported?

Are we supposed to be able to use allowx rules in macros?

This works when the tunable is set false:

(tunable no_mac_addr true)

(block bla1
        (blockinherit system_agent_template)

        (macro stuff ((type ARG1))
                (tunableif no_mac_addr
                  (true
                      (allow ARG1 self create_except_ioctl_tcp_stream_socket_perms)
                      (allowx ARG1 self tcp_socket_ioctl_except_SIOCGIFHWADDR))
                  (false
                      (allow ARG1 self create_tcp_stream_socket_perms)))))

(block blah2
        (blockinherit system_agent_template)

        (call bla1.stuff (subj)))

But when the tunable is set true:
<snip>
Building AST from Parse Tree
Destroying Parse Tree
Resolving AST
make: *** [Makefile:30: policy.32] Segmentation fault (core dumped)

-- 
Key fingerprint = 5F4D 3CDB D3F8 3652 FBD8 02D5 3B6C 5F1D 2C7B 6B02
https://sks-keyservers.net/pks/lookup?op=get&search=0x3B6C5F1D2C7B6B02
Dominick Grift
