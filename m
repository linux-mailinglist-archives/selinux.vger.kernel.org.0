Return-Path: <selinux+bounces-1216-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EECCD9029C5
	for <lists+selinux@lfdr.de>; Mon, 10 Jun 2024 22:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24728B21AC6
	for <lists+selinux@lfdr.de>; Mon, 10 Jun 2024 20:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FC314F9E7;
	Mon, 10 Jun 2024 20:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.b="LYwY4ug2"
X-Original-To: selinux@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AB21B812
	for <selinux@vger.kernel.org>; Mon, 10 Jun 2024 20:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718050350; cv=none; b=HXnIG69fragqVEcqKbFrMd4pgz7wniT8gFB3ezzBiaVlM4B7HohJiZathgDhoG4E1xN4iS30NMLWIECSsLVUVIQU/akBvKZuMXMPLgjpY7BN5qHb3l7pO64TTb54tPIRYBbLUC5YrF5hoi125SvyMhAKAlQ57rAmKLfMVCXh+gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718050350; c=relaxed/simple;
	bh=b7+MwoWNMLPQ7YyhI/4+4s4P3K4STGUIbLhPZG0Mamc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1Ksp9aMobKGY5Nomh1ky6KiPYtSN150cpkubwM9YSQ/S0WiBGXOgi/DnELIcnwBBHtJqxZoHjJvujWFsQNDElFdhHe6QHBmqC+gi/3N28ErHv2shcjFCzAkGXG2gcRrFXC1yK+TNaQ+r7Wh4NAMG9NJ5DNsyuHlle92QUxaULY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=none smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.b=LYwY4ug2; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toxicpanda.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-62a087c3a92so48860387b3.2
        for <selinux@vger.kernel.org>; Mon, 10 Jun 2024 13:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1718050348; x=1718655148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q8U88OhWZh1tCo+0WQ1tID8xLxoIwnJftDZHFtRwK3o=;
        b=LYwY4ug2iL/vJ4DIUm0/Hp2MvpGURHFsHfCR8hKgvsmAqgzRPxBeFZzp5Tfo48EbCo
         Euj3YFKE98R3xDK+TVi4X08MQrChZxoR0ZdwAIKYcBEyuT6J6pRA6MFIWpmGlK1QH6yk
         ayaE24UINt0NKI07iU6nbvvP+ur4CK0DddjWE0Gtpl8JlrD2yRSechl/xjLYVx0XPb6G
         i76retKit/NIZmraE8AuogV1B4ponmQt72v7gY3tzehh7ckEOuDJ8LHGOKzXVFo5n2E+
         4LMkjHweMxF1v6LeN1NaZpvEMI8QBe5KxGttDTh645mywME2cc7oJs1j5M/rPYABPg7M
         UNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718050348; x=1718655148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8U88OhWZh1tCo+0WQ1tID8xLxoIwnJftDZHFtRwK3o=;
        b=RQ4OrjTB3pdfHj28FkFD3qUszWsgyN4HQGGkJX84NZOLlUyQRN1W9GLyPRkCQDMmj2
         rKh5nICsanYDKmsWJaYH9jUO1uhgZMKf7v6XpQ2JLxPL5OE0hGTyoLQnCyQlvtcHmag4
         9w0s7ERLjTYeCbA9lzOqWtEQpIIyZa930RbGUGOhBzqVIK6GHH9tUE3u0f6GxS7mBeAM
         ZrGi+NpEfzd1Qfkq1LRusr5JNt4Vpss+77l8282AvAwHDSeGp503fYuoe+zuTEfVBJbn
         PO+VMlV5V1P1QbvBlJPkeTmsqkkWO9KVc+8zKBwLRoP9mAZHOSnGvEvEwG79JSJMFTtH
         2HNA==
X-Forwarded-Encrypted: i=1; AJvYcCX1Bf5/2eoiUpGay1e5HKQWV45vQUvotftZ7QKSzFBganynET9HSgl0milXVtWLkXoLj5TYsJn2mV8wvB4GWcWda6xh3B27og==
X-Gm-Message-State: AOJu0YwnWpuBBDwJaxRMepd4d60BLoy3rmqT4xjUp/XOsG0yn8V+y4c2
	ovaiiJmnIByt56e02itMnB/FNjAmYgLfQxpoW/EDK6HUhQTjhnSUZuJQJ3rQ+Hc=
