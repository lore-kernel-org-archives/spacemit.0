Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815716;
	b=ZMFZP++QgeRWzJq8C6MJCwcBvR1hX2xZHtnxfdEs+SvAuh5gsf/exEEWgKM0ViRNfUm+
	 mdZwL+ETjbCubpmWBotjZzjNJSbF/9B53hVZ5RyObTJSFnGnqa58FLGWMaMFVCu4PPvos
	 EWMrBViOYkqMPd7kUW812bbegpTKz79jQdOTW3+6TxYJPZ0xEVjCV+JajpCP1gVpAHjyv
	 qh+fsqShJwvTCdZjZ58rP46mNhP8Lu9v4b9UP7qctFf7Y1zhseH3AJR6dTN8X9MdLjFRs
	 M2Bkm1GPU9pMVojBGAZK/JNigiN8+guHR6dMv4iPNMWoMgywwd/5pwA6OVO+Fh1KaDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wlwthUQB8tol72ooMeZKyFcpKOFDs2Moeh6kbO8jdj8=;
	b=J74DbCxv23Qn0HZTaucHNhJtx4OXIW7Hea/Fbla9K7f4eQNWR8t8I+Cx/AKBWYQNClkd
	 A8AVwoRq4p9izhs784qpydVIBvXmrnoCNV/uIXKHQBKJqkWYxr2O0zchXO9TbIBlqGMt0
	 UKwSoHAMP2dfzVGZ9MgOkBYNgagFnm/mQegiahnH5ra/tLoRAmLz7olmo7S1uKq+RHjOo
	 HjA1z3wOnGdlgHi0QllGFsPrtgQ8v7VcADpXAIPsvn/bTddIUcRJtMrmBCyhMSCiF9YLC
	 oyXbER4T9YaePFPAYUqEZZ5KCe1sDi+1lnM/9ywImLObSegoLDBmljqyfmKq2JlUtVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOx4zISF;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C53C606A329
	for <spacemit@lists.linux.dev>; Mon, 16 Nov 2026 07:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C53C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOx4zISF
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37628596783so5239819eec.1
        for <spacemit@lists.linux.dev>; Sun, 15 Nov 2026 23:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815714; x=1795420514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wlwthUQB8tol72ooMeZKyFcpKOFDs2Moeh6kbO8jdj8=;
        b=gOx4zISFlBHse+Gclh4PnIZgGdM9j0QBjL0fOWrmq6UAFYhf46n9fIVVZjUa0Faua4
         xAXbplon1n+t0VpJzCpZ/FEq9Ex3Umtzs1Org7fOkY4Ai2Ibn64X7AAJckR9uTt9fmse
         ehQ1pJ3X38VnE/RM58rjEihSJ3cocWsVjj1b1B0jz6MeUn6Y93ED1Cb0J2HnpsrR3cPI
         2ptKurwstTJW6pEKDz2JKNn2+eDLa2KgBHNckNWyeumYPHY2DpUW7SudnJzyKNMo+I2E
         Nj8UfSjSJsPdQVB0mu5gx2zjfq4BmKgwByynmDrpJdWsSS0xopIndWJjVcQJ6pHxUY74
         tnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815714; x=1795420514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wlwthUQB8tol72ooMeZKyFcpKOFDs2Moeh6kbO8jdj8=;
        b=u+raBUc4FLBz6qfgNClY101PeLLckSYCBKHMLZxdP2PIT/GZItExvHcZm9zg68IBsB
         iXf4/97H/wiS7hdwqELQnFCa3r8ubg52OCGMNioSEd5cYv+AqnWXpf+kqFmV2tu7usZj
         6HvhZ9BgLtsD0Dg8gIbQ548ltY0iaW1yjoEEForTIUK8jhF/GNYt+WY0LcNuJVNe9dE8
         ZL4EV8EBq0y9mk9ES6GqE4ANKkMfD2bUF8GYsjzdUdTJGMH9l4Cc7UPnq0F3eFiwZMxF
         IOIrrQ0v9GFYTpuFt8IUwH2tLY8Zu3xo7xs0SIUDf1Fkknmj9X9YaBQKATTJPibuFb2q
         cOCw==
