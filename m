Return-Path: <selinux+bounces-547-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE08D84D8CA
	for <lists+selinux@lfdr.de>; Thu,  8 Feb 2024 04:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0963C1C23295
	for <lists+selinux@lfdr.de>; Thu,  8 Feb 2024 03:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A13036AE3;
	Thu,  8 Feb 2024 03:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="fEzUhsqx"
X-Original-To: selinux@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A526374C2
	for <selinux@vger.kernel.org>; Thu,  8 Feb 2024 03:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707362336; cv=none; b=cxzXoI5dKgvrc7dyjdw7pVe9mDhozJnIOUw7uXrNVzuje6X57qWohMIdmg3CBE5kRvPATO5SNLEu0OsLpH2t/cfHyzG9lTYfjhB4Nw4inkib8lK+zMgqHEWem30WEBUiXU4Rdio7ZB7U5Glbs2vWzsuh1lUk9dY1ZSTa6J4G4Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707362336; c=relaxed/simple;
	bh=jiSHgvUoEvn0NaGRHdFdTLX/0GL5XVoEY8AT/sqk0uc=;
	h=Date:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 From:To:Cc:Subject:References:In-Reply-To; b=k0REwZ9QsyZRP83qSssbfhJ/P/g9BpZNwbGt26NKmpNJ1cMpWod7M74FgZREmgCT7euIKV3BBxLTMoALUwVqj43ZiisJlc5ge4b33p0l+m7pJVDCYJ56uYFGoPAavTJjoutG3zOu8G+erjGAucVbof8ZTJ9tGAUbpkpLNQXz4qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=fEzUhsqx; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-604a05e26c3so6428807b3.3
        for <selinux@vger.kernel.org>; Wed, 07 Feb 2024 19:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1707362330; x=1707967130; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RSNC61VvebetqsibHsKH2sGD4hIgKVgj6eBAt9xotC0=;
        b=fEzUhsqxbcTui/0gRmbhWiK/zIQ0yqlMX+Ltpz0Yu9Gt4gf8Jg8LrT/h9Ezai6qo42
         OGmZYLo6GbXe0T6iD1/0+wkRjSQKW629ELKT5OBNtZmBUGqINATqEL75jnI8TywDRJG/
         ZoTYvlj4OJLO8+oqXB6cKgIIYG4oeTPWeQI7UWyjJCDXljmJFjRFfnrOZ+ABDIezgQO5
         +nRpL2BBJlWvFqEJ9UBhtgINCPxmlYROgQAdIXRgUQWs7KxM+64smhkAiFaWUB6mSeKC
         X3Z+5rJamvSHWcQv6kAKSha9179/6LXp1XTh3gTppp1gdrRA53l9aSFT6iQ3JLAUgfgi
         aoqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707362330; x=1707967130;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RSNC61VvebetqsibHsKH2sGD4hIgKVgj6eBAt9xotC0=;
        b=EDrwaD1LpckSOOR8Zwqgvqp1nbMzqb8eQnfo9EyOCJ9orVmka5eaG0/pxFgj80g+ge
         svLG7l6kaxz8XsQ/U2p1ewSv0KrFfXKMKf7No7PVVVUO8UoCDI40+L8PIJw4ZTRPkBTI
         fJ65/BkA+AaAgxmOe30OaKXCPFc7YpKmexsAXq/qALHZ4PGHEgmThmJjW1EYasnECOYd
         MY85a4DSRWjy0Z2qoCjAtRMUQaeh6I2wDqH/cvx3wK6WLM38Fapis9ckIV2+cYgIZlI8
         J+G017p6FmizYf5/x+jzmSSk5IizNDZxk6uS2OlhcvKM/2A7+26sFYRkrTMgkC8rsl5z
         OGvQ==
X-Gm-Message-State: AOJu0YzjvKmBxq2GVBqp/m1bwjMnFXIj/6fTPlgcMeIRCAW+94PulXYV
	Im9320ytO9LRZmV9dJITQKicJtiyciwdkqyQ3T9FPFFKOgm9K+6rH3y+g/vnxQ==