X-Google-Smtp-Source: AGHT+IHAq2uat/BxStlvycvWIMemf9chq6bKvr5RgwVh7JekY7oKEJ33MFsCJYBOa4s18l+17nIrDA==
X-Received: by 2002:a81:ef0e:0:b0:61a:f206:bad6 with SMTP id 00721157ae682-62cd55f6755mr90104707b3.30.1718050348318;
        Mon, 10 Jun 2024 13:12:28 -0700 (PDT)
Received: from localhost (syn-076-182-020-124.res.spectrum.com. [76.182.20.124])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62ccaef2825sm17372997b3.139.2024.06.10.13.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 13:12:27 -0700 (PDT)
Date: Mon, 10 Jun 2024 16:12:27 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Jonathan Calmels <jcalmels@3xx0.net>
Cc: brauner@kernel.org, ebiederm@xmission.com,
	Jonathan Corbet <corbet@lwn.net>, Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, KP Singh <kpsingh@kernel.org>,
	Matt Bobrowski <mattbobrowski@google.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>, Joel Granados <j.granados@samsung.com>,
	John Johansen <john.johansen@canonical.com>,
	David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	containers@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	apparmor@lists.ubuntu.com, keyrings@vger.kernel.org,
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Introduce user namespace capabilities
Message-ID: <20240610201227.GD235772@perftesting>
References: <20240609104355.442002-1-jcalmels@3xx0.net>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240609104355.442002-1-jcalmels@3xx0.net>

On Sun, Jun 09, 2024 at 03:43:33AM -0700, Jonathan Calmels wrote:
> This patch series introduces a new user namespace capability set, as
> well as some plumbing around it (i.e. sysctl, secbit, lsm support).
> 
> First patch goes over the motivations for this as well as prior art.
> 
> In summary, while user namespaces are a great success today in that they
> avoid running a lot of code as root, they also expand the attack surface
> of the kernel substantially which is often abused by attackers. 
> Methods exist to limit the creation of such namespaces [1], however,
> application developers often need to assume that user namespaces are
> available for various tasks such as sandboxing. Thus, instead of
> restricting the creation of user namespaces, we offer ways for userspace
> to limit the capabilities granted to them.
> 
> Why a new capability set and not something specific to the userns (e.g.
> ioctl_ns)?
> 
>     1. We can't really expect userspace to patch every single callsite
>     and opt-in this new security mechanism. 
> 
>     2. We don't necessarily want policies enforced at said callsites.
>     For example a service like systemd-machined or a PAM session need to
>     be able to place restrictions on any namespace spawned under it.
> 
>     3. We would need to come up with inheritance rules, querying
>     capabilities, etc. At this point we're just reinventing capability
>     sets.
> 
>     4. We can easily define interactions between capability sets, thus
>     helping with adoption (patch 2 is an example of this)
> 
> Some examples of how this could be leveraged in userspace:
> 
>     - Prevent user from getting CAP_NET_ADMIN in user namespaces under SSH:
>         echo "auth optional pam_cap.so" >> /etc/pam.d/sshd
>         echo "!cap_net_admin $USER"     >> /etc/security/capability.conf
>         capsh --secbits=$((1 << 8)) -- -c /usr/sbin/sshd
> 
>     - Prevent containers from ever getting CAP_DAC_OVERRIDE:
>         systemd-run -p CapabilityBoundingSet=~CAP_DAC_OVERRIDE \
>                     -p SecureBits=userns-strict-caps \
>                     /usr/bin/dockerd
>         systemd-run -p UserNSCapabilities=~CAP_DAC_OVERRIDE \
>                     /usr/bin/incusd
> 
>     - Kernel could be vulnerable to CAP_SYS_RAWIO exploits, prevent it:
>         sysctl -w cap_bound_userns_mask=0x1fffffdffff
> 
>     - Drop CAP_SYS_ADMIN for this shell and all the user namespaces below it:
>         bwrap --unshare-user --cap-drop CAP_SYS_ADMIN /bin/sh
> 

Where are the tests for this patchset?  I see you updated the bpf tests for the
bpf lsm bits, but there's nothing to validate this new behavior or exercise the
new ioctl you've added.  Thanks,

Josef