X-Forwarded-Encrypted: i=1; AL+hErF03xvQsc6R0VPYe90IjTYgu5O9IP+Lq00DsvHeV/fv/W02i0+i1SGfYvrp/ea8Lbt2d3wrTnFsqA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+BlcBE2SrhZ+fJIlluq0lhFB6W6Nyj/YZaf35XsEC8iWDhRMjd
	hGtp4SculkrlUbOfbPAyBvB7VF0HPebCAVzqbUremi6CN6xyFSOA2s0C
X-Gm-Gg: AYBFou0okBJ53nsAGd97egZyTgRbOXAwv/TsdZc11KRMEf/sRzSl3Ti5RwGVzpn+BX8
	s1ypcQA/O8kPxecbSw1rZgJc34FHGZFEVhnU52n17qPloxUIZO0X1t2gKCVO7k9TVQtVZ064uah
	yhNEZ0hixPBCs3T0ZDz/aSHoJ9ErN6908ZfLEBwrP/NR37QdvEdb4nZxGBH3sIk5afv5jRMI2bU
	MJyzC7BTXbrz65ZvzIjkXiLpClfRrMdFlxj6HNwa0Zztw5FbBgKPRZNFq5CdevfBkK4N4UOFJgX
	1jgJ+3pr7WPQwWqCK/65kuOaW2yQvJflK9Q1oSeO0QakHrNzV3mdSG5Xw3R+g3ngqIGfqaJ+bQR
	aDITXfT5tDbDzOuePkmwpbi6naBJOiZg5px5Z4XQtdj6o/PtO24vy5iEOTyZBm/ZFsNVJI25R+k
	zfLeG3uuNJKyws+tr4s+m76jF2kPIQMmVw4Cad0ALlzNkLHiVoErY5m8TczVAavGLPCVzf/7q3u
	XwqlpnvqQ6Iil3o3+lIFB+sz84Fq/o7PtQ56jN0Oa/88/A7+vn2thPoWSdMNOGYZSMRcwQJgTM7
	5WnqWBhWcFwW7rHfSgwSyBqO6D6nL5e7Kuv9VS0HZ1wafzxJo5k8
X-Received: by 2002:a05:7301:b14:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-37b4a3a4b7emr5761932eec.4.1794815714344;
        Sun, 15 Nov 2026 23:55:14 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm31398803eec.16.2026.11.15.23.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:55:14 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v2 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Date: Mon, 16 Nov 2026 15:54:22 +0800
Message-ID: <20261116075423.1519438-3-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116075423.1519438-1-duge1256@gmail.com>
References: <20261116075423.1519438-1-duge1256@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
controller. These banks contain temperature calibration parameters and
other configuration data.

Keep the root key and SSK registers outside the exposed bank ranges.

FUSE_READY reports completion of a software-triggered reload. Trigger a
reload through GEU_CONFIG bit 22 with a 1 us reset pulse, then poll
FUSE_READY at a 1 us interval with a 10 ms timeout before taking the
snapshot. Fail probe if the reload times out.

Snapshot the shadow registers with aligned 32-bit reads and expose the
data in little-endian order at controller-relative offsets. Serve reads
from the snapshot and use keepouts for the remaining register ranges.

Enable the AES_WTM clock only while accessing the hardware. Leave its
shared reset deasserted on teardown because WTM_RST resets the entire GEU.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 MAINTAINERS                       |   1 +
 drivers/nvmem/Kconfig             |  11 ++
 drivers/nvmem/Makefile            |   1 +
 drivers/nvmem/spacemit-k3-efuse.c | 199 ++++++++++++++++++++++++++++++
 4 files changed, 212 insertions(+)
 create mode 100644 drivers/nvmem/spacemit-k3-efuse.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0a9eb764ffee..e0af83ecee37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26529,6 +26529,7 @@ SPACEMIT K3 EFUSE DRIVER
 M:	Jiayu Du <duge1256@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
