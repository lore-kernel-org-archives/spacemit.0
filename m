Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778F54AB1AB
	for <spacemit@lists.linux.dev>; Mon, 21 Sep 2026 14:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002548; cv=pass; b=WqE+9ChuHp2CmBonYlpsuvPjCiI3m9epp/yUDxOoU+M31KIe+fLYoHMPLAfCegIt8JM0O1EIjsCGUM6JyA1vqYLVNvcDOrMiovoK3hXxsY1+7qwr1pjBXk9i9RetmsDONfgjPXsdsblyiB18DUvoitFsWR1eOFSF2q+L/KHc93M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002548; c=relaxed/simple;
	bh=St5vEHdH5FMMNMUXZFJXszI6K8c7n91kRESeYWu2m6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u5gS82v1ERXSMwWa2vwVroJBoKrl6uVSKlYkFpGYpQI2Fl9mD76TeEh1BOoDY0F9hoRXtSOse0NuwCC+z28fBR3yUP9YDPNGNzos55BuNllX841imtfv+zZmzYsBTxWZ1bqSjVVVoYW6+r8rmPekOfXsajPBsh8oEqgy6nwfzcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=KrMgEnHd; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="KrMgEnHd"
ARC-Seal: i=1; a=rsa-sha256; t=1790002528; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RW8n8pPM6WZzxu5V4+TwG0BInPMTDrB6+gbu0KpsiQp/dXOqetiyhGAfcBWxETrmQCuwSwS+P+KOFgnOifmuyFSd586fkkTmFmUcraYq+VsSVccHo5U9pUwNzKqNdUEoBoYIhaFaIx5KPE33oA6wzqGJhY+I8500sIJ7wMGu6ys=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790002528; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SH7xLS3O407MhBroxy2A7tbQSAEpOwkTiqTlopZlE0k=; 
	b=EcpdtQp+2DGqQPmmp7AfAx4N0Sih9+wT01sfGJDImueyyWIbdf+cAA2cfjsgnwDXYGJlJ3ZMb3BooxglCfpVZqGcNZC3/V5nB/1FBKDwG2NzCOMT/lWDrDj0v99LdyVahHsjGb5NPmm78Tf1dEGFqmGwJINpGQ9ubUtXsdh28ew=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790002528;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=SH7xLS3O407MhBroxy2A7tbQSAEpOwkTiqTlopZlE0k=;
	b=KrMgEnHdbzR/GsrCtjCHlDEhrVHSnuOZbqe7k6XQWk7AU4uhRmG70u79T+T54uNE
	8ZtKX+jra/t4zM7YlLkBfagDRlsd53k7e5b7Wup/afED6+LABIxyS5JosxTHFV/DruP
	lGIqkAtXs34sVpMw8UhJvD0alPCsb+7NyU0dj0YY=
Received: by smtp.zohomail.com with SMTPS id 1790002527490298.21682590776913;
	Mon, 21 Sep 2026 07:55:27 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 21 Sep 2026 22:54:39 +0800
Subject: [PATCH v3 2/2] doc: board: spacemit: document the SpacemiT boot
 image format
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-spacemit-aihd-v3-2-f660fc85d2a5@pigmoral.tech>
References: <20260921-spacemit-aihd-v3-0-f660fc85d2a5@pigmoral.tech>
In-Reply-To: <20260921-spacemit-aihd-v3-0-f660fc85d2a5@pigmoral.tech>
To: u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Glass <sjg@chromium.org>, 
 Daniel Golle <daniel@makrotopia.org>, Randolph Sapp <rs@ti.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Kory Maincent <kory.maincent@bootlin.com>, E Shattow <e@freeshell.de>, 
 Yixun Lan <dlan@kernel.org>, Yao Zi <me@ziyao.cc>, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5375;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=St5vEHdH5FMMNMUXZFJXszI6K8c7n91kRESeYWu2m6E=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLI2urruiX+zfwqDmMnJpONZccdmODkE77CXf23xk9H9Q
 m2W8WXmjlIWBjEuBlkxRRYuf/F/1jo8344ItN6HmcPKBDKEgYtTACbytJnhrxwXO1sNp45x2qGb
 Sr+sHjDfTNuya6uz7ORdTde/GiyvKGdkaLE/afrW43J+8f/3Yh/MDcsr83RSOPSmcgYwCJSLvFH
 hAQA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

Document the boot image layout shared by the SpacemiT K1 and K3
BootROMs, including the metadata headers and authentication areas.

Describe the K3 non-secure CRC32 path supported by mkimage and provide
an example using the "smtimage" image type with "-n k3".

Tested-by: E Shattow <e@freeshell.de>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 doc/board/spacemit/index.rst    |   2 +-
 doc/board/spacemit/smtimage.rst | 143 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 144 insertions(+), 1 deletion(-)

diff --git a/doc/board/spacemit/index.rst b/doc/board/spacemit/index.rst
index a5e35ee12ab6..5797ada37d15 100644
--- a/doc/board/spacemit/index.rst
+++ b/doc/board/spacemit/index.rst
@@ -7,4 +7,4 @@ SpacemiT
 
    bananapi-f3
    k1-spl
-
+   smtimage
diff --git a/doc/board/spacemit/smtimage.rst b/doc/board/spacemit/smtimage.rst
new file mode 100644
index 000000000000..19a5c9972f75
--- /dev/null
+++ b/doc/board/spacemit/smtimage.rst
@@ -0,0 +1,143 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+SpacemiT boot image format
+==========================
+
+The SpacemiT K1 and K3 BootROMs load a SpacemiT boot image as the first-stage
+bootloader (FSBL), either from persistent storage or over USB in MaskROM mode.
+
+Image layout
+------------
+
+K1 and K3 share the same layout. A fixed 4 KiB prefix contains two 32-byte
+metadata headers, key slots, and signature slots. The aligned SPL payload and
+a trailing authentication area follow::
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
+.. list-table::
+   :header-rows: 1
+
+   * - Area
+     - K1
+     - K3 non-secure boot mode
+     - K3 secure boot mode
+   * - Root and OEM keys
+     - RSA-2048 moduli with an eFuse root-hash check when secure boot is
+       enabled
+     - Unused
+     - RSA-2048 moduli with an eFuse root-hash check
+   * - Header CRC
+     - Not checked separately
+     - header1 verified
+
+       header0 ignored
+     - Both verified and covered by RSA
+   * - Image CRC
+     - Not checked separately
+     - Payload CRC32 in header1
+     - Covered by RSA but not checked separately
+   * - signature0
+     - Verified with the root key over ``[0x100, 0xb00)``
+     - Unused
+     - Verified with the root key over ``[0x100, 0xb00)``
+   * - signature1
+     - Verified with the SPL key over header1 and the aligned payload
+     - Unused
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
+U-Boot currently creates only K3 images for non-secure boot mode. Package an
+SPL payload with::
+
+    $ tools/mkimage -T smtimage -n k3 -d u-boot-spl.bin FSBL.bin
+
+K1 images and RSA-authenticated K3 images are not yet supported.

-- 
2.55.0

