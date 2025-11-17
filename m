Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324222F656A
	for <spacemit@lists.linux.dev>; Mon, 17 Nov 2025 19:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763406242; cv=none; b=tv1nhh3TyeQEZntrf++fR24BRjRkItuCriXuNfyK6BLVIjZdIAEGJCwoua3mE4/mzlFS02o33QAFIt684i3MMf9W++Rp4T4J8h50jJLwZQW7PBsSE6lJWmsl3JbfU+jOptZkkQTONJLFbRQKXEh0u674Ky0+4WR/lLaAQdUChVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763406242; c=relaxed/simple;
	bh=OMRBt4BcOwZJEA/mt+axoCwvIBP4LXPc20txidvA3HQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hwo9esbvY9QmPoiMiWCidH3GUO1+JbsfpcztfZ1IbrOXKUQ+35sDzP9tv8+EL6pIiDnNeSmf/Lii0q+Nqz8g7JpQ7QM5W8XpTi2ZFGZMyjx8/U5qTy5uav21JNSajPtYYiNnsFx6f/hqXTrFwMjT6Qloa4JA7z3kIv+uwwgl6RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hG7dn92o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hG7dn92o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763406240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VKt60h4e/D77yoMk24RHMBXqjTCJQtx23LHDLJefZVQ=;
	b=hG7dn92oXOl9nJcn5k+SORDuR1BwI8KotEjr0+A5LacjBswOuYK7t4uw15++cnh6GAPN28
	XP61KcapJcdzl+0cB7PIg9QjqHo3dmviQ0jQKTkKOam/zmtvKqsbKrgIQYxDKAgyMl9LhK
	3TOoxGHPvIM3EbeUNasSWT5AYgHfVj0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-364-hV9jXuTwNdaMZzfCYRdSmA-1; Mon,
 17 Nov 2025 14:03:52 -0500
X-MC-Unique: hV9jXuTwNdaMZzfCYRdSmA-1
X-Mimecast-MFC-AGG-ID: hV9jXuTwNdaMZzfCYRdSmA_1763406231
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7274918AB425;
	Mon, 17 Nov 2025 19:03:49 +0000 (UTC)
Received: from cmirabil.redhat.com (unknown [10.22.65.154])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DB31D1800451;
	Mon, 17 Nov 2025 19:03:44 +0000 (UTC)
From: Charles Mirabile <cmirabil@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org,
	heylenay@4d2.org,
	elder@riscstar.com,
	troy.mitchell@linux.spacemit.com,
	inochiama@outlook.com,
	Charles Mirabile <cmirabil@redhat.com>,
	Yanko Kaneti <yaneti@declera.com>
Subject: [PATCH] clk: spacemit: fix UBSAN warning during probe
Date: Mon, 17 Nov 2025 14:03:29 -0500
Message-ID: <20251117190329.1337250-1-cmirabil@redhat.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

When booting with KASAN enabled the following splat is encountered during
probe of the k1 clock driver:

UBSAN: array-index-out-of-bounds in drivers/clk/spacemit/ccu-k1.c:1044:16
index 0 is out of range for type 'clk_hw *[*]'
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc5+ #1 PREEMPT(lazy)
Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2022.10spacemit 10/01/2022
Call Trace:
[<ffffffff8002b628>] dump_backtrace+0x28/0x38
[<ffffffff800027d2>] show_stack+0x3a/0x50
[<ffffffff800220c2>] dump_stack_lvl+0x5a/0x80
[<ffffffff80022100>] dump_stack+0x18/0x20
[<ffffffff800164b8>] ubsan_epilogue+0x10/0x48
[<ffffffff8099034e>] __ubsan_handle_out_of_bounds+0xa6/0xa8
[<ffffffff80acbfa6>] k1_ccu_probe+0x37e/0x420
[<ffffffff80b79e6e>] platform_probe+0x56/0x98
[<ffffffff80b76a7e>] really_probe+0x9e/0x350
[<ffffffff80b76db0>] __driver_probe_device+0x80/0x138
[<ffffffff80b76f52>] driver_probe_device+0x3a/0xd0
[<ffffffff80b771c4>] __driver_attach+0xac/0x1b8
[<ffffffff80b742fc>] bus_for_each_dev+0x6c/0xc8
[<ffffffff80b76296>] driver_attach+0x26/0x38
[<ffffffff80b759ae>] bus_add_driver+0x13e/0x268
[<ffffffff80b7836a>] driver_register+0x52/0x100
[<ffffffff80b79a78>] __platform_driver_register+0x28/0x38
[<ffffffff814585da>] k1_ccu_driver_init+0x22/0x38
[<ffffffff80023a8a>] do_one_initcall+0x62/0x2a0
[<ffffffff81401c60>] do_initcalls+0x170/0x1a8
[<ffffffff81401e7a>] kernel_init_freeable+0x16a/0x1e0
[<ffffffff811f7534>] kernel_init+0x2c/0x180
[<ffffffff80025f56>] ret_from_fork_kernel+0x16/0x1d8
[<ffffffff81205336>] ret_from_fork_kernel_asm+0x16/0x18
---[ end trace ]---

This is bogus and is simply a result of KASAN consulting the `.num` member
of the struct for bounds information (as it should due to `__counted_by`)
and finding 0 set by kzalloc because it has not been initialized before
the loop that fills in the array. The easy fix is to just move the line
that sets `num` to before the loop that fills the array so that KASAN has
the information it needs to accurately conclude that the access is valid.


Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Tested-by: Yanko Kaneti <yaneti@declera.com>

Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
---
 drivers/clk/spacemit/ccu-k1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index f5a9fe6ba1859..4761bc1e3b6e6 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1018,6 +1018,8 @@ static int spacemit_ccu_register(struct device *dev,
 	if (!clk_data)
 		return -ENOMEM;
 
+	clk_data->num = data->num;
+
 	for (i = 0; i < data->num; i++) {
 		struct clk_hw *hw = data->hws[i];
 		struct ccu_common *common;
@@ -1044,8 +1046,6 @@ static int spacemit_ccu_register(struct device *dev,
 		clk_data->hws[i] = hw;
 	}
 
-	clk_data->num = data->num;
-
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
 	if (ret)
 		dev_err(dev, "failed to add clock hardware provider (%d)\n", ret);

base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
-- 
2.51.1

