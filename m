Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C12B7249BF
	for <lists+selinux@lfdr.de>; Tue,  6 Jun 2023 19:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233272AbjFFRGC (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 6 Jun 2023 13:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238422AbjFFRF4 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 6 Jun 2023 13:05:56 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6488510CB
        for <selinux@vger.kernel.org>; Tue,  6 Jun 2023 10:05:55 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-51452556acdso3717315a12.2
        for <selinux@vger.kernel.org>; Tue, 06 Jun 2023 10:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686071155; x=1688663155;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NFP9xq0nwGuiDFPEwUo+ZoPchSWncRXq8AFy5TZsENc=;
        b=oJ0RdgZGD/rLdFrrD6ozGsVxfEZJKkOpji9b8FQ8/lJHwv7mb6CGV2j7cFtVOlBfZf
         DCsoN9gJ4rC4dXD6N5FqHvxSCGXzNW7HIXj+7KqJyK22ipfpSRznfu924ATdNV9nStLj
         539Wb7rYLIgiOR9puOTzbnCqFkfEtMZTNNI2N/Pq6zWyoCb889YEB+XEWSA5M4aNQdbN
         5V9saWqiXUHmisuNy03aZkON0ey7pDyInDTQC9n1syauCckgO+4aGmt71eT9sz8F0b40
         GxRLiwaUIgKgHlG2qMQR+lpLSHxnRLsPRSWbkF6G3a1wJ9R3ChlWpkR6VBM9LrL0cS/U
         XGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686071155; x=1688663155;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NFP9xq0nwGuiDFPEwUo+ZoPchSWncRXq8AFy5TZsENc=;
        b=j9LsmahxkVuPLwjxq/Rd3uUv/NSkfL17jee0zOdbWjTqahcswu2iio6zlzH9eOUStY
         T9xpUc7HxE3cbU0wJJrJg1IJZktIIsgpKfN2iOlssqtn4sFvxL6oI0ui3MLNyuzAQm6h
         bb58FTazY5DuXqS7d6SqkYrj5yHKO3uwxf8cScW2iZp2V3ZZ1HKC1ZGHP7xXlkepmWqj
         Cnz0/ZrhhM7tmyhZ/gXhoI916e0TcrFyH05cVGIt7KDu9/DVuf2I/HeCKz0t4DJQPxOU
         VnzMvv+zls7714a31Bf6gs1jF7ov/Q4O2MGKoLQfqmZP4oIbxaMfxPLxqZTYNUb7Yh9u
         2ETA==
X-Gm-Message-State: AC+VfDziHPUyZPOe2FBybkIZ1JsEd80iVnvsueaa44dYio2dkGdBl/lg
        jF2iy5AN7YpG8Us7sPWbln764wV6rQ7HGeJj3mpA4XQu
X-Google-Smtp-Source: ACHHUZ4UPVhTax7WvqrFqL4EOl7MDlnDuwTDYte+K12KTDJIfZdBHvT/WrzwBmcBpoEWMxQCl0H/fhL+JTZ/RMVM8GM=
X-Received: by 2002:a17:90b:68c:b0:259:3cc4:f978 with SMTP id
 m12-20020a17090b068c00b002593cc4f978mr1727091pjz.19.1686071154385; Tue, 06
 Jun 2023 10:05:54 -0700 (PDT)
MIME-Version: 1.0
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Tue, 6 Jun 2023 13:05:43 -0400
Message-ID: <CAEjxPJ7P5XQUx4-ENXt4WGGhnegxKmDD0V-4Ffab6AY8PL-O2A@mail.gmail.com>
Subject: multiple inconsistent perm_map files
To:     SElinux list <selinux@vger.kernel.org>,
        Chris PeBenito <pebenito@ieee.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hi,

There appear to be two separate copies of the permission mapping
(perm_map) file, one in selinux/python/sepolgen/src/share/perm_map and
one in setools/setools/perm_map. The first one in selinux hasn't been
updated since 2016 (just a move) or 2011 (last actual content change).
The second one in setools has been getting regular updates but the
seinfoflow man page refers to the location where the first one from
selinux is installed.

Also guessing that no one has written a perm_map for Android userspace
classes/permissions.
