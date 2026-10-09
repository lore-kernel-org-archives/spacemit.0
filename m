Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A083D4137
	for <spacemit@lists.linux.dev>; Fri,  9 Oct 2026 16:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563537; cv=pass; b=GPzTcp00fzoyBzoPv375WnMCvAP14r6rppto2ypTjS8i1Tt0MFH0GVR6sxzwQA4xTAo+HIyk5ObwYYJTJVfgiFQELW3IGbum9ZiVUuL//dpXYdSu7gDSDgekPYZXXFUWqk1zJxKAfAw+wVh9ljtVHYAA3nWVzloaHnMTTJYdL14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563537; c=relaxed/simple;
	bh=FYt3G7VruvoFzzwDKzghkaVtgduNeiGdqQ+h4E55MxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X2hj2UTQknYFFaupF1U5h/5W6AZ/RAAMW36DRM+iRCUbwPpoXwxuxrjse1M1NHbu6Z4EOmYkXVubiZ0POj4Wk2oDJQDjg0bFLFD1aG3Sy45VKyW/RtpGWxtiqsFg09zCIxUOKS50ff6nDYQlT64p8Ad50wR6xabzYficHOfhEKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=SOas+qn6; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="SOas+qn6"
ARC-Seal: i=1; a=rsa-sha256; t=1791563515; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WRyxLdcLg2gIuqZ7t3YuSz8lAW0WXsMc8zT7o+2qtlNGSHf1DlqfSYLh0jPpxZAvVd8Rkbc3ZERP8Lj1egEIvYFhr+jUigXyudVuA3YMA9MvPY76eOGzKFvOQXGgci3xQcxkihbNJAt0s6hg2joMQUGXP5qMpAzP1OggnlsghB0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791563515; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yY9pOrPW0Uo/XiCmzb6XwFCpi+/y9ZzOUtLQCwhG4RQ=; 
	b=XXnXG+qiCYfMLJfZ5jovFGW55N69dqQaR3cyVQMx1tWe0WHw+qoyYESITSqLbWRp8BKvdM7fm30Hkl5Cp+AVnNWJmo8LaljGQp/VbJKSDlLKYFy/TvHt7C8JOit1g50NEqKn1WG9GPt3tHshTpYfDCEVKzAtjQbhX7SS+JqO7nk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791563515;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=yY9pOrPW0Uo/XiCmzb6XwFCpi+/y9ZzOUtLQCwhG4RQ=;
	b=SOas+qn6cxVuPiSBOtLGKcduOQKE9GwJHPRsgg9ytjGDMl5IrTmW7O26syiiZ0gD
	a4b2hkx22KS5Vd5ydq+2Qg9mfImmkw5IZ7aWN4guyXwdT08bfN/b3fHgkqFRQ+NcWOz
	Rzu254OdLDqKM53Ja6ZSNrl6gWrzSrXGPkFck2U0=
Received: by smtp.zohomail.com with SMTPS id 1791563505186316.48086735770255;
	Fri, 9 Oct 2026 09:31:45 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sat, 10 Oct 2026 00:31:08 +0800
Subject: [PATCH v4 2/2] doc: board: spacemit: document the SpacemiT boot
 image format
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-spacemit-aihd-v4-2-e7152ae4d71a@pigmoral.tech>
References: <20261010-spacemit-aihd-v4-0-e7152ae4d71a@pigmoral.tech>
In-Reply-To: <20261010-spacemit-aihd-v4-0-e7152ae4d71a@pigmoral.tech>
To: u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Glass <sjg@chromium.org>, 
 Daniel Golle <daniel@makrotopia.org>, Randolph Sapp <rs@ti.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Kory Maincent <kory.maincent@bootlin.com>, E Shattow <e@freeshell.de>, 
 Yixun Lan <dlan@kernel.org>, Yao Zi <me@ziyao.cc>, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5560;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=FYt3G7VruvoFzzwDKzghkaVtgduNeiGdqQ+h4E55MxI=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLJOit1Mktgtdnnat03PIq7u3fd2ttfZBx0HuYID77jMW
 zX7qnePZEcpC4MYF4OsmCILl7/4P2sdnm9HBFrvw8xhZQIZwsDFKQATabzGyDBHac/if5cOb7+w
 PYJJ0vvO4tlurCfuv248fIYhetsm4fpnjAwvFjEWPb16P+i+9JYbDPN8DygeP2jLxmV/cIt7YPQ
 8znA2AA==
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

Document the boot image layout shared by the SpacemiT K1 and K3
BootROMs, including the metadata headers and authentication areas.

Describe the K3 non-secure CRC32 path supported by mkimage and provide
an example using the "smtimage" image type with "-n k3".

Tested-by: E Shattow <e@freeshell.de>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Reviewed-by: Yao Zi <me@ziyao.cc>
Reviewed-by: E Shattow <e@freeshell.de>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 doc/board/spacemit/index.rst    |   2 +-
 doc/board/spacemit/smtimage.rst | 144 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 145 insertions(+), 1 deletion(-)