X-Google-Smtp-Source: AGHT+IFVUCM2L23EXMSlmPwkLzABJwpnz6XIVsso3c//vGlSKQzv2J7kobfawtYC/fRxtQXOROvXSg==
X-Received: by 2002:a81:b389:0:b0:603:fdaf:75bc with SMTP id r131-20020a81b389000000b00603fdaf75bcmr6911865ywh.35.1707362330410;
        Wed, 07 Feb 2024 19:18:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQpiDyUF5doWhXPrESvB2IiwwSVc2ZlFe2Pz9l0V3aDs8qdFVrgJN2bNSpwU2HmAmQ6eZZDz2JcVcErT6Ws49K806zxNWURjhW5wV+8aZdThsYdDuAN2Z/xRxscgKIqytknjOL7oPmazwOGODt3XRZJ7ht/L/ggbVaWwScpQXRJ5mB/vvhRBLoPTqvTyfJSpuGbJ0FoVH94u0nnA/MzXE3q7NVD3xW3y7/xccHc8uWvBEzK826miQDvD4Ww3ZkaMBU4e3/fXIwzTWx6/m2d6lLxKqvn8h9xo3W6jbZG3kltAeBOh3EQmaov5wGx54dnWRfKAnR/i7f6+2HJka34SM0IYweE1R8OqM82dudngEGM40xK8wbTYDWHkdeUK1pHk61g2jgVtlc/Uh8+HcWAnC9bPoFNeTq0VWZ7LUeCNzJuNhzO18sdmmKQjW7Biu+5T0YAffngHAxcOd/ciKOwfjwh5KgrYnyWLpf0kO8Vu6o+ICX24X7bagsRPGaJloHGpuO4XnhiQ9p2s6kM9MhWggh//tpK9vrsR8jPykgAt9zF0peJnkImGr9IfAOtM5tRdBfmXYFd/I8hohbbe4iUbKEOXYyU6peepiMkPvCyg55ePojz9yBaNnRejdFY6mOcNR6Cf03OsHslfF/QjREuE01MO+KC6gwCeyMMEwUd4wyhSrre04J+/Ot/zDduKujb1gMJt5HZGHbBtP3lQOHeQt9XXSKqeYzWjiANJUHzTBgW3Xkk4u2j/aoIUYBY+EmbDkswk5vB0h5+Qp5dH9047Ir968XZ/fkcm+SZlmPXsBMLIHi/dGxnHe8RNNWiJHsgRB7/XOLGLa2EUGAe4tDz3H8QNpLcdoD+zYNayJFgIXjxzzWcKVNiVivX9DFNth7JhRLoiWxb3qkE7kDG8I0rRn2z99A7fjo5E1s/h96or63AoKQK3kIGriE/co7Yt6gM5Ovl7
 QkEItQfGXER3k=
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id d16-20020ac85450000000b0042a86e06fdfsm1070436qtq.37.2024.02.07.19.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 19:18:49 -0800 (PST)
Date: Wed, 07 Feb 2024 22:18:49 -0500
Message-ID: <33b05b3789c1c8f05beaeb02c093a77c@paul-moore.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=utf-8 
Content-Disposition: inline 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, viro@zeniv.linux.org.uk, brauner@kernel.org, chuck.lever@oracle.com, jlayton@kernel.org, neilb@suse.de, kolga@netapp.com, Dai.Ngo@oracle.com, tom@talpey.com, jmorris@namei.org, serge@hallyn.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, dhowells@redhat.com, jarkko@kernel.org, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, shuah@kernel.org, mic@digikod.net
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>, Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v9 18/25] security: Introduce key_post_create_or_update  hook
References: <20240115181809.885385-19-roberto.sassu@huaweicloud.com>
In-Reply-To: <20240115181809.885385-19-roberto.sassu@huaweicloud.com>

On Jan 15, 2024 Roberto Sassu <roberto.sassu@huaweicloud.com> wrote:
> 
> In preparation for moving IMA and EVM to the LSM infrastructure, introduce
> the key_post_create_or_update hook.
> 
> Depending on policy, IMA measures the key content after creation or update,
> so that remote verifiers are aware of the operation.
> 
> Other LSMs could similarly take some action after successful key creation
> or update.
> 
> The new hook cannot return an error and cannot cause the operation to be
> reverted.
> 
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Acked-by: Casey Schaufler <casey@schaufler-ca.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> ---
>  include/linux/lsm_hook_defs.h |  3 +++
>  include/linux/security.h      | 11 +++++++++++
>  security/keys/key.c           |  7 ++++++-
>  security/security.c           | 19 +++++++++++++++++++
>  4 files changed, 39 insertions(+), 1 deletion(-)

Acked-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com

