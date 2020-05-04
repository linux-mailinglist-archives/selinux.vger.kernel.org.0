Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 790BA1C37B4
	for <lists+selinux@lfdr.de>; Mon,  4 May 2020 13:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgEDLIs (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 4 May 2020 07:08:48 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36059 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726445AbgEDLIr (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 4 May 2020 07:08:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588590526;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0e0mhjY2AiN4VtQuL79mgKRKZoVpQzmbAIPvf96mYaY=;
        b=HRf37+N5IQMAxv+PW8a6jeyt2bKcXdEEA9eGIrmtoIEvnU3PGVz7LpieBuQRTtf59ZsT9I
        zdCiMAJUFJjZ7BDDUnMhcY8Zuv02DMu9YpjgUUDB2ZK+hzwzIu0JOvEvlDFY7p78b/+6J6
        rKshufzcWK2mZjznDt5FB/lHIL1/vIE=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-HYaGruARM_-HATxMXi1sdw-1; Mon, 04 May 2020 07:08:45 -0400
X-MC-Unique: HYaGruARM_-HATxMXi1sdw-1
Received: by mail-ot1-f69.google.com with SMTP id x3so4740093otp.10
        for <selinux@vger.kernel.org>; Mon, 04 May 2020 04:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0e0mhjY2AiN4VtQuL79mgKRKZoVpQzmbAIPvf96mYaY=;
        b=RCqWHt0bqDJ3gtNlv4hFojRrA4qvLQGi5FdOTXco9HbZXWgP+AE/mPXuTV66FYSxeo
         ZkZ2Rm/4pbvHbPnA6DM0mjJzdjP4Aw17dRKDQUFgVUATyaz0JEycUxO85Jz/V/RdJJwM
         MXVIxl7uv+fSdTV2nWv7BiplmZc0mO+0RU4cFGFetieZRVteDiCFGUv0tcicTv7W/30U
         iYlSivZ8tQvffl1eH1vXwlAcbmdlNYXUBm1eAj854cDADFvHarzm0ASVm9kJPR1O2hM/
         osUNGfVZHvUdjgVk0nwXZSGqK4cdxsAjW9tSNdgbc982CbhGM8KN1oIXu8DavIH9dDVr
         CIpg==
X-Gm-Message-State: AGi0Pubh0kFbSvb5/b+OCpQqs+TUqbhhiVLl6TpxrLsLsBOhZntEsuKj
        pOpnnImmP9gL7JcARXKiluMSah/gVb8hMDsPAF510/SWczoOGFB9os6OQ465UCAwsTrh+No7gF+
        A/7yDN6O2gyYfj4OawYkfbpeyvvEykEKAQw==
X-Received: by 2002:a05:6830:13d4:: with SMTP id e20mr13819309otq.66.1588590524300;
        Mon, 04 May 2020 04:08:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypIz95eT6qvbNce4AuES3WtcQQa2guzQjrvvmAKF3dK04advbove0Kub354bXGPk0k6qTVrvM97+PHVGrvSF+9M=
X-Received: by 2002:a05:6830:13d4:: with SMTP id e20mr13819295otq.66.1588590524065;
 Mon, 04 May 2020 04:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAFqZXNs88P_VeYgO=9nOX1Z2vpPUVgHxTTqyk6Rj-peqhyN-bA@mail.gmail.com>
 <20200504103842.96472-1-rfilo@redhat.com>
In-Reply-To: <20200504103842.96472-1-rfilo@redhat.com>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Mon, 4 May 2020 13:08:33 +0200
Message-ID: <CAFqZXNsMAwyzKehCN2oHe7jreUGZOAysvBWXa+yC81B3Q22xVw@mail.gmail.com>
Subject: Re: [PATCH v3] libselinux: Add missing errno setup
To:     Richard Filo <rfilo@redhat.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, May 4, 2020 at 12:39 PM Richard Filo <rfilo@redhat.com> wrote:
> Errno is not set to ENOENT when lookup_all() doesn't find any match.
>
> fixes: https://src.fedoraproject.org/tests/selinux/issue/51
>
> Signed-off-by: Richard Filo <rfilo@redhat.com>
> ---
>         -removed check: result != NULL
>
>  libselinux/src/label_file.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/libselinux/src/label_file.c b/libselinux/src/label_file.c
> index 300625c2..74d2027e 100644
> --- a/libselinux/src/label_file.c
> +++ b/libselinux/src/label_file.c
> @@ -948,6 +948,8 @@ static const struct spec **lookup_all(struct selabel_handle *rec,
>                         goto finish;
>                 }
>         }
> +       if (!result[0])
> +               errno = ENOENT;
>
>  finish:
>         free(clean_key);
> --
> 2.25.2

Acked-by: Ondrej Mosnacek <omosnace@redhat.com>

Thanks!

-- 
Ondrej Mosnacek <omosnace at redhat dot com>
Software Engineer, Security Technologies
Red Hat, Inc.