diff --git a/doc/board/spacemit/index.rst b/doc/board/spacemit/index.rst
index 71854e5735bd..2c61410b1616 100644
--- a/doc/board/spacemit/index.rst
+++ b/doc/board/spacemit/index.rst
@@ -8,4 +8,4 @@ SpacemiT
    bananapi-f3
    k1-mmc
    k1-spl
-
+   smtimage
diff --git a/doc/board/spacemit/smtimage.rst b/doc/board/spacemit/smtimage.rst
new file mode 100644
index 000000000000..5b470c169517
--- /dev/null
+++ b/doc/board/spacemit/smtimage.rst
@@ -0,0 +1,144 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+SpacemiT boot image format
+==========================
+
+The BootROM on a SpacemiT K1 or K3 SoC expects the first-stage
+bootloader to be wrapped in a specially constructed image layout.
+
+Image layout
+------------
+
+A fixed 4 KiB prefix contains two 32-byte metadata headers, key slots, and
+signature slots. The aligned SPL payload and a trailing authentication area
+follow::
+
+    offset                                    size
+    0x000  +-------------------------------+
+           | root RSA-2048 modulus         |  0x100
+    0x100  +-------------------------------+
+           | header0                       |  0x020
+    0x120  +-------------------------------+
+           | key-selection metadata        |  0x1e0
+    0x300  +-------------------------------+
+           | OEM public-key slots          |  0x800
+    0xb00  +-------------------------------+
+           | signature0                    |  0x100
+    0xc00  +-------------------------------+
+           | reserved                      |  0x3e0
+    0xfe0  +-------------------------------+
+           | header1                       |  0x020
+    0x1000 +-------------------------------+
+           | SPL payload (32-byte aligned) |
+           +-------------------------------+
+           | signature1                    |  0x100
+           +-------------------------------+
+
+For payload size ``P`` and ``A = ALIGN(P, 32)``, the image size is
+``0x1000 + A + 0x100``.
+
+The payload is aligned to 32 bytes because the BootROM RSA authentication path
+rounds its length up to a multiple of 32 bytes when locating and verifying
+signature1.
+
+Metadata header
+---------------
+
+Both header0 and header1 use the following format:
+
+.. list-table::
+   :header-rows: 1
+
+   * - Offset
+     - Size
+     - Field
+     - Description
+   * - 0x00
+     - 4
+     - ``magic``
+     - ``AIHD``
+   * - 0x04
+     - 1
+     - ``version``
+     - Anti-rollback image version
+   * - 0x05
+     - 1
+     - ``secure``
+     - Zero selects anti-rollback bank 0
+
+       Non-zero selects anti-rollback bank 1
+   * - 0x06
+     - 2
+     - ``reserved``
+     - Reserved
+   * - 0x08
+     - 8
+     - ``image_size``
+     - header0: prefix information
+
+       header1: aligned payload size
+   * - 0x10
+     - 8
+     - ``load_addr``
+     - Unused by the common authentication code
+   * - 0x18
+     - 4
+     - ``header_crc``
+     - K3: CRC32 over header bytes ``[0x00, 0x18)``
+   * - 0x1c
+     - 4
+     - ``image_crc``
+     - K3: CRC32 over the payload in header1 only
+
+``header1.image_size`` records the aligned payload size and therefore
+determines the location of signature1.
+
+Authentication
+--------------
+
+K1 and K3 apply different authentication policies:
+
+.. list-table:: Authentication policy
+   :header-rows: 1
+
+   * - Image variant
+     - Root and OEM keys
+     - Header CRC
+     - Image CRC
+     - signature0
+     - signature1
+   * - K1
+     - RSA-2048 moduli with an eFuse root-hash check when
+       secure boot is enabled
+     - Not checked separately
+     - Not checked separately
+     - Verified with the root key over the byte range ``[0x100, 0xb00)``
+     - Verified with the SPL key over header1 and the aligned payload
+   * - K3 non-secure
+     - Unused
+     - header1 verified
+
+       header0 ignored
+     - Payload CRC32 in header1
+     - Unused
+     - Unused
+   * - K3 secure
+     - RSA-2048 moduli with an eFuse root-hash check
+     - Both verified and covered by RSA
+     - Covered by RSA but not checked separately
+     - Verified with the root key over the byte range ``[0x100, 0xb00)``
+     - Verified with the SPL key over header1 and the aligned payload
+
+K1 verifies both signatures even without a programmed root-key hash. In this
+case, the root key comes from the image and is not authenticated by hardware,
+so the image, keys, and signatures can be replaced together.
+
+K3 uses CRC32 in non-secure boot mode and hardware-rooted RSA in secure boot
+mode.
+
+Creating an image
+-----------------
+
+Package a K3 SPL payload for non-secure boot mode with::
+
+    $ tools/mkimage -T smtimage -n k3 -d u-boot-spl.bin u-boot-spl-mkimage.bin

-- 
2.55.0

