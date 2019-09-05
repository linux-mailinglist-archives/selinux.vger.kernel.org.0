Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A35F7A980A
	for <lists+selinux@lfdr.de>; Thu,  5 Sep 2019 03:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbfIEBe7 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 4 Sep 2019 21:34:59 -0400
Received: from namei.org ([65.99.196.166]:42602 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727156AbfIEBe7 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 4 Sep 2019 21:34:59 -0400
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id x851Ys9c030781;
        Thu, 5 Sep 2019 01:34:55 GMT
Date:   Thu, 5 Sep 2019 11:34:54 +1000 (AEST)
From:   James Morris <jmorris@namei.org>
To:     Paul Moore <paul@paul-moore.com>
cc:     linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: Re: [PATCH] lsm: remove current_security()
In-Reply-To: <156763801639.13084.2856415198922787618.stgit@chester>
Message-ID: <alpine.LRH.2.21.1909051134200.30667@namei.org>
References: <156763801639.13084.2856415198922787618.stgit@chester>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, 4 Sep 2019, Paul Moore wrote:

> There are no remaining callers and it really is unsafe in the brave
> new world of LSM stacking.
> 
> Signed-off-by: Paul Moore <paul@paul-moore.com>


Acked-by: James Morris <jamorris@linux.microsoft.com>

You might as well push this through with the SELinux changes.

-- 
James Morris
<jmorris@namei.org>

