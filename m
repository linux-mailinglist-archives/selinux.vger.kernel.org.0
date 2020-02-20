Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C640D166135
	for <lists+selinux@lfdr.de>; Thu, 20 Feb 2020 16:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgBTPoN (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 20 Feb 2020 10:44:13 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:54478 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728305AbgBTPoM (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 20 Feb 2020 10:44:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=jEHfBLX4PlxWx/IwzJG9P/DrN5rBsfx6J9yEeBiC2ak=; b=iB9RAeM1mu4RlsGt8RuwT6v360
        q17+mCb/f9RySyzi/55UV3BpPiMBHsiH2vNAE+3+f/KDZ1NzsolNmiiBoBfzGDT40dpFG+9/1mWEA
        GZEsgwG26Z6xrFB4ocn8U90Nvsd0Vd1GPXsAAYs3FYKnAiXcYlsbjTKdJd0TooanRP03BbqlrY4gT
        gsb6UG36OdBKLqaDS6GtqAR9356Tnkk0eXihMjsIlbMQBzwbyQWEmiM9ep4EdPM0oNrASBZRkR0lX
        HJz2GlFldOZxSSlAb6hCDhMUpfUdq0YR9VWr78ZcjMZ80yygilBdGeqggdjvbSfTKY8KZy4b6u7z1
        H+Sye1Ag==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j4nzh-0003Ka-Hp; Thu, 20 Feb 2020 15:44:05 +0000
Date:   Thu, 20 Feb 2020 07:44:05 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Richard Haines <richard_c_haines@btinternet.com>
Cc:     darrick.wong@oracle.com, sds@tycho.nsa.gov, paul@paul-moore.com,
        linux-xfs@vger.kernel.org, selinux@vger.kernel.org
Subject: Re: [PATCH 1/1] selinux: Add xfs quota command types
Message-ID: <20200220154405.GA12757@infradead.org>
References: <20200220153234.152426-1-richard_c_haines@btinternet.com>
 <20200220153234.152426-2-richard_c_haines@btinternet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200220153234.152426-2-richard_c_haines@btinternet.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Feb 20, 2020 at 03:32:34PM +0000, Richard Haines wrote:
> Add Q_XQUOTAOFF, Q_XQUOTAON and Q_XSETQLIM to trigger filesystem quotamod
> permission check.
> 
> Add Q_XGETQUOTA, Q_XGETQSTAT, Q_XGETQSTATV and Q_XGETNEXTQUOTA to trigger
> filesystem quotaget permission check.
> 
> Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
