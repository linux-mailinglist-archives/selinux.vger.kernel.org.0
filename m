Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D40BD15616B
	for <lists+selinux@lfdr.de>; Sat,  8 Feb 2020 00:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbgBGXAi (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 7 Feb 2020 18:00:38 -0500
Received: from mail-pg1-f202.google.com ([209.85.215.202]:46561 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbgBGXAh (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 7 Feb 2020 18:00:37 -0500
Received: by mail-pg1-f202.google.com with SMTP id f5so578270pgn.13
        for <selinux@vger.kernel.org>; Fri, 07 Feb 2020 15:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=KEbFL9krah7Y9ABRO9yA/KuTa4sTbMYFsDBrpDX0bjE=;
        b=s+tP004S6F6gkM0ebhBGzoTOVWW8IsJnS9JSY1066vDVX4bJgFPX20qBQrkVKTXIQV
         Vrbcf2P+IU4nB5GxZjAmoYy0BOKwUkuGhD7d9Xi3gobVtR7SIUv1bu1W4i6BUW6on+Yu
         ExuR5MfcZwvzvj6LRajRqsG31I1beVt7kHIBkgShSjfTVbaCRMdsxwP0AQ3P+11ve5Pg
         3XIf+VJOsyljJh9g2A2TiXCpV1iGZcNcGuN98PanXNsow1dlboHH2v+C5QhQSZgZNHwY
         MjbMpumd3yXDa/RPAv0x9rGtBxGJWSYoLuMxawGyp6zM7NEX9aHfDUBxrrU+73n+lu4u
         dRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=KEbFL9krah7Y9ABRO9yA/KuTa4sTbMYFsDBrpDX0bjE=;
        b=G8efvHjHoFcKmQIHz73qtNHfFlxS1pxKI6w3yoLGClk/Mluc/UozaDQhOh10iMH8dM
         MRxKpsDXCTrNhVzAXqbHrYdrbWMhXtIeXMYW0cTWMwdhA0Czz/TgBLSJx2csj6qXPdrM
         2yCByn8p/9VXTPXMIg0i8D+DSeDcLK/jHeQES1CUSVYkjWLVm87hN6KzzMP0UASGH/81
         jEqJIVKZJzh9WMCGfnuxKOUG7WCKmOi549St6tzXAaLREgP9FQi3cnun9G66Ge5o5A2I
         s6p6f2Pmys2UsBz4n/sW18p4HcTseCLy8VuYI2/6Qfpjd6aQsAwwKD6Wuezj6F1COqTO
         Z5uQ==
X-Gm-Message-State: APjAAAXj19E65W58uGEAq9fqblkCsXGuP9hW2yXAMdiypxCjOm+UFa+9
        inziLiM95vJejAwPFO9Vp0nlE185OA12h9CwYNnE9Kpx7ADXe3hc7zM6/xwgLBsKTJnSBXucEUo
        2rv3XZVEd1tbdp0+9qrNnIhJ+BjZdDW8Y6kLnQ2n31HDDeM2W3PrJNbc=
X-Google-Smtp-Source: APXvYqwNpIfx+/QpU6lwenB/nLFULdjc3HjDqUONY8vZAyEMWDjZYyntvYypXm2TJYInkTze5cR9sD0=
X-Received: by 2002:a65:68ce:: with SMTP id k14mr1459804pgt.336.1581116435473;
 Fri, 07 Feb 2020 15:00:35 -0800 (PST)
Date:   Fri,  7 Feb 2020 15:00:32 -0800
Message-Id: <20200207230032.210843-1-nnk@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
Subject: [PATCH] label_file.c: Fix MAC build
From:   Nick Kralevich <nnk@google.com>
To:     selinux@vger.kernel.org
Cc:     Nick Kralevich <nnk@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Android, the label_file.c file is compiled for all platforms,
including OSX. OSX has a slightly different prototype for the
getxattr function.

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options);

which causes a compile error when compiling libselinux on OSX.

  ```
  external/selinux/libselinux/src/label_file.c:1038:37: error: too few arguments to function call, expected 6, have 4
                                       read_digest, SHA1_HASH_SIZE);
                                                                ^
  /Applications/Xcode9.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk/usr/include/sys/xattr.h:61:1: note: 'getxattr' declared here
  ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options);
  ^
  1 error generated.
  ```

On OSX builds, add the additional arguments so that the code compiles.

As both SELinux labels and the restorecon partial digest are stored in
extended attributes, it's theoretically possible that someone
could assign SELinux labels and hash digests on OSX filesystems.
Doing so would be extremely weird and completely untested, but
theoretically possible.

Signed-off-by: Nick Kralevich <nnk@google.com>
---
 libselinux/src/label_file.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/libselinux/src/label_file.c b/libselinux/src/label_file.c
index 300625c2..f2aaf3ba 100644
--- a/libselinux/src/label_file.c
+++ b/libselinux/src/label_file.c
@@ -985,7 +985,11 @@ static bool get_digests_all_partial_matches(struct selabel_handle *rec,
 {
 	uint8_t read_digest[SHA1_HASH_SIZE];
 	ssize_t read_size = getxattr(pathname, RESTORECON_PARTIAL_MATCH_DIGEST,
-				     read_digest, SHA1_HASH_SIZE);
+				     read_digest, SHA1_HASH_SIZE
+#ifdef __APPLE__
+				     , 0, 0
+#endif /* __APPLE __ */
+				    );
 	uint8_t hash_digest[SHA1_HASH_SIZE];
 	bool status = selabel_hash_all_partial_matches(rec, pathname,
 						       hash_digest);
-- 
2.25.0.225.g125e21ebc7-goog