+F:	drivers/nvmem/spacemit-k3-efuse.c
 
 SPACEMIT RESET CONTROLLER DRIVER
 M:	Guodong Xu <docular.xu@gmail.com>
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d2f5bb236663..4a8f975b35c7 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -476,6 +476,17 @@ config NVMEM_SNVS_LPGPR
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-snvs-lpgpr.
 
+config NVMEM_SPACEMIT_K3_EFUSE
+	tristate "SpacemiT K3 eFuse support"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	help
+	  Say Y here to read configuration and calibration data from the
+	  SpacemiT K3 eFuse shadow banks. Programming the fuses is not supported.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called spacemit-k3-efuse.
+
 config NVMEM_SPMI_SDAM
 	tristate "SPMI SDAM Support"
 	depends on SPMI
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5e70bad9f0f9..d29716957faf 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_NVMEM_SC27XX_EFUSE)	+= nvmem-sc27xx-efuse.o
 nvmem-sc27xx-efuse-y			:= sc27xx-efuse.o
 obj-$(CONFIG_NVMEM_SNVS_LPGPR)		+= nvmem_snvs_lpgpr.o
 nvmem_snvs_lpgpr-y			:= snvs_lpgpr.o
+obj-$(CONFIG_NVMEM_SPACEMIT_K3_EFUSE)	+= spacemit-k3-efuse.o
 obj-$(CONFIG_NVMEM_SPMI_SDAM)		+= nvmem_qcom-spmi-sdam.o
 nvmem_qcom-spmi-sdam-y			+= qcom-spmi-sdam.o
 obj-$(CONFIG_NVMEM_SPRD_EFUSE)		+= nvmem_sprd_efuse.o
diff --git a/drivers/nvmem/spacemit-k3-efuse.c b/drivers/nvmem/spacemit-k3-efuse.c
new file mode 100644
index 000000000000..e126902130d4
--- /dev/null
+++ b/drivers/nvmem/spacemit-k3-efuse.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SpacemiT K3 read-only eFuse driver
+ *
+ * Copyright (c) 2026 Spacemit Co. Ltd.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include <asm/byteorder.h>
+
+#define K3_EFUSE_REG_SIZE		0x400
+#define K3_EFUSE_BANK_SIZE		0x20
+#define K3_EFUSE_CONFIG			0x004
+#define K3_EFUSE_SOFTWARE_RESET		BIT(22)
+#define K3_EFUSE_BANK0_OFFSET		0x104
+#define K3_EFUSE_STATUS			0x184
+#define K3_EFUSE_READY			BIT(1)
+#define K3_EFUSE_BANK7_OFFSET		0x190
+#define K3_EFUSE_RESET_DELAY_US		1
+#define K3_EFUSE_POLL_INTERVAL_US	1
+#define K3_EFUSE_POLL_TIMEOUT_US	10000
+
+static const unsigned int k3_efuse_bank_offsets[] = {
+	K3_EFUSE_BANK0_OFFSET,
+	K3_EFUSE_BANK7_OFFSET,
+};
+
+/* Prevent NVMEM reads from exposing the root key and SSK registers. */
+static const struct nvmem_keepout k3_efuse_keepouts[] = {
+	{
+		.start = 0,
+		.end = K3_EFUSE_BANK0_OFFSET,
+	}, {
+		.start = K3_EFUSE_BANK0_OFFSET + K3_EFUSE_BANK_SIZE,
+		.end = K3_EFUSE_BANK7_OFFSET,
+	}, {
+		.start = K3_EFUSE_BANK7_OFFSET + K3_EFUSE_BANK_SIZE,
+		.end = K3_EFUSE_REG_SIZE,
+	},
+};
+
+struct k3_efuse {
+	__le32 data[ARRAY_SIZE(k3_efuse_bank_offsets)][K3_EFUSE_BANK_SIZE / sizeof(u32)];
+};
+
+static int k3_efuse_read(void *context, unsigned int offset, void *val,
+			 size_t bytes)
+{
+	struct k3_efuse *efuse = context;
+	unsigned int bank, index;
+
+	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_bank_offsets); bank++) {
+		if (offset < k3_efuse_bank_offsets[bank])
+			continue;
+
+		index = offset - k3_efuse_bank_offsets[bank];
+		if (index >= K3_EFUSE_BANK_SIZE || bytes > K3_EFUSE_BANK_SIZE - index)
+			continue;
+
+		memcpy(val, (u8 *)efuse->data[bank] + index, bytes);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int k3_efuse_reload(void __iomem *base)
+{
+	u32 val;
+
+	val = readl(base + K3_EFUSE_CONFIG);
+	writel(val | K3_EFUSE_SOFTWARE_RESET, base + K3_EFUSE_CONFIG);
+	readl(base + K3_EFUSE_CONFIG);
+	udelay(K3_EFUSE_RESET_DELAY_US);
+	val = readl(base + K3_EFUSE_CONFIG);
+	writel(val & ~K3_EFUSE_SOFTWARE_RESET, base + K3_EFUSE_CONFIG);
+
+	return readl_poll_timeout(base + K3_EFUSE_STATUS, val,
+				  val & K3_EFUSE_READY,
+				  K3_EFUSE_POLL_INTERVAL_US,
+				  K3_EFUSE_POLL_TIMEOUT_US);
+}
+
+static int k3_efuse_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct nvmem_config config = {
+		.dev = dev,
+		.name = dev_name(dev),
+		.id = NVMEM_DEVID_NONE,
+		.owner = THIS_MODULE,
+		.type = NVMEM_TYPE_OTP,
+		.read_only = true,
+		.root_only = true,
+		.reg_read = k3_efuse_read,
+		.word_size = 1,
+		.stride = 1,
+		.size = K3_EFUSE_REG_SIZE,
+		.keepout = k3_efuse_keepouts,
+		.nkeepout = ARRAY_SIZE(k3_efuse_keepouts),
+	};
+	struct reset_control *reset;
+	struct nvmem_device *nvmem;
+	struct k3_efuse *efuse;
+	void __iomem *base;
+	struct clk *clk;
+	unsigned int bank, i;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	efuse = devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
+	if (!efuse)
+		return -ENOMEM;
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
+
+	reset = devm_reset_control_get_shared(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset\n");
+
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable clock\n");
+
+	/* WTM_RST resets the entire GEU; leave it deasserted on teardown. */
+	ret = reset_control_deassert(reset);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to deassert reset\n");
+		goto disable_clk;
+	}
+
+	ret = k3_efuse_reload(base);
+	if (ret) {
+		dev_err_probe(dev, ret, "Timed out waiting for shadow reload\n");
+		goto disable_clk;
+	}
+
+	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_bank_offsets); bank++) {
+		for (i = 0; i < ARRAY_SIZE(efuse->data[bank]); i++) {
+			u32 val = readl(base + k3_efuse_bank_offsets[bank] + i * sizeof(u32));
+
+			efuse->data[bank][i] = cpu_to_le32(val);
+		}
+	}
+
+	clk_disable_unprepare(clk);
+
+	config.priv = efuse;
+
+	nvmem = devm_nvmem_register(dev, &config);
+	if (IS_ERR(nvmem))
+		return dev_err_probe(dev, PTR_ERR(nvmem), "Failed to register NVMEM\n");
+
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(clk);
+	return ret;
+}
+
+static const struct of_device_id k3_efuse_of_match[] = {
+	{ .compatible = "spacemit,k3-efuse" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, k3_efuse_of_match);
+
+static struct platform_driver k3_efuse_driver = {
+	.probe = k3_efuse_probe,
+	.driver = {
+		.name = "spacemit-k3-efuse",
+		.of_match_table = k3_efuse_of_match,
+	},
+};
+module_platform_driver(k3_efuse_driver);
+
+MODULE_AUTHOR("Jiayu Du <duge1256@gmail.com>");
+MODULE_DESCRIPTION("SpacemiT K3 read-only eFuse driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

